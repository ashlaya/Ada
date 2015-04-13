with Ada.Text_IO, Ada.Integer_Text_IO; use Ada.Text_IO, Ada.Integer_Text_IO;

procedure fibonacci is
   a : integer := 0;
   b : integer := 1;
begin
   put(a); put(b);
   for i in 1 .. 20 loop
      a := a+b;
      put(a);
      b := a+b;
      put(b);
   end loop;


end;
