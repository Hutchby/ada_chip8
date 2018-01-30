--  This package has been generated automatically by GNATtest.
--  Do not edit any part of it, see GNATtest documentation for more details.

--  begin read only
with AUnit.Test_Caller;
with Gnattest_Generated;

package body Chip8.Test_Data.Tests.Suite is

   package Runner_1 is new AUnit.Test_Caller
     (GNATtest_Generated.GNATtest_Standard.Chip8.Test_Data.Tests.Test);

   Result : aliased AUnit.Test_Suites.Test_Suite;

   Case_1_1_Test_Initialize_8ce202 : aliased Runner_1.Test_Case;
   Case_2_1_Test_FetchOpcode_994135 : aliased Runner_1.Test_Case;
   Case_3_1_Test_EmulateCycle_788153 : aliased Runner_1.Test_Case;
   Case_4_1_Test_Jp_1ac3cb : aliased Runner_1.Test_Case;
   Case_5_1_Test_Cls_1efc61 : aliased Runner_1.Test_Case;
   Case_6_1_Test_Ret_a5fc94 : aliased Runner_1.Test_Case;
   Case_7_1_Test_Call_aac095 : aliased Runner_1.Test_Case;
   Case_8_1_Test_SeVB_101888 : aliased Runner_1.Test_Case;
   Case_9_1_Test_SneVB_99e8d5 : aliased Runner_1.Test_Case;
   Case_10_1_Test_SeVV_13d2d3 : aliased Runner_1.Test_Case;
   Case_11_1_Test_LdVB_453c04 : aliased Runner_1.Test_Case;
   Case_12_1_Test_AddVB_d51fed : aliased Runner_1.Test_Case;
   Case_13_1_Test_LdVV_53aa27 : aliased Runner_1.Test_Case;
   Case_14_1_Test_OrVV_f9f9ca : aliased Runner_1.Test_Case;
   Case_15_1_Test_AndVV_7f3983 : aliased Runner_1.Test_Case;
   Case_16_1_Test_XorVV_3a303e : aliased Runner_1.Test_Case;
   Case_17_1_Test_AddVV_dea81c : aliased Runner_1.Test_Case;
   Case_18_1_Test_SubVV_417abe : aliased Runner_1.Test_Case;
   Case_19_1_Test_Shr_8593c5 : aliased Runner_1.Test_Case;
   Case_20_1_Test_SubN_2cf0cc : aliased Runner_1.Test_Case;
   Case_21_1_Test_Shl_d7daaf : aliased Runner_1.Test_Case;
   Case_22_1_Test_SneV_73e449 : aliased Runner_1.Test_Case;
   Case_23_1_Test_LdI_066ac8 : aliased Runner_1.Test_Case;
   Case_24_1_Test_JmpV_f874bb : aliased Runner_1.Test_Case;
   Case_25_1_Test_Rnd_9b379c : aliased Runner_1.Test_Case;
   Case_26_1_Test_Drw_b47b3a : aliased Runner_1.Test_Case;
   Case_27_1_Test_Skp_529e2c : aliased Runner_1.Test_Case;
   Case_28_1_Test_Sknp_600e10 : aliased Runner_1.Test_Case;
   Case_29_1_Test_LdVT_4f0df5 : aliased Runner_1.Test_Case;
   Case_30_1_Test_LdK_bd625b : aliased Runner_1.Test_Case;
   Case_31_1_Test_LdTV_05208e : aliased Runner_1.Test_Case;
   Case_32_1_Test_LdSV_438265 : aliased Runner_1.Test_Case;
   Case_33_1_Test_AddI_6793a9 : aliased Runner_1.Test_Case;
   Case_34_1_Test_LdFV_b0045b : aliased Runner_1.Test_Case;
   Case_35_1_Test_LdBV_8c68b8 : aliased Runner_1.Test_Case;
   Case_36_1_Test_LdArrV_ddac27 : aliased Runner_1.Test_Case;
   Case_37_1_Test_LdVArr_074f30 : aliased Runner_1.Test_Case;
   Case_38_1_Test_SetPc_c6ff2d : aliased Runner_1.Test_Case;
   Case_39_1_Test_AddToPc_ce9d01 : aliased Runner_1.Test_Case;
   Case_40_1_Test_GetInstructionValue_0dbab7 : aliased Runner_1.Test_Case;
   Case_41_1_Test_ConditionalJump_061d19 : aliased Runner_1.Test_Case;

   function Suite return AUnit.Test_Suites.Access_Test_Suite is
   begin

      Runner_1.Create
        (Case_1_1_Test_Initialize_8ce202,
         "chip8.ads:40:4:",
         Test_Initialize_8ce202'Access);
      Runner_1.Create
        (Case_2_1_Test_FetchOpcode_994135,
         "chip8.ads:41:4:",
         Test_FetchOpcode_994135'Access);
      Runner_1.Create
        (Case_3_1_Test_EmulateCycle_788153,
         "chip8.ads:42:4:",
         Test_EmulateCycle_788153'Access);
      Runner_1.Create
        (Case_4_1_Test_Jp_1ac3cb,
         "chip8.ads:44:4:",
         Test_Jp_1ac3cb'Access);
      Runner_1.Create
        (Case_5_1_Test_Cls_1efc61,
         "chip8.ads:45:4:",
         Test_Cls_1efc61'Access);
      Runner_1.Create
        (Case_6_1_Test_Ret_a5fc94,
         "chip8.ads:46:4:",
         Test_Ret_a5fc94'Access);
      Runner_1.Create
        (Case_7_1_Test_Call_aac095,
         "chip8.ads:47:4:",
         Test_Call_aac095'Access);
      Runner_1.Create
        (Case_8_1_Test_SeVB_101888,
         "chip8.ads:48:4:",
         Test_SeVB_101888'Access);
      Runner_1.Create
        (Case_9_1_Test_SneVB_99e8d5,
         "chip8.ads:49:4:",
         Test_SneVB_99e8d5'Access);
      Runner_1.Create
        (Case_10_1_Test_SeVV_13d2d3,
         "chip8.ads:50:4:",
         Test_SeVV_13d2d3'Access);
      Runner_1.Create
        (Case_11_1_Test_LdVB_453c04,
         "chip8.ads:51:4:",
         Test_LdVB_453c04'Access);
      Runner_1.Create
        (Case_12_1_Test_AddVB_d51fed,
         "chip8.ads:52:4:",
         Test_AddVB_d51fed'Access);
      Runner_1.Create
        (Case_13_1_Test_LdVV_53aa27,
         "chip8.ads:53:4:",
         Test_LdVV_53aa27'Access);
      Runner_1.Create
        (Case_14_1_Test_OrVV_f9f9ca,
         "chip8.ads:54:4:",
         Test_OrVV_f9f9ca'Access);
      Runner_1.Create
        (Case_15_1_Test_AndVV_7f3983,
         "chip8.ads:55:4:",
         Test_AndVV_7f3983'Access);
      Runner_1.Create
        (Case_16_1_Test_XorVV_3a303e,
         "chip8.ads:56:4:",
         Test_XorVV_3a303e'Access);
      Runner_1.Create
        (Case_17_1_Test_AddVV_dea81c,
         "chip8.ads:57:4:",
         Test_AddVV_dea81c'Access);
      Runner_1.Create
        (Case_18_1_Test_SubVV_417abe,
         "chip8.ads:58:4:",
         Test_SubVV_417abe'Access);
      Runner_1.Create
        (Case_19_1_Test_Shr_8593c5,
         "chip8.ads:59:4:",
         Test_Shr_8593c5'Access);
      Runner_1.Create
        (Case_20_1_Test_SubN_2cf0cc,
         "chip8.ads:60:4:",
         Test_SubN_2cf0cc'Access);
      Runner_1.Create
        (Case_21_1_Test_Shl_d7daaf,
         "chip8.ads:61:4:",
         Test_Shl_d7daaf'Access);
      Runner_1.Create
        (Case_22_1_Test_SneV_73e449,
         "chip8.ads:62:4:",
         Test_SneV_73e449'Access);
      Runner_1.Create
        (Case_23_1_Test_LdI_066ac8,
         "chip8.ads:63:4:",
         Test_LdI_066ac8'Access);
      Runner_1.Create
        (Case_24_1_Test_JmpV_f874bb,
         "chip8.ads:64:4:",
         Test_JmpV_f874bb'Access);
      Runner_1.Create
        (Case_25_1_Test_Rnd_9b379c,
         "chip8.ads:65:4:",
         Test_Rnd_9b379c'Access);
      Runner_1.Create
        (Case_26_1_Test_Drw_b47b3a,
         "chip8.ads:66:4:",
         Test_Drw_b47b3a'Access);
      Runner_1.Create
        (Case_27_1_Test_Skp_529e2c,
         "chip8.ads:67:4:",
         Test_Skp_529e2c'Access);
      Runner_1.Create
        (Case_28_1_Test_Sknp_600e10,
         "chip8.ads:68:4:",
         Test_Sknp_600e10'Access);
      Runner_1.Create
        (Case_29_1_Test_LdVT_4f0df5,
         "chip8.ads:69:4:",
         Test_LdVT_4f0df5'Access);
      Runner_1.Create
        (Case_30_1_Test_LdK_bd625b,
         "chip8.ads:70:4:",
         Test_LdK_bd625b'Access);
      Runner_1.Create
        (Case_31_1_Test_LdTV_05208e,
         "chip8.ads:71:4:",
         Test_LdTV_05208e'Access);
      Runner_1.Create
        (Case_32_1_Test_LdSV_438265,
         "chip8.ads:72:4:",
         Test_LdSV_438265'Access);
      Runner_1.Create
        (Case_33_1_Test_AddI_6793a9,
         "chip8.ads:73:4:",
         Test_AddI_6793a9'Access);
      Runner_1.Create
        (Case_34_1_Test_LdFV_b0045b,
         "chip8.ads:74:4:",
         Test_LdFV_b0045b'Access);
      Runner_1.Create
        (Case_35_1_Test_LdBV_8c68b8,
         "chip8.ads:75:4:",
         Test_LdBV_8c68b8'Access);
      Runner_1.Create
        (Case_36_1_Test_LdArrV_ddac27,
         "chip8.ads:76:4:",
         Test_LdArrV_ddac27'Access);
      Runner_1.Create
        (Case_37_1_Test_LdVArr_074f30,
         "chip8.ads:77:4:",
         Test_LdVArr_074f30'Access);
      Runner_1.Create
        (Case_38_1_Test_SetPc_c6ff2d,
         "chip8.ads:79:4:",
         Test_SetPc_c6ff2d'Access);
      Runner_1.Create
        (Case_39_1_Test_AddToPc_ce9d01,
         "chip8.ads:80:4:",
         Test_AddToPc_ce9d01'Access);
      Runner_1.Create
        (Case_40_1_Test_GetInstructionValue_0dbab7,
         "chip8.ads:81:4:",
         Test_GetInstructionValue_0dbab7'Access);
      Runner_1.Create
        (Case_41_1_Test_ConditionalJump_061d19,
         "chip8.ads:83:4:",
         Test_ConditionalJump_061d19'Access);

      Result.Add_Test (Case_1_1_Test_Initialize_8ce202'Access);
      Result.Add_Test (Case_2_1_Test_FetchOpcode_994135'Access);
      Result.Add_Test (Case_3_1_Test_EmulateCycle_788153'Access);
      Result.Add_Test (Case_4_1_Test_Jp_1ac3cb'Access);
      Result.Add_Test (Case_5_1_Test_Cls_1efc61'Access);
      Result.Add_Test (Case_6_1_Test_Ret_a5fc94'Access);
      Result.Add_Test (Case_7_1_Test_Call_aac095'Access);
      Result.Add_Test (Case_8_1_Test_SeVB_101888'Access);
      Result.Add_Test (Case_9_1_Test_SneVB_99e8d5'Access);
      Result.Add_Test (Case_10_1_Test_SeVV_13d2d3'Access);
      Result.Add_Test (Case_11_1_Test_LdVB_453c04'Access);
      Result.Add_Test (Case_12_1_Test_AddVB_d51fed'Access);
      Result.Add_Test (Case_13_1_Test_LdVV_53aa27'Access);
      Result.Add_Test (Case_14_1_Test_OrVV_f9f9ca'Access);
      Result.Add_Test (Case_15_1_Test_AndVV_7f3983'Access);
      Result.Add_Test (Case_16_1_Test_XorVV_3a303e'Access);
      Result.Add_Test (Case_17_1_Test_AddVV_dea81c'Access);
      Result.Add_Test (Case_18_1_Test_SubVV_417abe'Access);
      Result.Add_Test (Case_19_1_Test_Shr_8593c5'Access);
      Result.Add_Test (Case_20_1_Test_SubN_2cf0cc'Access);
      Result.Add_Test (Case_21_1_Test_Shl_d7daaf'Access);
      Result.Add_Test (Case_22_1_Test_SneV_73e449'Access);
      Result.Add_Test (Case_23_1_Test_LdI_066ac8'Access);
      Result.Add_Test (Case_24_1_Test_JmpV_f874bb'Access);
      Result.Add_Test (Case_25_1_Test_Rnd_9b379c'Access);
      Result.Add_Test (Case_26_1_Test_Drw_b47b3a'Access);
      Result.Add_Test (Case_27_1_Test_Skp_529e2c'Access);
      Result.Add_Test (Case_28_1_Test_Sknp_600e10'Access);
      Result.Add_Test (Case_29_1_Test_LdVT_4f0df5'Access);
      Result.Add_Test (Case_30_1_Test_LdK_bd625b'Access);
      Result.Add_Test (Case_31_1_Test_LdTV_05208e'Access);
      Result.Add_Test (Case_32_1_Test_LdSV_438265'Access);
      Result.Add_Test (Case_33_1_Test_AddI_6793a9'Access);
      Result.Add_Test (Case_34_1_Test_LdFV_b0045b'Access);
      Result.Add_Test (Case_35_1_Test_LdBV_8c68b8'Access);
      Result.Add_Test (Case_36_1_Test_LdArrV_ddac27'Access);
      Result.Add_Test (Case_37_1_Test_LdVArr_074f30'Access);
      Result.Add_Test (Case_38_1_Test_SetPc_c6ff2d'Access);
      Result.Add_Test (Case_39_1_Test_AddToPc_ce9d01'Access);
      Result.Add_Test (Case_40_1_Test_GetInstructionValue_0dbab7'Access);
      Result.Add_Test (Case_41_1_Test_ConditionalJump_061d19'Access);

      return Result'Access;

   end Suite;

end Chip8.Test_Data.Tests.Suite;
--  end read only
