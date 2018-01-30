with STM32.Board; use STM32.Board;
with HAL.Touch_Panel; use HAL.Touch_Panel;
with STM32.User_Button; use STM32.User_Button;
with LCD_Std_Out; use LCD_Std_Out;
with BMP_Fonts; use BMP_Fonts;

package body gui is

   procedure pixel_draw (coord : Point; b : Boolean) is
      r : constant Rect := ((coord.X * 5, coord.Y * 5), 5, 5);
   begin
      if b then
         Display.Hidden_Buffer (1).Set_Source (HAL.Bitmap.White);
      else
         Display.Hidden_Buffer (1).Set_Source (HAL.Bitmap.Black);
      end if;

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
   begin
      case State'Length is
      when 1 =>
         return (State (State'First).X, State (State'First).Y);
      when others => return (0, 0);
      end case;
   end get_touch;

   function get_button (coord : Point) return Integer is
      offset : Natural := 0;
   begin

      if coord.X < 160 then
         return -1;
      end if;
      if coord.X > 200 then
         offset := 8;
      end if;
      return offset + (coord.Y / 40);
   end get_button;

   procedure draw_button is
      R2    : Rect := ((0, 0), 40, 40);
   begin
      for I in 0 .. 7 loop
         R2.Position.Y := I * 40;

         R2.Position.X := 160;
         Display.Hidden_Buffer (1).Draw_Rect (R2);
         R2.Position.X := 200;
         Display.Hidden_Buffer (1).Draw_Rect (R2);
      end loop;
   end draw_button;

   procedure clr_screen is
   begin
      --  LCD_Std_Out.Clear_Screen;
      Display.Hidden_Buffer (1).Set_Source (HAL.Bitmap.Black);
      Display.Hidden_Buffer (1).Fill;
   end clr_screen;

   procedure setup_screen is
      BG : constant Bitmap_Color := (Alpha => 255, others => 0);
   begin
      --  Initialize LCD
      Display.Initialize;
      Display.Initialize_Layer (1, ARGB_8888);
      --  LCD_Std_Out.Set_Orientation (HAL.Framebuffer.Landscape);

      --  Initialize touch panel
      Touch_Panel.Initialize;

      --  Initialize button
      STM32.User_Button.Initialize;

      LCD_Std_Out.Set_Font (BMP_Fonts.Font8x8);
      LCD_Std_Out.Current_Background_Color := BG;

      --  Clear LCD (set background)
      Display.Hidden_Buffer (1).all.Set_Source (BG);
      Display.Hidden_Buffer (1).Fill;

      LCD_Std_Out.Clear_Screen;
      Display.Update_Layer (1, Copy_Back => True);
   end setup_screen;


   procedure draw_sprite (screen_buff : in out FrameBuffer; height : Natural;
                          buff : in SpriteBuffer; coord : Point) is
      X : constant Integer := coord.X;
      Y : constant Integer := coord.Y;
   begin
      for I in 0 .. 8 loop
         for J in 0 .. height loop
            screen_buff (X + I, Y + J) := screen_buff (X + I, Y + J) xor buff (I, J);
         end loop;
      end loop;

   end draw_sprite;

   procedure draw_screen (screen_buff : in FrameBuffer) is
   begin
      for I in screen_buff'Range (1) loop
         for J in screen_buff'Range (2) loop
            pixel_draw ((I, J), screen_buff (I, J));
         end loop;
      end loop;

   end draw_screen;
end gui;
