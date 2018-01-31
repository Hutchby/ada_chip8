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
   procedure Test_Initialize (Gnattest_T : in out Test);
   procedure Test_Initialize_8ce202 (Gnattest_T : in out Test) renames Test_Initialize;
--  id:2.2/8ce20227d12007e8/Initialize/1/0/
   procedure Test_Initialize (Gnattest_T : in out Test) is
   --  chip8.ads:40:4:Initialize
--  end read only

      Insts : InstructionArrayType;
      pragma Unreferenced (Gnattest_T);

   begin
      Insts := Initialize(cpu);

      AUnit.Assertions.Assert
        (cpu.PC = 16#0200#,
         "test init");

--  begin read only
   end Test_Initialize;
--  end read only


--  begin read only
   procedure Test_FetchOpcode (Gnattest_T : in out Test);
   procedure Test_FetchOpcode_994135 (Gnattest_T : in out Test) renames Test_FetchOpcode;
--  id:2.2/99413594187a4c84/FetchOpcode/1/0/
   procedure Test_FetchOpcode (Gnattest_T : in out Test) is
   --  chip8.ads:41:4:FetchOpcode
--  end read only

      pragma Unreferenced (Gnattest_T);

   begin

      AUnit.Assertions.Assert
        (Gnattest_Generated.Default_Assert_Value,
         "Test not implemented.");

--  begin read only
   end Test_FetchOpcode;
--  end read only


--  begin read only
   procedure Test_EmulateCycle (Gnattest_T : in out Test);
   procedure Test_EmulateCycle_788153 (Gnattest_T : in out Test) renames Test_EmulateCycle;
--  id:2.2/78815375845183bd/EmulateCycle/1/0/
   procedure Test_EmulateCycle (Gnattest_T : in out Test) is
   --  chip8.ads:42:4:EmulateCycle
--  end read only

      pragma Unreferenced (Gnattest_T);

   begin

      AUnit.Assertions.Assert
        (Gnattest_Generated.Default_Assert_Value,
         "Test not implemented.");

--  begin read only
   end Test_EmulateCycle;
--  end read only


--  begin read only
   procedure Test_Jp (Gnattest_T : in out Test);
   procedure Test_Jp_1ac3cb (Gnattest_T : in out Test) renames Test_Jp;
--  id:2.2/1ac3cbe96c588319/Jp/1/0/
   procedure Test_Jp (Gnattest_T : in out Test) is
   --  chip8.ads:44:4:Jp
--  end read only

      pragma Unreferenced (Gnattest_T);

   begin

      AUnit.Assertions.Assert
        (Gnattest_Generated.Default_Assert_Value,
         "Test not implemented.");

--  begin read only
   end Test_Jp;
--  end read only


--  begin read only
   procedure Test_Cls (Gnattest_T : in out Test);
   procedure Test_Cls_1efc61 (Gnattest_T : in out Test) renames Test_Cls;
--  id:2.2/1efc61f72f99268d/Cls/1/0/
   procedure Test_Cls (Gnattest_T : in out Test) is
   --  chip8.ads:45:4:Cls
--  end read only

      pragma Unreferenced (Gnattest_T);

   begin

      AUnit.Assertions.Assert
        (Gnattest_Generated.Default_Assert_Value,
         "Test not implemented.");

--  begin read only
   end Test_Cls;
--  end read only


--  begin read only
   procedure Test_Ret (Gnattest_T : in out Test);
   procedure Test_Ret_a5fc94 (Gnattest_T : in out Test) renames Test_Ret;
--  id:2.2/a5fc946e40a171df/Ret/1/0/
   procedure Test_Ret (Gnattest_T : in out Test) is
   --  chip8.ads:46:4:Ret
--  end read only

      pragma Unreferenced (Gnattest_T);

   begin

      AUnit.Assertions.Assert
        (Gnattest_Generated.Default_Assert_Value,
         "Test not implemented.");

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

      pragma Unreferenced (Gnattest_T);

   begin

      AUnit.Assertions.Assert
        (Gnattest_Generated.Default_Assert_Value,
         "Test not implemented.");

--  begin read only
   end Test_Call;
--  end read only


--  begin read only
   procedure Test_SeVB (Gnattest_T : in out Test);
   procedure Test_SeVB_101888 (Gnattest_T : in out Test) renames Test_SeVB;
