with HAL.Bitmap; use HAL.Bitmap;

package gui is
   procedure pixel_draw (coord : Point);
   procedure pixel_clr (coord : Point);
   function get_touch return Point;
   function get_button (coord : Point) return Natural;
end gui;
