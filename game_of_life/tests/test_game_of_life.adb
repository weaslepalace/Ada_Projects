with AUnit.Test_Cases;
with Game_Of_Life;

procedure Test_Game_Of_Life is
   package TC renames AUnit.Test_Cases;

   procedure Test_Add is
   begin
      TC.Assert_Equals (Expected => 5, Actual => Game_Of_Life.Add (2, 3));
      TC.Assert_Equals (Expected => -1, Actual => Game_Of_Life.Add(2, -3));
   end Test_Add;

begin
   TC.Run ("Test Add Function", Test_Add'Access);
end Test_Game_Of_Life;