--  id:2.2/101888eed2cb17ee/SeVB/1/0/
   procedure Test_SeVB (Gnattest_T : in out Test) is
   --  chip8.ads:48:4:SeVB
--  end read only

      pragma Unreferenced (Gnattest_T);

   begin

      AUnit.Assertions.Assert
        (Gnattest_Generated.Default_Assert_Value,
         "Test not implemented.");

--  begin read only
   end Test_SeVB;
--  end read only


--  begin read only
   procedure Test_SneVB (Gnattest_T : in out Test);
   procedure Test_SneVB_99e8d5 (Gnattest_T : in out Test) renames Test_SneVB;
--  id:2.2/99e8d5a7fb067751/SneVB/1/0/
   procedure Test_SneVB (Gnattest_T : in out Test) is
   --  chip8.ads:49:4:SneVB
--  end read only

      pragma Unreferenced (Gnattest_T);

   begin

      AUnit.Assertions.Assert
        (Gnattest_Generated.Default_Assert_Value,
         "Test not implemented.");

--  begin read only
   end Test_SneVB;
--  end read only


--  begin read only
   procedure Test_SeVV (Gnattest_T : in out Test);
   procedure Test_SeVV_13d2d3 (Gnattest_T : in out Test) renames Test_SeVV;
--  id:2.2/13d2d3bd53838282/SeVV/1/0/
   procedure Test_SeVV (Gnattest_T : in out Test) is
   --  chip8.ads:50:4:SeVV
--  end read only

      pragma Unreferenced (Gnattest_T);

   begin

      AUnit.Assertions.Assert
        (Gnattest_Generated.Default_Assert_Value,
         "Test not implemented.");

--  begin read only
   end Test_SeVV;
--  end read only


--  begin read only
   procedure Test_LdVB (Gnattest_T : in out Test);
   procedure Test_LdVB_453c04 (Gnattest_T : in out Test) renames Test_LdVB;
--  id:2.2/453c04f5858656ac/LdVB/1/0/
   procedure Test_LdVB (Gnattest_T : in out Test) is
   --  chip8.ads:51:4:LdVB
--  end read only

      pragma Unreferenced (Gnattest_T);

   begin

      AUnit.Assertions.Assert
        (Gnattest_Generated.Default_Assert_Value,
         "Test not implemented.");

--  begin read only
   end Test_LdVB;
--  end read only


--  begin read only
   procedure Test_AddVB (Gnattest_T : in out Test);
   procedure Test_AddVB_d51fed (Gnattest_T : in out Test) renames Test_AddVB;
--  id:2.2/d51fed36f53d26f0/AddVB/1/0/
   procedure Test_AddVB (Gnattest_T : in out Test) is
   --  chip8.ads:52:4:AddVB
--  end read only

      pragma Unreferenced (Gnattest_T);

   begin

      AUnit.Assertions.Assert
        (Gnattest_Generated.Default_Assert_Value,
         "Test not implemented.");

--  begin read only
   end Test_AddVB;
--  end read only


--  begin read only
   procedure Test_LdVV (Gnattest_T : in out Test);
   procedure Test_LdVV_53aa27 (Gnattest_T : in out Test) renames Test_LdVV;
--  id:2.2/53aa2739354db491/LdVV/1/0/
   procedure Test_LdVV (Gnattest_T : in out Test) is
   --  chip8.ads:53:4:LdVV
--  end read only

      pragma Unreferenced (Gnattest_T);

   begin

      AUnit.Assertions.Assert
        (Gnattest_Generated.Default_Assert_Value,
         "Test not implemented.");

--  begin read only
   end Test_LdVV;
--  end read only


--  begin read only
   procedure Test_OrVV (Gnattest_T : in out Test);
   procedure Test_OrVV_f9f9ca (Gnattest_T : in out Test) renames Test_OrVV;
--  id:2.2/f9f9ca2ab1c036d3/OrVV/1/0/
   procedure Test_OrVV (Gnattest_T : in out Test) is
   --  chip8.ads:54:4:OrVV
--  end read only

      pragma Unreferenced (Gnattest_T);

   begin

      AUnit.Assertions.Assert
        (Gnattest_Generated.Default_Assert_Value,
         "Test not implemented.");

--  begin read only
   end Test_OrVV;
--  end read only


