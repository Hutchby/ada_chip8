package Chip8 with SPARK_Mode => On is
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
   type CountType is mod 17;
   type FontBuffer is array (0 .. 16 * 5 - 1) of Byte;
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
         Rnd : Byte;
      end record;

   --  This type needs to be placed after the declaration of the Chip8 type to
   --  avoid confusion with the package name

   procedure Initialize (cpu : in out Chip8);
   procedure FetchOpcode (cpu : in out Chip8);
   procedure Execute0 (cpu : in out Chip8; instr : in InstructionBytes);
   procedure Execute8 (cpu : in out Chip8; instr : in InstructionBytes);
   procedure ExecuteE (cpu : in out Chip8; instr : in InstructionBytes);
   procedure ExecuteF (cpu : in out Chip8; instr : in InstructionBytes);
   procedure ExecuteOpcode (cpu : in out Chip8);
   procedure EmulateCycle (cpu : in out Chip8);

   --  Jump to an arbitrary location.
   procedure Jp (cpu : in out Chip8; instr : in InstructionBytes);
   --  Clears the screen.
   procedure Cls (cpu : in out Chip8; instr : in InstructionBytes);
   --  Return from a function.
   procedure Ret (cpu : in out Chip8; instr : in InstructionBytes);
   --  Jump to a function.
   procedure Call (cpu : in out Chip8; instr : in InstructionBytes);
   --  Jump if equal.
   procedure SeVB (cpu : in out Chip8; instr : in InstructionBytes);
   --  Jump if different
   procedure SneVB (cpu : in out Chip8; instr : in InstructionBytes);
   --  Jump if two registers are equal.
   procedure SeVV (cpu : in out Chip8; instr : in InstructionBytes);
   --  Load constant
   procedure LdVB (cpu : in out Chip8; instr : in InstructionBytes);
   --  Add a constant
   procedure AddVB (cpu : in out Chip8; instr : in InstructionBytes);
   --  Load from a register.
   procedure LdVV (cpu : in out Chip8; instr : in InstructionBytes);
   --  Or between registers.
   procedure OrVV (cpu : in out Chip8; instr : in InstructionBytes);
   --  And between registers.
   procedure AndVV (cpu : in out Chip8; instr : in InstructionBytes);
   --  Xor between registers.
   procedure XorVV (cpu : in out Chip8; instr : in InstructionBytes);
   --  Add two registers.
   procedure AddVV (cpu : in out Chip8; instr : in InstructionBytes);
   --  Substract two registers.
   procedure SubVV (cpu : in out Chip8; instr : in InstructionBytes);
   --  Divide by two.
   procedure Shr (cpu : in out Chip8; instr : in InstructionBytes);
   --  Substract in the other direction.
   procedure SubN (cpu : in out Chip8; instr : in InstructionBytes);
   --  Multiply a register by two.
   procedure Shl (cpu : in out Chip8; instr : in InstructionBytes);
   --  Jump if two registers are different.
   procedure SneV (cpu : in out Chip8; instr : in InstructionBytes);
   --  Load a constant into I.
   procedure LdI (cpu : in out Chip8; instr : in InstructionBytes);
   --  Jump to an address + V0.
   procedure JmpV (cpu : in out Chip8; instr : in InstructionBytes);
   --  Generate a random number.
   procedure Rnd (cpu : in out Chip8; instr : in InstructionBytes);
   --  Draw a sprite.
   procedure Drw (cpu : in out Chip8; instr : in InstructionBytes);
   --  Jump if the selected key is pressed.
   procedure Skp (cpu : in out Chip8; instr : in InstructionBytes);
   --  Jump if the selected key is not pressed.
   procedure Sknp (cpu : in out Chip8; instr : in InstructionBytes);
   --  Load the delay timer.
   procedure LdVT (cpu : in out Chip8; instr : in InstructionBytes);
   --  Wait for a key.
   procedure LdK (cpu : in out Chip8; instr : in InstructionBytes);
   --  Load a value into the delay timer.
   procedure LdTV (cpu : in out Chip8; instr : in InstructionBytes);
   --  Load a value into the sound timer.
   procedure LdSV (cpu : in out Chip8; instr : in InstructionBytes);
   --  Add Vx to I.
   procedure AddI (cpu : in out Chip8; instr : in InstructionBytes);
   --  Load the address of a sprite.
   procedure LdFV (cpu : in out Chip8; instr : in InstructionBytes);
   --  Store the BCD of Vx.
   procedure LdBV (cpu : in out Chip8; instr : in InstructionBytes);
   --  Store n registers to the memory
   procedure LdArrV (cpu : in out Chip8; instr : in InstructionBytes);
   --  Load n registers from the memory.
   procedure LdVArr (cpu : in out Chip8; instr : in InstructionBytes);
private
   --  Set PC to an arbitrary address.
   procedure SetPc (cpu : in out Chip8; addr : in Address)
     with Post => cpu.PC = addr;
   --  Add an arbitrary address to PC.
   procedure AddToPc (cpu : in out Chip8; offset : in Address)
     with Post => cpu.PC = offset + cpu.PC'Old;
   --  Return a number from an instruction representing it.
   function GetInstructionValue (bytes : in InstructionBytes)
                                 return Instruction
     with Post => GetInstructionValue'Result = Instruction (bytes (1)) + Instruction (bytes (0)) * 256;
   --  Jump by an additional 2 if the condition is true.
   procedure ConditionalJump (cpu : in out Chip8; condition : in Boolean);

end Chip8;
