package roms is
   type rom is array (Positive range <>) of Integer;
   function pong return rom;
end roms;
