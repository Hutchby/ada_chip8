with Roms; use Roms;

package body Chip8 is

   function Initialize (cpu : in out Chip8) return InstructionArrayType is
      InstructionArray : InstructionArrayType;
      Rom : constant RomType := Pong;
   begin
      cpu.Opcode := 0;
      cpu.PC := 16#0200#;
      cpu.I := 0;
      cpu.StackIdx := 0;
      cpu.DrawFlag := False;
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
         cpu.PC := cpu.PC + 2;
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
      dest : Address := 0;
   begin
      dest := Address (GetInstructionValue (instr) and 16#0fff#);
      SetPc (cpu, dest);
   end Jp;

   procedure Ret (cpu : in out Chip8; instr : in InstructionBytes)
   is
   begin
      cpu.StackIdx := cpu.StackIdx - 1;
      SetPc (cpu, cpu.Stack (cpu.StackIdx));
      AddToPc (cpu, InstructionLength);
   end Ret;

   procedure Call (cpu : in out Chip8; instr : in InstructionBytes)
   is
   begin
      cpu.Stack (cpu.StackIdx) := cpu.PC;
      cpu.StackIdx := cpu.StackIdx + 1;
      SetPc (cpu, Address (GetInstructionValue (instr) and 16#0fff#));
   end Call;

   procedure SeVB (cpu : in out Chip8; instr : in InstructionBytes)
   is
   begin
      ConditionalJump (cpu, instr (1) = cpu.V (Integer (instr (0) and 16#0f#)));
   end SeVB;

   procedure SneVB (cpu : in out Chip8; instr : in InstructionBytes)
   is
   begin
      ConditionalJump (cpu, instr (1) /= cpu.V (Integer (instr (0)
                       and 16#0f#)));
   end SneVB;

   procedure SeVV (cpu : in out Chip8; instr : in InstructionBytes)
   is
   begin
      ConditionalJump (cpu, cpu.V (Integer (instr (0) and 16#0f#)) =
                            cpu.V (Integer (instr (1) and 16#f0#) / 16));
   end SeVV;

   procedure LdVB (cpu : in out Chip8; instr : in InstructionBytes)
   is
   begin
      cpu.V (Integer (instr (0) and 16#0f#)) := instr (1);
      AddToPc (cpu, InstructionLength);
   end LdVB;

   procedure AddVB (cpu : in out Chip8; instr : in InstructionBytes)
   is
      Index : Integer := Integer (instr (0) and 16#0f#);
   begin
      cpu.V (Index) := cpu.V (Index) + instr (1);
      AddToPc (cpu, InstructionLength);
   end AddVB;

   procedure LdVV (cpu : in out Chip8; instr : in InstructionBytes)
   is
      Index : Integer := Integer (instr (0) and 16#0f#);
      Index2 : Integer := Integer (instr (1) and 16#f0#) / 16;
   begin
      cpu.V (Index) := cpu.V (Index2);
      AddToPc (cpu, InstructionLength);
   end LdVV;

   procedure OrVV (cpu : in out Chip8; instr : in InstructionBytes)
   is
      Index : Integer := Integer (instr (0) and 16#0f#);
      Index2 : Integer := Integer (instr (1) and 16#f0#) / 16;
   begin
      cpu.V (Index) := cpu.V (Index) or cpu.V (Index2);
      AddToPc (cpu, InstructionLength);
   end OrVV;

   procedure AndVV (cpu : in out Chip8; instr : in InstructionBytes)
   is
      Index : Integer := Integer (instr (0) and 16#0f#);
      Index2 : Integer := Integer (instr (1) and 16#f0#) / 16;
   begin
      cpu.V (Index) := cpu.V (Index) and cpu.V (Index2);
      AddToPc (cpu, InstructionLength);
   end AndVV;

   procedure XorVV (cpu : in out Chip8; instr : in InstructionBytes)
   is
      Index : Integer := Integer (instr (0) and 16#0f#);
      Index2 : Integer := Integer (instr (1) and 16#f0#) / 16;
   begin
      cpu.V (Index) := cpu.V (Index) xor cpu.V (Index2);
      AddToPc (cpu, InstructionLength);
   end XorVV;

   procedure AddVV (cpu : in out Chip8; instr : in InstructionBytes)
   is
      Index : Integer := Integer (instr (0) and 16#0f#);
      Index2 : Integer := Integer (instr (1) and 16#f0#) / 16;
      Overflow : Boolean := Integer (cpu.V (Index)) + Integer (cpu.V (Index2)) >
                         255;
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
      Index : Integer := Integer (instr (0) and 16#0f#);
      Index2 : Integer := Integer (instr (1) and 16#f0#) / 16;
      Positive : Boolean := Integer (cpu.V (Index)) > Integer (cpu.V (Index2));
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
      Index : Integer := Integer (instr (0) and 16#0f#);
      Index2 : Integer := Integer (instr (1) and 16#f0#) / 16;
      odd : Boolean := cpu.V (Index) mod 2 = 1;
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
      Index : Integer := Integer (instr (0) and 16#0f#);
      Index2 : Integer := Integer (instr (1) and 16#f0#) / 16;
      Positive : Boolean := Integer (cpu.V (Index)) > Integer (cpu.V (Index2));
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
      Index : Integer := Integer (instr (0) and 16#0f#);
      Index2 : Integer := Integer (instr (1) and 16#f0#) / 16;
      big : Boolean := cpu.V (Index) > 127;
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
      ConditionalJump (cpu, cpu.V (Integer (instr (0) and 16#0f#)) /=
                         cpu.V (Integer (instr (1) and 16#f0#) / 16));
   end SneV;

   procedure LdI (cpu : in out Chip8; instr : in InstructionBytes)
   is
      Byte1 : Integer := Integer (instr (0) and 16#0f#);
      Byte2 : Integer := Integer (instr (1) and 16#ff#);
   begin
      cpu.I := Address (Byte1) * 256 + Address (Byte2);
      AddToPc (cpu, InstructionLength);
   end LdI;

   procedure JmpV (cpu : in out Chip8; instr : in InstructionBytes)
   is
      Byte1 : Integer := Integer (instr (0) and 16#0f#);
      Byte2 : Integer := Integer (instr (1) and 16#ff#);
      Addr : Address := Address (cpu.V (0));
   begin
      Addr := Addr + 256 * Address (Byte1) + Address (Byte2);
      SetPc (cpu, Addr);
   end JmpV;


end Chip8;
