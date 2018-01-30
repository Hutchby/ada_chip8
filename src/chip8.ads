package Chip8 is
   type Short is mod 2**16;
   type Address is mod 2**12;
   type Byte is mod 2**8;
   type InstructionBytes is array (0 .. 1) of Byte;
   type Instruction is mod 2**16;
   type Memory is array (Address'Range) of Byte;
   type RegisterArray is array (0 .. 15) of Byte;
   type ReturnStack is array (0 .. 15) of Address;
   type KeyMap is array (0 .. 15) of Boolean;
   type FrameBuffer is array (0 .. 63, 0 .. 31) of Boolean;
   InstructionLength : constant := 2;

   --  Chip8 memory map:
   --  0x000-0x1FF - Chip8 interpreter, we will use it to store font set
   --  0x050-0x0A0 - Used to store the built-in 4x5 font set
   --  0x200-0xFFF - Program and work memory storage
   type Chip8 is
      record
         Opcode : Short;
         CMemory : Memory;
         V : RegisterArray;
         I : Address;
         PC : Address;
         Screen : FrameBuffer;
         DelayTimer : Byte;
         SoundTimer : Byte;
         Stack : ReturnStack;
         StackIdx : Integer range 0 .. 16;
         Key : KeyMap;
         DrawFlag : Boolean;
      end record;

   --  This type needs to be placed after the declaration of the Chip8 type to
   --  avoid confusion with the package name

   type InstructionProcAccess is access procedure (chip : in out Chip8;
                                                   instr : in InstructionBytes);
   type InstructionArrayType is array (0 .. 33) of InstructionProcAccess;

   function Initialize (cpu : in out Chip8) return InstructionArrayType;
   procedure FetchOpcode (cpu : in out Chip8);
   procedure EmulateCycle (cpu : in out Chip8);

   procedure Jp (cpu : in out Chip8; instr : in InstructionBytes);
   procedure Cls (cpu : in out Chip8; instr : in InstructionBytes);
   procedure Ret (cpu : in out Chip8; instr : in InstructionBytes);
   procedure Call (cpu : in out Chip8; instr : in InstructionBytes);
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
   function GetInstructionValue (bytes : in InstructionBytes)
                                 return Instruction;
   procedure ConditionalJump (cpu : in out Chip8; condition : in Boolean);

end Chip8;
