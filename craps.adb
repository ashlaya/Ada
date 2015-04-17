with Ada.Text_IO, Ada.Integer_Text_IO, Ada.Numerics.Discrete_Random; use Ada.Text_IO, Ada.Integer_Text_IO;

PROCEDURE Craps IS
   money : natural := 100;
   bet, pointValue : natural := 0;
   SUBTYPE Dice IS Integer RANGE 1..6 ;
   PACKAGE Rand_Int IS NEW Ada.Numerics.Discrete_Random(Dice);
   USE Rand_Int;
   Gen : Rand_Int.Generator;
   PROCEDURE throw_dices (D1 : OUT NATURAL; D2 : OUT NATURAL; Gen : Generator) IS
   BEGIN
      D1 := random(Gen);
      D2 := random(Gen);
      Put("You get a") ; Put(D1,2) ;
      Put(" and a") ; Put(D2,2) ;
      put(". Total: ") ; put(D1+D2,4) ; put_line(" !") ;
   END throw_dices;
   FUNCTION gamble (money : natural) return natural IS
   BEGIN
      while bet = 0 loop
         put_line("How much are you willing to bet?");
         get(bet); skip_line;
         if bet > money then
            put_line("You're too poor for that. You have $" & integer'Image(money));
            bet := 0;
         else exit;
         end if;
         put_line("You are betting $" & integer'Image(bet));
      end loop;
      return bet;
   END gamble;
   PROCEDURE point_is_on (Gen : generator; money : IN OUT natural; bet: in out natural; pointValue : in out natural) IS
      D1, D2 : natural;
   BEGIN
      while pointValue > 0 loop
         throw_dices(D1, D2, Gen);
         if D1+D2 = pointValue then
            put_line("You win!");
            money := money+bet;
            pointValue := 0; bet := 0;
            put_line("Money : $" & integer'Image(money));
         elsif D1+D2 = 7 then
            put_line("Seven Out!");
            put_line("You lose your bet.");
            money := money-bet;
            pointValue := 0; bet := 0;
            put_line("Money : $" & integer'Image(money));
         end if;
      end loop;
   END point_is_on;
   PROCEDURE first (Gen : generator; money : in out natural; bet : in out natural) IS
      D1, D2 : natural;
      pointValue : natural := 0;
   BEGIN
      throw_dices(D1, D2, Gen);
      case D1+D2 is
         when 7|11 =>
            put_line("Kudos! You win your bet!");
            money := money + bet;
            bet := 0;
            put_line("Money : $" & integer'Image(money));
         when 2|3|12 =>
            put_line("Ah ah sorry! You lose your bet!");
            money := money - bet;
            bet := 0;
            put_line("Money : $" & integer'Image(money));
         when others =>
            pointValue := D1+D2;
            put_line("The point is on! To win, get a" & integer'Image(pointValue) & ".");
            point_is_on(Gen,money,bet,pointValue);
      end case;
   END first;
BEGIN
   reset(Gen);
   while money > 0 loop
      bet := gamble(money);
      exit when bet = 0;
      put_line("Let's play!");
      first(Gen, money, bet);
   end loop;
   put_line("You have $" & integer'Image(money) & " in your pocket!");
   if money <= 0 then
      put_line("You don't have any money. You can't play anymore!");
   end if;
END Craps;