--  begin read only
   procedure Test_AndVV (Gnattest_T : in out Test);
   procedure Test_AndVV_7f3983 (Gnattest_T : in out Test) renames Test_AndVV;
--  id:2.2/7f3983272b68f8f1/AndVV/1/0/
   procedure Test_AndVV (Gnattest_T : in out Test) is
   --  chip8.ads:55:4:AndVV
--  end read only

      pragma Unreferenced (Gnattest_T);

   begin

      AUnit.Assertions.Assert
        (Gnattest_Generated.Default_Assert_Value,
         "Test not implemented.");

--  begin read only
   end Test_AndVV;
--  end read only


--  begin read only
   procedure Test_XorVV (Gnattest_T : in out Test);
   procedure Test_XorVV_3a303e (Gnattest_T : in out Test) renames Test_XorVV;
--  id:2.2/3a303ead940c54a7/XorVV/1/0/
   procedure Test_XorVV (Gnattest_T : in out Test) is
   --  chip8.ads:56:4:XorVV
--  end read only

      pragma Unreferenced (Gnattest_T);

   begin

      AUnit.Assertions.Assert
        (Gnattest_Generated.Default_Assert_Value,
         "Test not implemented.");

--  begin read only
   end Test_XorVV;
--  end read only


--  begin read only
   procedure Test_AddVV (Gnattest_T : in out Test);
   procedure Test_AddVV_dea81c (Gnattest_T : in out Test) renames Test_AddVV;
--  id:2.2/dea81c4a70e4bfe8/AddVV/1/0/
   procedure Test_AddVV (Gnattest_T : in out Test) is
   --  chip8.ads:57:4:AddVV
--  end read only

      pragma Unreferenced (Gnattest_T);

   begin

      AUnit.Assertions.Assert
        (Gnattest_Generated.Default_Assert_Value,
         "Test not implemented.");

--  begin read only
   end Test_AddVV;
--  end read only


--  begin read only
   procedure Test_SubVV (Gnattest_T : in out Test);
   procedure Test_SubVV_417abe (Gnattest_T : in out Test) renames Test_SubVV;
--  id:2.2/417abefa64b3b227/SubVV/1/0/
   procedure Test_SubVV (Gnattest_T : in out Test) is
   --  chip8.ads:58:4:SubVV
--  end read only

      pragma Unreferenced (Gnattest_T);

   begin

      AUnit.Assertions.Assert
        (Gnattest_Generated.Default_Assert_Value,
         "Test not implemented.");

--  begin read only
   end Test_SubVV;
--  end read only


--  begin read only
   procedure Test_Shr (Gnattest_T : in out Test);
   procedure Test_Shr_8593c5 (Gnattest_T : in out Test) renames Test_Shr;
--  id:2.2/8593c5282ae32da2/Shr/1/0/
   procedure Test_Shr (Gnattest_T : in out Test) is
   --  chip8.ads:59:4:Shr
--  end read only

      pragma Unreferenced (Gnattest_T);

   begin

      AUnit.Assertions.Assert
        (Gnattest_Generated.Default_Assert_Value,
         "Test not implemented.");

--  begin read only
   end Test_Shr;
--  end read only


--  begin read only
   procedure Test_SubN (Gnattest_T : in out Test);
   procedure Test_SubN_2cf0cc (Gnattest_T : in out Test) renames Test_SubN;
--  id:2.2/2cf0cccdab9041b9/SubN/1/0/
   procedure Test_SubN (Gnattest_T : in out Test) is
   --  chip8.ads:60:4:SubN
--  end read only

      pragma Unreferenced (Gnattest_T);

   begin

      AUnit.Assertions.Assert
        (Gnattest_Generated.Default_Assert_Value,
         "Test not implemented.");

--  begin read only
   end Test_SubN;
--  end read only


--  begin read only
   procedure Test_Shl (Gnattest_T : in out Test);
   procedure Test_Shl_d7daaf (Gnattest_T : in out Test) renames Test_Shl;
--  id:2.2/d7daaf3055836b06/Shl/1/0/
   procedure Test_Shl (Gnattest_T : in out Test) is
   --  chip8.ads:61:4:Shl
--  end read only

      pragma Unreferenced (Gnattest_T);

   begin

      AUnit.Assertions.Assert
        (Gnattest_Generated.Default_Assert_Value,
         "Test not implemented.");

