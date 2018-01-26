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
         AddToPc (cpu, 2);
      end if;
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
                            cpu.V (Integer (instr (1) and 16#f0#)));
   end SeVV;

   procedure LdVB (cpu : in out Chip8; instr : in InstructionBytes)
   is
   begin
      cpu.V (Integer (instr (0) and 16#0f#)) := instr (1);
   end LdVB;

end Chip8;
