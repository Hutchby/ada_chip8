--  This package has been generated automatically by GNATtest.
--  You are allowed to add your code to the bodies of test routines.
--  Such changes will be kept during further regeneration of this file.
--  All code placed outside of test routine bodies will be lost. The
--  code intended to set up and tear down the test environment should be
--  placed into Chip8.Test_Data.

with AUnit.Assertions; use AUnit.Assertions;
with System.Assertions;

--  begin read only
--  id:2.2/00/
--
--  This section can be used to add with clauses if necessary.
--
--  end read only

--  begin read only
--  end read only
package body Chip8.Test_Data.Tests is

--  begin read only
--  id:2.2/01/
--
--  This section can be used to add global variables and other elements.
--
--  end read only

   cpu : Chip8 := (
	   Opcode => 0,
           CMemory => (others => 0), 
	   V => (others => 0),
	   I => 0,
	   PC => 0,
	   Screen => (others => (others => FALSE)), 
	   DelayTimer => 0,
	   SoundTimer => 0,
	   Stack => (others => 0),
	   StackIdx => 0,
	   Key => (others => FALSE),
	   DrawFlag => FALSE);
--  begin read only
--  end read only

--  begin read only
   procedure Test_Jp (Gnattest_T : in out Test);
   procedure Test_Jp_1ac3cb (Gnattest_T : in out Test) renames Test_Jp;
--  id:2.2/1ac3cbe96c588319/Jp/1/0/
   procedure Test_Jp (Gnattest_T : in out Test) is
   --  chip8.ads:44:4:Jp
--  end read only
      inst : InstructionBytes := (16#B0#, 16#01#);
      pragma Unreferenced (Gnattest_T);

   begin
      cpu.pc := 0;
      Jp(cpu, inst);
      AUnit.Assertions.Assert
        (cpu.pc = 1,
         "Jp: CPU pc is not 1");

--  begin read only
   end Test_Jp;
--  end read only

--  begin read only
   procedure Test_Ret (Gnattest_T : in out Test);
   procedure Test_Ret_a5fc94 (Gnattest_T : in out Test) renames Test_Ret;
--  id:2.2/a5fc946e40a171df/Ret/1/0/
   procedure Test_Ret (Gnattest_T : in out Test) is
   --  chip8.ads:46:4:Ret
--  end read only

      inst : InstructionBytes := (0, 245);
      pragma Unreferenced (Gnattest_T);

   begin

      cpu.pc := 0;
      cpu.StackIdx := 0;
      cpu.Stack (0) := 1;
      ret(cpu, inst);
      AUnit.Assertions.Assert
        (cpu.pc = 0,
         "Ret: CPU pc is not 0");
      AUnit.Assertions.Assert
        (cpu.StackIdx = 0,
         "Ret: CPU stack index is not 0");

      cpu.StackIdx := 1;
      ret(cpu, inst);
      AUnit.Assertions.Assert
        (cpu.StackIdx = 0,
         "Ret: CPU stack index is not 0");
      AUnit.Assertions.Assert
        (cpu.pc = 1,
         "Ret: CPU pc is not 1");


--  begin read only
   end Test_Ret;
--  end read only


--  begin read only
   procedure Test_Call (Gnattest_T : in out Test);
   procedure Test_Call_aac095 (Gnattest_T : in out Test) renames Test_Call;
--  id:2.2/aac0958460036abf/Call/1/0/
   procedure Test_Call (Gnattest_T : in out Test) is
   --  chip8.ads:47:4:Call
--  end read only
      inst : InstructionBytes := (32, 1);
      pragma Unreferenced (Gnattest_T);

   begin

     cpu.pc := 0;
     cpu.StackIdx := 16;
     call(cpu, inst);
      AUnit.Assertions.Assert
        (cpu.pc = 0,
         "Call: CPU pc is not 0");

      AUnit.Assertions.Assert
        (cpu.StackIdx = 16,
         "Call: CPU Stack index is not 16");

     cpu.pc := 2;
     cpu.StackIdx := 0;
     call(cpu, inst);
     
     AUnit.Assertions.Assert
        (cpu.StackIdx = 1,
         "Call: CPU Stack index is not 1");
      AUnit.Assertions.Assert
        (cpu.pc = 1,
         "Call: pc is not 1");
      AUnit.Assertions.Assert
        (cpu.Stack (0) = 4,
         "Call: CPU stack(0) is not 2");


--  begin read only
   end Test_Call;
--  end read only

--  begin read only
   procedure Test_LdK (Gnattest_T : in out Test);
   procedure Test_LdK_bd625b (Gnattest_T : in out Test) renames Test_LdK;
--  id:2.2/bd625b28a14aef94/LdK/1/0/
   inst : InstructionBytes := (128, 10);
   procedure Test_LdK (Gnattest_T : in out Test) is
   --  chip8.ads:70:4:LdK
--  end read only


      pragma Unreferenced (Gnattest_T);

   begin
     
      cpu.pc := 0;
      cpu.Key := (others => FALSE);
      Ldk(cpu, inst);
      AUnit.Assertions.Assert
        (cpu.pc = 0,
         "CPU pc is not 0");

      cpu.Key (1) := TRUE;

      Ldk(cpu, inst);
      AUnit.Assertions.Assert
        (cpu.pc = 2,
         "Ldk: CPU pc is not 2");
      AUnit.Assertions.Assert
        (cpu.V (0) = 1,
         "Ldk: CPU V(0) is not 1");

--  begin read only
   end Test_LdK;
--  end read only

--  begin read only
   procedure Test_LdFV (Gnattest_T : in out Test);
   procedure Test_LdFV_b0045b (Gnattest_T : in out Test) renames Test_LdFV;
--  id:2.2/b0045b9c1bfe6b86/LdFV/1/0/
   procedure Test_LdFV (Gnattest_T : in out Test) is
   --  chip8.ads:74:4:LdFV
--  end read only

      inst1 : InstructionBytes := (16#F0#, 16#29#);
      inst2 : InstructionBytes := (16#F1#, 16#29#);
      pragma Unreferenced (Gnattest_T);

   begin
      
      cpu.I := 0;
      cpu.pc := 0;
      ldFV(cpu, inst1);
      AUnit.Assertions.Assert
        (cpu.I = 16#50#,
         "CPU I is not 0x50");
      AUnit.Assertions.Assert
        (cpu.pc = 2,
         "CPU pc is not 2");
      
      cpu.I := 0;
      ldFV(cpu, inst2);
      AUnit.Assertions.Assert
        (cpu.I = 16#55#,
         "CPU I is not is not 0x50");
      AUnit.Assertions.Assert
        (cpu.pc = 4,
         "CPU pc is not is not 4");

--  begin read only
   end Test_LdFV;
--  end read only

--  begin read only
--  id:2.2/02/
--
--  This section can be used to add elaboration code for the global state.
--
begin
--  end read only
   null;
--  begin read only
--  end read only
end Chip8.Test_Data.Tests;
