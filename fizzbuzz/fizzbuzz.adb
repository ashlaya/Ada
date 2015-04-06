with Ada.Text_IO;
use Ada.Text_IO;

procedure fizzbuzz is
	Count : integer := 0;
begin
        while (Count < 101) loop
                if Count mod 3 = 0 then
                        Put_Line("Fizz!");
                elsif Count mod 5 = 0 then
			Put_Line("Buzz!");
                else
                        Put_Line("Count : " & integer'Image(Count));
                end if;
                Count := Count + 1;
        end loop;
end fizzbuzz;
