with Ada.Text_IO, Ada.Integer_Text_IO; use Ada.Text_IO, Ada.Integer_Text_IO;

procedure problem6 is
	Sum_Square : integer := 0;
	Square_Sum : integer := 0;
begin
	-- Sum of the square of every Sum_Square_Current_Number
	for i in 0 .. 100
	loop
		Sum_Square := i**2 + Sum_Square;
	end loop;
       -- Square of the sum of Square_Sum_Current_Numbers
	for i in 0 .. 100
	loop
		Square_Sum := Square_Sum + i;
	end loop;
	Square_Sum := Square_Sum**2;
	put("La somme des carres vaut : ");
	put(Sum_Square);
	New_Line;
	put("Le carre de la somme vaut : ");
	put(Square_Sum);
	New_Line;
	put("La difference entre la somme des carres et le carre de la somme est de : ");
	put(Square_Sum - Sum_Square);
end problem6;


