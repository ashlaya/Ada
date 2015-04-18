with Ada.Text_IO, Ada.Integer_Text_IO, Ada.Float_Text_IO; use Ada.Text_IO, Ada.Integer_Text_IO, Ada.Float_Text_IO;

PROCEDURE tempconv IS
   c, f : float := 0.0;
   choice : integer;
   procedure c_to_f (c : in out float; f : out float) is
   begin
      put_line("What's the temperature in Celsius?");
      get(c); skip_line;
      f := c*1.8+32.0;
      put(c, Aft => 2, Exp => 0); put("°C = "); put(f, Aft => 2, Exp => 0); put("°F");
   end c_to_f;
   procedure f_to_c (f : in out float; c : out float) is
   begin
      put_line("What's the temperature in Farenheit?");
      get(f); skip_line;
      c := (f-32.0)/1.8;
      put(f, Aft => 2, Exp => 0); put("°F = "); put(c, Aft => 2, Exp => 0); put("°C");
   end f_to_c;
BEGIN
   put_line("Do you want to:");
   put_line("1. Convert °C in °F");
   put_line("2. Convert °F in °C");
   put_line("Your choice? (1/2 - others to quit)");
   get(choice); skip_line;
   case choice is
      when 1 => c_to_f(c,f);
      when 2 => f_to_c(f,c);
      when others => put_line("Thanks for using tempconv :)");
   end case;
END tempconv;
