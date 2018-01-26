package body Chip8 is

   procedure Fetch_Opcode (Chip : in out Chip8) is
   begin
      Chip.Opcode := Chip.ChipMemory[Chip.PC] << 8 | Chip.CMemory[PC + 1];
   end Fetch_Opcode;

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

   procedure SubVV (cpu : in out Chip8; instr : in InstructionBytes)   is
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

end Chip8;
