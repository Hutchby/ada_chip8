with HAL.Bitmap; use HAL.Bitmap;
with Chip8; use Chip8;

package gui is
   type SpriteBuffer is array (0 .. 8, 0 .. 15) of Boolean;
   procedure pixel_draw (coord : Point; b : Boolean);
   procedure pixel_clr (coord : Point);
   function get_touch return Point;
   function get_button (coord : Point) return Integer;
   procedure draw_button;
   procedure clr_screen;
   procedure setup_screen;
   procedure draw_sprite (screen_buff : in out FrameBuffer; height : Natural;
                          buff : SpriteBuffer; coord : Point);
   procedure draw_screen (screen_buff : in FrameBuffer);
end gui;
