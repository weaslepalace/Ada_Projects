with AUnit; use AUnit;
with AUnit.Test_Fixtures; use AUnit.Test_Fixtures;

package Game_Of_Life.Tests is

   type Logic_Access is access all Game_Of_Life.Logic'Class;
   type Logic_Test is new Test_Fixture with record
      Fixture : Logic_Access;
   end record;

   overriding procedure Set_Up (L : in out Logic_Test);

   procedure Test_Update (L : in out Logic_Test);
   procedure Test_Evaluate_Cell (L : in out Logic_Test);

end Game_Of_Life.Tests;
