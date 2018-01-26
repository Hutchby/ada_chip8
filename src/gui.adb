with STM32.Board; use STM32.Board;
with HAL.Touch_Panel; use HAL.Touch_Panel;

package body gui is

   procedure pixel_draw (coord : Point) is
      r : constant Rect := (coord, 5, 5);
   begin
      Display.Hidden_Buffer (1).Set_Source (HAL.Bitmap.White);
      Display.Hidden_Buffer (1).Draw_Rect (r);
   end pixel_draw;

   procedure pixel_clr (coord : Point) is
      r : constant Rect := (coord, 5, 5);
   begin
      Display.Hidden_Buffer (1).Set_Source (HAL.Bitmap.Black);
      Display.Hidden_Buffer (1).Draw_Rect (r);
   end pixel_clr;

   function get_touch return Point is
      State : constant TP_State := Touch_Panel.Get_All_Touch_Points;
      ret : constant Point := (State (State'First).X, State (State'First).Y);
   begin
      return ret;
   end get_touch;

   function get_button (coord : Point) return Natural is
      coeff : Natural := 0;
   begin
      if coord.X > 160 then
         coeff := 1;
      end if;
      if coord.X > 200 then
         coeff := 2;
      end if;
      return coeff * ((coord.Y / 40) + 1);
   end get_button;


end gui;
