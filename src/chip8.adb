package body Chip8 is

   procedure Fetch_Opcode (Chip : in out Chip8) is
   begin
      Chip.Opcode := Chip.ChipMemory[Chip.PC] << 8 | Chip.CMemory[PC + 1];
   end Fetch_Opcode;

end Chip8;
