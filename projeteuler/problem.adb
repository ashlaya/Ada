with Ada.Text_IO, Ada.Integer_Text_IO; use Ada.Text_IO, Ada.Integer_Text_IO;

procedure problem is

	I : Integer := 2;
	Sum : integer := 0;

begin

     loop
	     I := I + 1;
	exit when I = 1000;
	if (I mod 3 = 0) or (I mod 5 = 0) then
        	Sum := Sum + I;
	end if;
     end loop;
     Put(Sum);

end problem;
