with HAL.Bitmap; use HAL.Bitmap;
with Chip8; use Chip8;

package gui is
   type SpriteBuffer is array (0 .. 7, 0 .. 15) of Boolean;
   procedure pixel_draw (coord : Point; b : Boolean);
   procedure pixel_clr (coord : Point);
   function get_touch return Point;
   function get_button (coord : Point) return Integer;
   procedure draw_button;
   procedure clr_screen;
   procedure setup_screen;
   procedure draw_sprite (cpu : in out Chip8.Chip8; height : Natural; coord : Point);
   procedure draw_screen (screen_buff : in FrameBuffer);
   procedure reset_screen (screen_buff : in out FrameBuffer);
   function GetSprite (cpu : in Chip8.Chip8; height : Natural) return SpriteBuffer;
end gui;
