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
      SetPc (cpu, (offset + cpu.PC) mod (Memory'Length));
   end AddToPc;

   procedure Jp (cpu : in out Chip8; instr : in InstructionBytes)
   is
      dest : Address := 0;
   begin
      dest := instr (1);
      dest := dest + (instr (0) and 15);
      SetPc (cpu, dest);
   end Jp;

   procedure Ret (cpu : in out Chip8; instr : in InstructionBytes)
   is
   begin
      cpu.StackIdx := cpu.StackIdx - 1;
      SetPc(cpu.Stack (cpu.StackIdx));
   end Ret;
end Chip8;