--  begin read only
   end Test_Shl;
--  end read only


--  begin read only
   procedure Test_SneV (Gnattest_T : in out Test);
   procedure Test_SneV_73e449 (Gnattest_T : in out Test) renames Test_SneV;
--  id:2.2/73e4494cdbd4ee57/SneV/1/0/
   procedure Test_SneV (Gnattest_T : in out Test) is
   --  chip8.ads:62:4:SneV
--  end read only

      pragma Unreferenced (Gnattest_T);

   begin

      AUnit.Assertions.Assert
        (Gnattest_Generated.Default_Assert_Value,
         "Test not implemented.");

--  begin read only
   end Test_SneV;
--  end read only


--  begin read only
   procedure Test_LdI (Gnattest_T : in out Test);
   procedure Test_LdI_066ac8 (Gnattest_T : in out Test) renames Test_LdI;
--  id:2.2/066ac87b8bd85533/LdI/1/0/
   procedure Test_LdI (Gnattest_T : in out Test) is
   --  chip8.ads:63:4:LdI
--  end read only

      pragma Unreferenced (Gnattest_T);

   begin

      AUnit.Assertions.Assert
        (Gnattest_Generated.Default_Assert_Value,
         "Test not implemented.");

--  begin read only
   end Test_LdI;
--  end read only


--  begin read only
   procedure Test_JmpV (Gnattest_T : in out Test);
   procedure Test_JmpV_f874bb (Gnattest_T : in out Test) renames Test_JmpV;
--  id:2.2/f874bb748f037917/JmpV/1/0/
   procedure Test_JmpV (Gnattest_T : in out Test) is
   --  chip8.ads:64:4:JmpV
--  end read only

      pragma Unreferenced (Gnattest_T);

   begin

      AUnit.Assertions.Assert
        (Gnattest_Generated.Default_Assert_Value,
         "Test not implemented.");

--  begin read only
   end Test_JmpV;
--  end read only


--  begin read only
   procedure Test_Rnd (Gnattest_T : in out Test);
   procedure Test_Rnd_9b379c (Gnattest_T : in out Test) renames Test_Rnd;
--  id:2.2/9b379c4aa8f51ae7/Rnd/1/0/
   procedure Test_Rnd (Gnattest_T : in out Test) is
   --  chip8.ads:65:4:Rnd
--  end read only

      pragma Unreferenced (Gnattest_T);

   begin

      AUnit.Assertions.Assert
        (Gnattest_Generated.Default_Assert_Value,
         "Test not implemented.");

--  begin read only
   end Test_Rnd;
--  end read only


--  begin read only
   procedure Test_Drw (Gnattest_T : in out Test);
   procedure Test_Drw_b47b3a (Gnattest_T : in out Test) renames Test_Drw;
--  id:2.2/b47b3a74d2b326ee/Drw/1/0/
   procedure Test_Drw (Gnattest_T : in out Test) is
   --  chip8.ads:66:4:Drw
--  end read only

      pragma Unreferenced (Gnattest_T);

   begin

      AUnit.Assertions.Assert
        (Gnattest_Generated.Default_Assert_Value,
         "Test not implemented.");

--  begin read only
   end Test_Drw;
--  end read only


--  begin read only
   procedure Test_Skp (Gnattest_T : in out Test);
   procedure Test_Skp_529e2c (Gnattest_T : in out Test) renames Test_Skp;
--  id:2.2/529e2cf4c6f4cdfe/Skp/1/0/
   procedure Test_Skp (Gnattest_T : in out Test) is
   --  chip8.ads:67:4:Skp
--  end read only

      pragma Unreferenced (Gnattest_T);

   begin

      AUnit.Assertions.Assert
        (Gnattest_Generated.Default_Assert_Value,
         "Test not implemented.");

--  begin read only
   end Test_Skp;
--  end read only


--  begin read only
   procedure Test_Sknp (Gnattest_T : in out Test);
   procedure Test_Sknp_600e10 (Gnattest_T : in out Test) renames Test_Sknp;
--  id:2.2/600e10fbe65bf3ea/Sknp/1/0/
   procedure Test_Sknp (Gnattest_T : in out Test) is
   --  chip8.ads:68:4:Sknp
