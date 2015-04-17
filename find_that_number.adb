with Ada.Text_IO, Ada.Integer_Text_IO, Ada.Numerics.Discrete_Random; use Ada.Text_IO, Ada.Integer_Text_IO;

PROCEDURE find_that_number IS
   tries, n, n_user : natural := 0;
   SUBTYPE Number is Integer range 1..100;
   PACKAGE Rand_Int IS NEW Ada.Numerics.Discrete_Random(Number);
   USE Rand_Int;
   Gen: Rand_Int.Generator;
BEGIN
   reset(Gen);
   n := random(Gen);
   put_line("=== Welcome to Find That Number ===");
   put_line("You can guess the number 101 if you want to quit.");
   while n_user /= n loop
      put_line("What's the mystery number ?");
      get(n_user); skip_line;
      if n_user < n then
         tries := tries + 1;
         put_line("No! It's higher!");
      elsif n_user > n and n_user /= 101 then
         tries := tries + 1;
         put_line("No! It's lower!");
      elsif n_user = 101 then
         put_line("You quit the game :(");
         exit;
      else
         tries := tries + 1;
         put_line("Yes! It is" & integer'Image(n) & "!");
         put_line("You win! It only took you" & integer'Image(tries) & " tries!");
         exit;
      end if;
   end loop;
END;
