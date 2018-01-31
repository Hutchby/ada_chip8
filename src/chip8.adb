with Roms; use Roms;

package body Chip8 with SPARK_Mode => On is

   function Initialize (cpu : in out Chip8) return InstructionArrayType is
      InstructionArray : InstructionArrayType;
      Rom : constant RomType := Pong;
   begin
      cpu.Opcode := 0;
      --  The rom startx at 0x200.
      cpu.PC := 16#0200#;
      cpu.I := 0;
      cpu.StackIdx := 0;
      cpu.DrawFlag := False;
      cpu.Rnd := 67;
      for I in Address range 0 .. cpu.CMemory'Size - 1 loop
         cpu.CMemory (I) := 0;
      end loop;

      InstructionArray := (Jp'Access, Cls'Access, Ret'Access, Call'Access,
                           SeVB'Access, SneVB'Access, SeVV'Access, LdVB'Access,
                           AddVB'Access, LdVV'Access, OrVV'Access, AndVV'Access,
                           XorVV'Access, AddVV'Access, SubVV'Access, Shr'Access,
                           SubN'Access, Shl'Access, SneV'Access, LdI'Access,
                           JmpV'Access, Rnd'Access, Drw'Access, Skp'Access,
                           Sknp'Access, LdVT'Access, LdK'Access, LdTV'Access,
                           LdSV'Access, AddI'Access, LdFV'Access, LdBV'Access,
                           LdArrV'Access, LdVArr'Access);

      for I in Address range 0 .. Rom'Size - 1 loop
         cpu.CMemory (2 * I + Address (512)) := Byte (Rom (I) / (2 ** 8));
         cpu.CMemory (2 * I + 1 + Address (512)) := Byte (Rom (I) and 16#ff#);
      end loop;

      return InstructionArray;
   end Initialize;

   procedure FetchOpcode (cpu : in out Chip8) is
   begin
      cpu.Opcode := Short (cpu.CMemory (cpu.PC) * (2**8)) or Short (cpu.CMemory (cpu.PC + 1));
   end FetchOpcode;

   procedure EmulateCycle (cpu : in out Chip8) is
   begin
      Emulate_Loop :
      loop
         FetchOpcode (cpu);
         if cpu.DrawFlag then
            null; -- Call the drawing procedure
         end if;
      end loop Emulate_Loop;
   end EmulateCycle;

   procedure SetPc (cpu : in out Chip8; addr : in Address)
   is
   begin
      cpu.PC := addr;
   end SetPc;

   procedure AddToPc (cpu : in out Chip8; offset : in Address)
   is
   begin
      --  Wraparound is done using the mod type properties.
      SetPc (cpu, offset + cpu.PC);
   end AddToPc;


   function GetInstructionValue (bytes : in InstructionBytes)
                                 return Instruction
   is
   begin
      return Instruction (bytes (1)) + Instruction (bytes (0)) * 256;
   end GetInstructionValue;

   procedure ConditionalJump (cpu : in out Chip8; condition : in Boolean)
   is
   begin
      if condition then
         AddToPc (cpu, InstructionLength);
      end if;
      AddToPc (cpu, InstructionLength);
   end ConditionalJump;

   procedure Jp (cpu : in out Chip8; instr : in InstructionBytes)
   is
      dest : Address;
   begin
      dest := Address (GetInstructionValue (instr) mod 16);
      SetPc (cpu, dest);
   end Jp;

   procedure Ret (cpu : in out Chip8; instr : in InstructionBytes)
   is
      pragma Unreferenced (instr);
   begin
      if cpu.StackIdx = 0 then
         return;
      end if;
      cpu.StackIdx := cpu.StackIdx - 1;
      SetPc (cpu, cpu.Stack (cpu.StackIdx));
   end Ret;

   procedure Call (cpu : in out Chip8; instr : in InstructionBytes)
   is
   begin
      if cpu.StackIdx = 16 then
         return;
      end if;
      cpu.Stack (cpu.StackIdx) := cpu.PC + InstructionLength;
      cpu.StackIdx := cpu.StackIdx + 1;
      SetPc (cpu, Address (GetInstructionValue (instr) mod 16));
   end Call;

   procedure SeVB (cpu : in out Chip8; instr : in InstructionBytes)
   is
   begin
      ConditionalJump (cpu, instr (1) = cpu.V (Integer (instr (0) mod 16)));
   end SeVB;

   procedure SneVB (cpu : in out Chip8; instr : in InstructionBytes)
   is
   begin
      ConditionalJump (cpu, instr (1) /= cpu.V (Integer (instr (0) mod 16)));
   end SneVB;

   procedure SeVV (cpu : in out Chip8; instr : in InstructionBytes)
   is
   begin
      ConditionalJump (cpu, cpu.V (Integer (instr (0) mod 16)) =
                            cpu.V (Integer (instr (1)) / 16));
   end SeVV;

   procedure LdVB (cpu : in out Chip8; instr : in InstructionBytes)
   is
   begin
      cpu.V (Integer (instr (0) mod 16)) := instr (1);
      AddToPc (cpu, InstructionLength);
   end LdVB;

   procedure AddVB (cpu : in out Chip8; instr : in InstructionBytes)
   is
      Index : constant Integer := Integer (instr (0) and 16#0f#);
   begin
      cpu.V (Index) := cpu.V (Index) + instr (1);
      AddToPc (cpu, InstructionLength);
   end AddVB;

   procedure LdVV (cpu : in out Chip8; instr : in InstructionBytes)
   is
      Index : constant Integer := Integer (instr (0) and 16#0f#);
      Index2 : constant Integer := Integer (instr (1)) / 16;
   begin
      cpu.V (Index) := cpu.V (Index2);
      AddToPc (cpu, InstructionLength);
   end LdVV;

   procedure OrVV (cpu : in out Chip8; instr : in InstructionBytes)
   is
      Index : constant Integer := Integer (instr (0) mod 16);
      Index2 : constant Integer := Integer (instr (1)) / 16;
   begin
      cpu.V (Index) := cpu.V (Index) or cpu.V (Index2);
      AddToPc (cpu, InstructionLength);
   end OrVV;

   procedure AndVV (cpu : in out Chip8; instr : in InstructionBytes)
   is
      Index : constant Integer := Integer (instr (0) mod 16);
      Index2 : constant Integer := Integer (instr (1) and 16#f0#) / 16;
   begin
      cpu.V (Index) := cpu.V (Index) and cpu.V (Index2);
      AddToPc (cpu, InstructionLength);
   end AndVV;

   procedure XorVV (cpu : in out Chip8; instr : in InstructionBytes)
   is
      Index : constant Integer := Integer (instr (0) mod 16);
      Index2 : constant Integer := Integer (instr (1)) / 16;
   begin
      cpu.V (Index) := cpu.V (Index) xor cpu.V (Index2);
      AddToPc (cpu, InstructionLength);
   end XorVV;

   procedure AddVV (cpu : in out Chip8; instr : in InstructionBytes)
   is
      Index : constant Integer := Integer (instr (0) mod 16);
      Index2 : constant Integer := Integer (instr (1)) / 16;
      Overflow : constant Boolean := Integer (cpu.V (Index))
        + Integer (cpu.V (Index2)) > 255;
   begin
      if Overflow then
         cpu.V (15) := 1;
      else
         cpu.V (15) := 0;
      end if;
      --  Standard is not clear about the order. Doing this second to have
      --  same behaviour as the defined SubVV.
      cpu.V (Index) := cpu.V (Index) + cpu.V (Index2);
      AddToPc (cpu, InstructionLength);
   end AddVV;

   procedure SubVV (cpu : in out Chip8; instr : in InstructionBytes)
   is
      Index : constant Integer := Integer (instr (0) mod 16);
      Index2 : constant Integer := Integer (instr (1) / 16);
      Positive : constant Boolean := Integer (cpu.V (Index)) > Integer (cpu.V (Index2));
   begin
      if Positive then
         cpu.V (15) := 1;
      else
         cpu.V (15) := 0;
      end if;
      cpu.V (Index) := cpu.V (Index) - cpu.V (Index2);
      AddToPc (cpu, InstructionLength);
   end SubVV;

   procedure Shr (cpu : in out Chip8; instr : in InstructionBytes)
   is
      Index : constant Integer := Integer (instr (0) mod 16);
      odd : constant Boolean := cpu.V (Index) mod 2 = 1;
   begin
      if odd then
         cpu.V (15) := 1;
      else
         cpu.V (15) := 0;
      end if;
      cpu.V (Index) := cpu.V (Index / 2);
      AddToPc (cpu, InstructionLength);
   end Shr;

   procedure SubN (cpu : in out Chip8; instr : in InstructionBytes)
   is
      Index : constant Integer := Integer (instr (0) mod 16);
      Index2 : constant Integer := Integer (instr (1)) / 16;
      Positive : constant Boolean := Integer (cpu.V (Index)) > Integer (cpu.V (Index2));
   begin
      if Positive then
         cpu.V (15) := 0;
      else
         cpu.V (15) := 1;
      end if;
      cpu.V (Index) := cpu.V (Index2) - cpu.V (Index);
      AddToPc (cpu, InstructionLength);
   end SubN;

   procedure Shl (cpu : in out Chip8; instr : in InstructionBytes)
   is
      Index : constant Integer := Integer (instr (0) mod 16);
      big : constant Boolean := cpu.V (Index) > 127;
   begin
      if big then
         cpu.V (15) := 1;
      else
         cpu.V (15) := 0;
      end if;
      cpu.V (Index) := cpu.V (Index * 2);
      AddToPc (cpu, InstructionLength);
   end Shl;

   procedure SneV (cpu : in out Chip8; instr : in InstructionBytes)
   is
   begin
      ConditionalJump (cpu, cpu.V (Integer (instr (0) mod 16)) /=
                         cpu.V (Integer (instr (1)) / 16));
   end SneV;

   procedure LdI (cpu : in out Chip8; instr : in InstructionBytes)
   is
      Byte1 : constant Integer := Integer (instr (0) mod 16);
      Byte2 : constant Integer := Integer (instr (1));
   begin
      cpu.I := Address (Byte1) * 256 + Address (Byte2);
      AddToPc (cpu, InstructionLength);
   end LdI;

   procedure JmpV (cpu : in out Chip8; instr : in InstructionBytes)
   is
      Byte1 : constant Integer := Integer (instr (0) mod 16);
      Byte2 : constant Integer := Integer (instr (1));
      Addr : Address := Address (cpu.V (0));
   begin
      Addr := Addr + 256 * Address (Byte1) + Address (Byte2);
      SetPc (cpu, Addr);
   end JmpV;


   procedure Skp (cpu : in out Chip8; instr : in InstructionBytes)
   is
   begin
      ConditionalJump (cpu, cpu.Key (Integer (instr (0) mod 16)));
   end Skp;

   procedure Sknp (cpu : in out Chip8; instr : in InstructionBytes)
   is
   begin
      ConditionalJump (cpu, not cpu.Key (Integer (instr (0) mod 16)));
   end Sknp;

   procedure LdVT (cpu : in out Chip8; instr : in InstructionBytes)
   is
   begin
      cpu.V (Integer (instr (0) mod 16)) := cpu.DelayTimer;
      AddToPc (cpu, InstructionLength);
   end LdVT;

   procedure LdK (cpu : in out Chip8; instr : in InstructionBytes)
   is
   begin
      for Index in cpu.Key'Range loop
         pragma Loop_Invariant (for all X in 0 .. Index - 1 => not cpu.Key (X));
         if cpu.Key (Index) then
            cpu.V (Integer (instr (0) mod 16)) := Byte (Index);
            AddToPc (cpu, InstructionLength);
            return;
         end if;
      end loop;
   end LdK;

   procedure LdTV (cpu : in out Chip8; instr : in InstructionBytes)
   is
   begin
      cpu.DelayTimer := cpu.V (Integer (instr (0) mod 16));
      AddToPc (cpu, InstructionLength);
   end LdTV;

   procedure LdSV (cpu : in out Chip8; instr : in InstructionBytes)
   is
   begin
      cpu.SoundTimer := cpu.V (Integer (instr (0) mod 16));
      AddToPc (cpu, InstructionLength);
   end LdSV;

   procedure AddI (cpu : in out Chip8; instr : in InstructionBytes)
   is
   begin
      cpu.I := cpu.I + Address (cpu.V (Integer (instr (0) and 16#0f#)));
      AddToPc (cpu, InstructionLength);
   end AddI;

   procedure LdFV (cpu : in out Chip8; instr : in InstructionBytes)
   is
   begin
      --  Font start at 0x50, and take 5 bytes.
      cpu.I := 16#50# + Address (5 * Integer (instr (0) mod 16));
      AddToPc (cpu, InstructionLength);
   end LdFV;

   procedure LdBV (cpu : in out Chip8; instr : in InstructionBytes)
   is
      Reg : constant Byte := cpu.V (Integer (instr (0) mod 16));
      Units : constant Byte := Reg mod 10;
      Tens : constant Byte := (Reg / 10) mod 10;
      Hundreds : constant Byte := Reg / 100;
   begin
      --  We here rely on mod types wraparound.
      cpu.CMemory (cpu.I) := Hundreds;
      cpu.CMemory (cpu.I + 1) := Tens;
      cpu.CMemory (cpu.I + 2) := Units;
      AddToPc (cpu, InstructionLength);
   end LdBV;

   procedure LdArrV (cpu : in out Chip8; instr : in InstructionBytes)
   is
      Last : constant Integer := Integer (instr (0) mod 16);
   begin
      for Index in 0 .. Last loop
         cpu.CMemory (cpu.I + Address (Index)) := cpu.V (Index);
      end loop;
      AddToPc (cpu, InstructionLength);
   end LdArrV;

   procedure LdVArr (cpu : in out Chip8; instr : in InstructionBytes)
   is
      Last : constant Integer := Integer (instr (0) mod 16);
   begin
      for Index in 0 .. Last loop
         cpu.V (Index) := cpu.CMemory (cpu.I + Address (Index));
      end loop;
      AddToPc (cpu, InstructionLength);
   end LdVArr;

   procedure Rnd (cpu : in out Chip8; instr : in InstructionBytes)
   is
      Bit : Byte;
      Rnd : Byte;
   begin
      Bit := cpu.Rnd xor (cpu.Rnd / 4) xor (cpu.Rnd / 8) xor (cpu.Rnd / 32);
      Bit := Bit and 1;
      cpu.Rnd := cpu.Rnd / 2 + 128 * Bit;
      Rnd := cpu.Rnd and instr (1);
      cpu.V (Integer (instr (0) mod 16)) := Rnd;
      AddToPc (cpu, InstructionLength);
   end Rnd;
end Chip8;
