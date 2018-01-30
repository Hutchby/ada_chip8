package body roms is
   function pong return rom is
      rom_pong : rom (1 .. 116);
   begin
      rom_pong := (
         16#006e#, 16#d422#, 16#0366#, 16#0268#, 16#6060#, 16#15f0#, 16#07f0#,
         16#0030#, 16#1a12#, 16#17c7#, 16#0877#, 16#ff69#, 16#f0a2#, 16#71d6#,
         16#eaa2#, 16#b6da#, 16#d6dc#, 16#0160#, 16#a1e0#, 16#fe7b#, 16#0460#,
         16#a1e0#, 16#027b#, 16#1f60#, 16#028b#, 16#b6da#, 16#0c60#, 16#a1e0#,
         16#fe7d#, 16#0d60#, 16#a1e0#, 16#027d#, 16#1f60#, 16#028d#, 16#d6dc#,
         16#f0a2#, 16#71d6#, 16#8486#, 16#9487#, 16#3f60#, 16#0286#, 16#1f61#,
         16#1287#, 16#0246#, 16#7812#, 16#3f46#, 16#8212#, 16#1f47#, 16#ff69#,
         16#0047#, 16#0169#, 16#71d6#, 16#2a12#, 16#0268#, 16#0163#, 16#7080#,
         16#b580#, 16#8a12#, 16#fe68#, 16#0a63#, 16#7080#, 16#d580#, 16#013f#,
         16#a212#, 16#0261#, 16#1580#, 16#013f#, 16#ba12#, 16#1580#, 16#013f#,
         16#c812#, 16#1580#, 16#013f#, 16#c212#, 16#2060#, 16#18f0#, 16#d422#,
         16#348e#, 16#d422#, 16#3e66#, 16#0133#, 16#0366#, 16#fe68#, 16#0133#,
         16#0268#, 16#1612#, 16#ff79#, 16#fe49#, 16#ff69#, 16#c812#, 16#0179#,
         16#0249#, 16#0169#, 16#0460#, 16#18f0#, 16#0176#, 16#4046#, 16#fe76#,
         16#6c12#, 16#f2a2#, 16#33fe#, 16#65f2#, 16#29f1#, 16#1464#, 16#0065#,
         16#55d4#, 16#1574#, 16#29f2#, 16#55d4#, 16#ee00#, 16#8080#, 16#8080#,
         16#8080#, 16#0080#, 16#0000#, 16#0000#
         );
      return rom_pong;
   end pong;
end roms;
