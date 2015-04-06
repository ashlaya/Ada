with Ada.Text_IO, Ada.Integer_Text_IO; use Ada.Text_IO, Ada.Integer_Text_IO;

procedure problem2 is
	First_I : integer := 0;
	Current_I : integer := 1;
	Actual_I : integer := 0;
	Sum : integer := 0;
begin	
	loop
        	Current_I := (First_I + Current_I);
		First_I := Actual_I;
		Actual_I := Current_I;
		if (Current_I mod 2 = 0) then
			Sum := Current_I + Sum;
		end if;
	exit when Current_I > 4000000;
        New_Line;
	put("Current_I : ");
	New_Line;
	put(Current_I);
	end loop;
	New_Line;
	put("Somme : ");
	New_Line;
	put(Sum);
end problem2;
