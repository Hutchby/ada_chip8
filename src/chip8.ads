package Chip8 is
   subtype Short is Natural range 0 .. 2**16 - 1;
   subtype Address is Natural range 0 .. 2**12 - 1;
   subtype Char is Natural range 0 .. 2**8 - 1;
   type InstructionBytes is array (0 .. 1) of Char;
   type Memory is array (Address'Range) of Char;
   type RegisterArray is array (0 .. 15) of Char;
   type ReturnStack is array (0 .. 15) of Address;
   type KeyMap is array (0 .. 15) of Char;
   type FrameBuffer is array (0 .. 63, 0 .. 31) of Boolean;
   --  Chip8 memory map:
   --  0x000-0x1FF - Chip8 interpreter, we will use it to store font set
   --  0x050-0x0A0 - Used to store the built-in 4x5 font set
   --  0x050-0x0A0 - Program and work memory storage
   type Chip8 is
      record
         Opcode : Short := 0;
         CMemory : Memory;
         V : RegisterArray;
         I : Short;
         PC : Address;
         Screen : FrameBuffer;
         Delay_Timer : Char;
         Sound_Timer : Char;
         Stack : ReturnStack;
         SP : Short;
         Key : KeyMap;
      end record;

   procedure Jmp (cpu : in out Chip8; addr : in Address);
   procedure Ret (cpu : in out Chip8);
private
   procedure SetPc (cpu : in out Chip8; addr : in Address);
   procedure AddToPc (cpu : in out Chip8; offset : in Address);

end Chip8;