--  end read only

      pragma Unreferenced (Gnattest_T);

   begin

      AUnit.Assertions.Assert
        (Gnattest_Generated.Default_Assert_Value,
         "Test not implemented.");

--  begin read only
   end Test_Sknp;
--  end read only


--  begin read only
   procedure Test_LdVT (Gnattest_T : in out Test);
   procedure Test_LdVT_4f0df5 (Gnattest_T : in out Test) renames Test_LdVT;
--  id:2.2/4f0df5821e9639e9/LdVT/1/0/
   procedure Test_LdVT (Gnattest_T : in out Test) is
   --  chip8.ads:69:4:LdVT
--  end read only

      pragma Unreferenced (Gnattest_T);

   begin

      AUnit.Assertions.Assert
        (Gnattest_Generated.Default_Assert_Value,
         "Test not implemented.");

--  begin read only
   end Test_LdVT;
--  end read only


--  begin read only
   procedure Test_LdK (Gnattest_T : in out Test);
   procedure Test_LdK_bd625b (Gnattest_T : in out Test) renames Test_LdK;
--  id:2.2/bd625b28a14aef94/LdK/1/0/
   procedure Test_LdK (Gnattest_T : in out Test) is
   --  chip8.ads:70:4:LdK
--  end read only

      pragma Unreferenced (Gnattest_T);

   begin

      AUnit.Assertions.Assert
        (Gnattest_Generated.Default_Assert_Value,
         "Test not implemented.");

--  begin read only
   end Test_LdK;
--  end read only


--  begin read only
   procedure Test_LdTV (Gnattest_T : in out Test);
   procedure Test_LdTV_05208e (Gnattest_T : in out Test) renames Test_LdTV;
--  id:2.2/05208ec35b9da72c/LdTV/1/0/
   procedure Test_LdTV (Gnattest_T : in out Test) is
   --  chip8.ads:71:4:LdTV
--  end read only

      pragma Unreferenced (Gnattest_T);

   begin

      AUnit.Assertions.Assert
        (Gnattest_Generated.Default_Assert_Value,
         "Test not implemented.");

--  begin read only
   end Test_LdTV;
--  end read only


--  begin read only
   procedure Test_LdSV (Gnattest_T : in out Test);
   procedure Test_LdSV_438265 (Gnattest_T : in out Test) renames Test_LdSV;
--  id:2.2/438265d35621fdaa/LdSV/1/0/
   procedure Test_LdSV (Gnattest_T : in out Test) is
   --  chip8.ads:72:4:LdSV
--  end read only

      pragma Unreferenced (Gnattest_T);

   begin

      AUnit.Assertions.Assert
        (Gnattest_Generated.Default_Assert_Value,
         "Test not implemented.");

--  begin read only
   end Test_LdSV;
--  end read only


--  begin read only
   procedure Test_AddI (Gnattest_T : in out Test);
   procedure Test_AddI_6793a9 (Gnattest_T : in out Test) renames Test_AddI;
--  id:2.2/6793a9264449c64f/AddI/1/0/
   procedure Test_AddI (Gnattest_T : in out Test) is
   --  chip8.ads:73:4:AddI
--  end read only

      pragma Unreferenced (Gnattest_T);

   begin

      AUnit.Assertions.Assert
        (Gnattest_Generated.Default_Assert_Value,
         "Test not implemented.");

--  begin read only
   end Test_AddI;
--  end read only


--  begin read only
   procedure Test_LdFV (Gnattest_T : in out Test);
   procedure Test_LdFV_b0045b (Gnattest_T : in out Test) renames Test_LdFV;
--  id:2.2/b0045b9c1bfe6b86/LdFV/1/0/
   procedure Test_LdFV (Gnattest_T : in out Test) is
   --  chip8.ads:74:4:LdFV
--  end read only

      pragma Unreferenced (Gnattest_T);

   begin

      AUnit.Assertions.Assert
        (Gnattest_Generated.Default_Assert_Value,
         "Test not implemented.");

--  begin read only
   end Test_LdFV;
--  end read only


--  begin read only
   procedure Test_LdBV (Gnattest_T : in out Test);
   procedure Test_LdBV_8c68b8 (Gnattest_T : in out Test) renames Test_LdBV;
--  id:2.2/8c68b8bb43870286/LdBV/1/0/
   procedure Test_LdBV (Gnattest_T : in out Test) is
   --  chip8.ads:75:4:LdBV
