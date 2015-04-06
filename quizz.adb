with Ada.Text_IO, Ada.Integer_Text_IO, Ada.Numerics.Discrete_Random;
use Ada.Text_IO, Ada.Integer_Text_IO, Ada.Numerics;

procedure quizz is
        subtype Rnum is integer range 1 .. 51;
        subtype Rand_Range is integer range 1 .. 51;
        package Rand_Int is new Ada.Numerics.Discrete_Random(Rand_Range);
        use Rand_Int;
        G : Rand_Int.Generator;
        Rnum1 : Rnum := 1;
        Rnum2 : Rnum := 1;
        Answer : integer := Rnum1+Rnum2;
   	User_Answer : integer := 0;
   	Failure : integer := 0;
        Success : integer := 0;
        Score : integer := 0;
        Name : string := "User";
begin
        while Failure < 5 loop
        	reset(G);
        	Rnum1 := Random(G);
        	Rnum2 := Random(G);
        	Put_Line("What is" & integer'Image(Rnum1) & " plus" & integer'Image(Rnum2) & "?");
	        Get(User_Answer);
      	        Skip_Line;
        	if User_Answer = Rnum1 + Rnum2 then
                        Put_Line("Congrats! You gain 5 points!");
         		Success := Success+1;
                        Score := Score+5+Success;
        	else
                        Put_Line("Meh. You lose 10 points!");
         		Failure := Failure+1;
                        Score := Score-5-Failure;
                end if;
        end loop;
	Put_Line("Kudos " & Name & "!");
   	Put_Line("You got it right" & integer'Image(Success) & " times!");
        Put_Line("Final score : " & integer'Image(Score));
end quizz;
