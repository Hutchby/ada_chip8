package Chip8 is

   type Short is Natural range (0 .. 2**16 - 1);
   type Address is Natural range (0 .. 2**12 - 1);
   type Char is Natural range (0 .. 2**8 - 1);
   -- Chip8 memory map:
   -- 0x000-0x1FF - Chip8 interpreter, we will use it to store font set
   -- 0x050-0x0A0 - Used to store the built-in 4x5 font set
   -- 0x050-0x0A0 - Program and work memory storage
   type Chip8 is
      record
         Opcode : Short := 0;
         CMemory : Char array range (Address'Range);
         V : Char array range (0 .. 15);
         I : Short;
         PC : Short;
         Screen : Boolean array range (0 .. 64 * 32 - 1);
         Delay_Timer : Char;
         Sound_Timer : Char;
         Stack : Short array range (0 .. 15);
         SP : Short;
         Key : Boolean array range (0 .. 15);

      end record;

end Chip8 ;
