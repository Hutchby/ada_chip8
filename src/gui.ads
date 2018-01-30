with HAL.Bitmap; use HAL.Bitmap;

package gui is
   procedure pixel_draw (coord : Point; b : Boolean);
   procedure pixel_clr (coord : Point);
   function get_touch return Point;
   function get_button (coord : Point) return Integer;
   procedure draw_button;
   procedure clr_screen;
   procedure setup_screen;
end gui;
