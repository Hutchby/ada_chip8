package body Roms is
   function Pong return RomType is
      RomPong : RomType (1 .. 123);
   begin
      RomPong := (
                  16#6a02#, 16#6b0c#, 16#6c3f#, 16#6d0c#, 16#a2ea#, 16#dab6#, 16#dcd6#, 16#6e00#,
                  16#22d4#, 16#6603#, 16#6802#, 16#6060#, 16#f015#, 16#f007#, 16#3000#, 16#121a#,
                  16#c717#, 16#7708#, 16#69ff#, 16#a2f0#, 16#d671#, 16#a2ea#, 16#dab6#, 16#dcd6#,
                  16#6001#, 16#e0a1#, 16#7bfe#, 16#6004#, 16#e0a1#, 16#7b02#, 16#601f#, 16#8b02#,
                  16#dab6#, 16#600c#, 16#e0a1#, 16#7dfe#, 16#600d#, 16#e0a1#, 16#7d02#, 16#601f#,
                  16#8d02#, 16#dcd6#, 16#a2f0#, 16#d671#, 16#8684#, 16#8794#, 16#603f#, 16#8602#,
                  16#611f#, 16#8712#, 16#4602#, 16#1278#, 16#463f#, 16#1282#, 16#471f#, 16#69ff#,
                  16#4700#, 16#6901#, 16#d671#, 16#122a#, 16#6802#, 16#6301#, 16#8070#, 16#80b5#,
                  16#128a#, 16#68fe#, 16#630a#, 16#8070#, 16#80d5#, 16#3f01#, 16#12a2#, 16#6102#,
                  16#8015#, 16#3f01#, 16#12ba#, 16#8015#, 16#3f01#, 16#12c8#, 16#8015#, 16#3f01#,
                  16#12c2#, 16#6020#, 16#f018#, 16#22d4#, 16#8e34#, 16#22d4#, 16#663e#, 16#3301#,
                  16#6603#, 16#68fe#, 16#3301#, 16#6802#, 16#1216#, 16#79ff#, 16#49fe#, 16#69ff#,
                  16#12c8#, 16#7901#, 16#4902#, 16#6901#, 16#6004#, 16#f018#, 16#7601#, 16#4640#,
                  16#76fe#, 16#126c#, 16#a2f2#, 16#fe33#, 16#f265#, 16#f129#, 16#6414#, 16#6500#,
                  16#d455#, 16#7415#, 16#f229#, 16#d455#, 16#00ee#, 16#8080#, 16#8080#, 16#8080#,
                  16#8000#, 16#0000#, 16#0000#
         );
      return RomPong;
   end Pong;
end Roms;
