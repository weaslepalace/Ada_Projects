with AUnit.Assertions; use AUnit.Assertions;

package body Game_Of_Life.Tests is

   Fixture : aliased Logic;

   overriding procedure Set_Up (L : in out Logic_Test) is
   begin
      L.Fixture := Logic_Access'(Fixture'Access);
   end Set_Up;

   procedure Test_Update (L : in out Logic_Test) is
   begin
      Assert (True, "Tested");
   end Test_Update;

   procedure Test_Update_Cell (L : in out Logic_Test) is
      Dead_Cell : Game_Of_Life.Cell := (
         State => Game_Of_Life.Cell_State'(Dead)
      );
      GoL : Game_Of_Life.Logic;
   begin
      GoL.Update_Cell (Dead_Cell, 0);
      
   end Test_Update_Cell;

end Game_Of_Life.Tests;
