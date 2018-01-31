--  This package has been generated automatically by GNATtest.
--  Do not edit any part of it, see GNATtest documentation for more details.

--  begin read only
with AUnit.Test_Caller;
with Gnattest_Generated;

package body Chip8.Test_Data.Tests.Suite is

   package Runner_1 is new AUnit.Test_Caller
     (GNATtest_Generated.GNATtest_Standard.Chip8.Test_Data.Tests.Test);

   Result : aliased AUnit.Test_Suites.Test_Suite;

   Case_4_1_Test_Jp_1ac3cb : aliased Runner_1.Test_Case;
   Case_6_1_Test_Ret_a5fc94 : aliased Runner_1.Test_Case;
   Case_7_1_Test_Call_aac095 : aliased Runner_1.Test_Case;
   Case_30_1_Test_LdK_bd625b : aliased Runner_1.Test_Case;
   Case_34_1_Test_LdFV_b0045b : aliased Runner_1.Test_Case;

   function Suite return AUnit.Test_Suites.Access_Test_Suite is
   begin

      Runner_1.Create
        (Case_4_1_Test_Jp_1ac3cb,
         "chip8.ads:44:4:",
         Test_Jp_1ac3cb'Access);
      Runner_1.Create
        (Case_6_1_Test_Ret_a5fc94,
         "chip8.ads:46:4:",
         Test_Ret_a5fc94'Access);
      Runner_1.Create
        (Case_7_1_Test_Call_aac095,
         "chip8.ads:47:4:",
         Test_Call_aac095'Access);
      Runner_1.Create
        (Case_30_1_Test_LdK_bd625b,
         "chip8.ads:70:4:",
         Test_LdK_bd625b'Access);
      Runner_1.Create
        (Case_34_1_Test_LdFV_b0045b,
         "chip8.ads:74:4:",
         Test_LdFV_b0045b'Access);

      Result.Add_Test (Case_4_1_Test_Jp_1ac3cb'Access);
      Result.Add_Test (Case_6_1_Test_Ret_a5fc94'Access);
      Result.Add_Test (Case_7_1_Test_Call_aac095'Access);
      Result.Add_Test (Case_30_1_Test_LdK_bd625b'Access);
      Result.Add_Test (Case_34_1_Test_LdFV_b0045b'Access);

      return Result'Access;

   end Suite;

end Chip8.Test_Data.Tests.Suite;
--  end read only
