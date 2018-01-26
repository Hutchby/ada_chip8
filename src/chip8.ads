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

   procedure Jp (cpu : in out Chip8; instr : in InstructionBytes);
   procedure Cls (cpu : in out Chip8; instr : in InstructionBytes);
   procedure Ret (cpu : in out Chip8; instr : in InstructionBytes);
   procedure Call (cpu : in out Chip8; instr : in InstructionBytes);
   procedure Jmp (cpu : in out Chip8; instr : in InstructionBytes);
   procedure SeVB (cpu : in out Chip8; instr : in InstructionBytes);
   procedure SneVB (cpu : in out Chip8; instr : in InstructionBytes);
   procedure SeVV (cpu : in out Chip8; instr : in InstructionBytes);
   procedure LdVB (cpu : in out Chip8; instr : in InstructionBytes);
   procedure AddVB (cpu : in out Chip8; instr : in InstructionBytes);
   procedure LdVV (cpu : in out Chip8; instr : in InstructionBytes);
   procedure OrVV (cpu : in out Chip8; instr : in InstructionBytes);
   procedure AndVV (cpu : in out Chip8; instr : in InstructionBytes);
   procedure XorVV (cpu : in out Chip8; instr : in InstructionBytes);
   procedure AddVV (cpu : in out Chip8; instr : in InstructionBytes);
   procedure SubVV (cpu : in out Chip8; instr : in InstructionBytes);
   procedure ShrV (cpu : in out Chip8; instr : in InstructionBytes);
   procedure Shr (cpu : in out Chip8; instr : in InstructionBytes);
   procedure SubN (cpu : in out Chip8; instr : in InstructionBytes);
   procedure Shl (cpu : in out Chip8; instr : in InstructionBytes);
   procedure SneV (cpu : in out Chip8; instr : in InstructionBytes);
   procedure LdI (cpu : in out Chip8; instr : in InstructionBytes);
   procedure JmpV (cpu : in out Chip8; instr : in InstructionBytes);
   procedure Rnd (cpu : in out Chip8; instr : in InstructionBytes);
   procedure Drw (cpu : in out Chip8; instr : in InstructionBytes);
   procedure Skp (cpu : in out Chip8; instr : in InstructionBytes);
   procedure Sknp (cpu : in out Chip8; instr : in InstructionBytes);
   procedure LdVT (cpu : in out Chip8; instr : in InstructionBytes);
   procedure LdK (cpu : in out Chip8; instr : in InstructionBytes);
   procedure LdTV (cpu : in out Chip8; instr : in InstructionBytes);
   procedure LdSV (cpu : in out Chip8; instr : in InstructionBytes);
   procedure AddI (cpu : in out Chip8; instr : in InstructionBytes);
   procedure LdFV (cpu : in out Chip8; instr : in InstructionBytes);
   procedure LdBV (cpu : in out Chip8; instr : in InstructionBytes);
   procedure LdArrV (cpu : in out Chip8; instr : in InstructionBytes);
   procedure LdVArr (cpu : in out Chip8; instr : in InstructionBytes);
private
   procedure SetPc (cpu : in out Chip8; addr : in Address);
   procedure AddToPc (cpu : in out Chip8; offset : in Address);

end Chip8;
