with Chip8; use Chip8;

package Roms is
   type RomType is array (Address range <>) of Instruction;
   function Pong return RomType;
end Roms;