--  end read only

      pragma Unreferenced (Gnattest_T);

   begin

      AUnit.Assertions.Assert
        (Gnattest_Generated.Default_Assert_Value,
         "Test not implemented.");

--  begin read only
   end Test_LdBV;
--  end read only


--  begin read only
   procedure Test_LdArrV (Gnattest_T : in out Test);
   procedure Test_LdArrV_ddac27 (Gnattest_T : in out Test) renames Test_LdArrV;
--  id:2.2/ddac2781f37918b1/LdArrV/1/0/
   procedure Test_LdArrV (Gnattest_T : in out Test) is
   --  chip8.ads:76:4:LdArrV
--  end read only

      pragma Unreferenced (Gnattest_T);

   begin

      AUnit.Assertions.Assert
        (Gnattest_Generated.Default_Assert_Value,
         "Test not implemented.");

--  begin read only
   end Test_LdArrV;
--  end read only


--  begin read only
   procedure Test_LdVArr (Gnattest_T : in out Test);
   procedure Test_LdVArr_074f30 (Gnattest_T : in out Test) renames Test_LdVArr;
--  id:2.2/074f305814974863/LdVArr/1/0/
   procedure Test_LdVArr (Gnattest_T : in out Test) is
   --  chip8.ads:77:4:LdVArr
--  end read only

      pragma Unreferenced (Gnattest_T);

   begin

      AUnit.Assertions.Assert
        (Gnattest_Generated.Default_Assert_Value,
         "Test not implemented.");

--  begin read only
   end Test_LdVArr;
--  end read only


--  begin read only
   procedure Test_SetPc (Gnattest_T : in out Test);
   procedure Test_SetPc_c6ff2d (Gnattest_T : in out Test) renames Test_SetPc;
--  id:2.2/c6ff2d39431a4929/SetPc/1/0/
   procedure Test_SetPc (Gnattest_T : in out Test) is
   --  chip8.ads:79:4:SetPc
--  end read only

      pragma Unreferenced (Gnattest_T);

   begin

      AUnit.Assertions.Assert
        (Gnattest_Generated.Default_Assert_Value,
         "Test not implemented.");

--  begin read only
   end Test_SetPc;
--  end read only


--  begin read only
   procedure Test_AddToPc (Gnattest_T : in out Test);
   procedure Test_AddToPc_ce9d01 (Gnattest_T : in out Test) renames Test_AddToPc;
--  id:2.2/ce9d01dd74585743/AddToPc/1/0/
   procedure Test_AddToPc (Gnattest_T : in out Test) is
   --  chip8.ads:80:4:AddToPc
--  end read only

      pragma Unreferenced (Gnattest_T);

   begin

      AUnit.Assertions.Assert
        (Gnattest_Generated.Default_Assert_Value,
         "Test not implemented.");

--  begin read only
   end Test_AddToPc;
--  end read only


--  begin read only
   procedure Test_GetInstructionValue (Gnattest_T : in out Test);
   procedure Test_GetInstructionValue_0dbab7 (Gnattest_T : in out Test) renames Test_GetInstructionValue;
--  id:2.2/0dbab7b25029ea2c/GetInstructionValue/1/0/
   procedure Test_GetInstructionValue (Gnattest_T : in out Test) is
   --  chip8.ads:81:4:GetInstructionValue
--  end read only

      pragma Unreferenced (Gnattest_T);

   begin

      AUnit.Assertions.Assert
        (Gnattest_Generated.Default_Assert_Value,
         "Test not implemented.");

--  begin read only
   end Test_GetInstructionValue;
--  end read only


--  begin read only
   procedure Test_ConditionalJump (Gnattest_T : in out Test);
   procedure Test_ConditionalJump_061d19 (Gnattest_T : in out Test) renames Test_ConditionalJump;
--  id:2.2/061d19d6bce7649a/ConditionalJump/1/0/
   procedure Test_ConditionalJump (Gnattest_T : in out Test) is
   --  chip8.ads:83:4:ConditionalJump
--  end read only

      pragma Unreferenced (Gnattest_T);

   begin

      AUnit.Assertions.Assert
        (Gnattest_Generated.Default_Assert_Value,
         "Test not implemented.");

--  begin read only
   end Test_ConditionalJump;
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
