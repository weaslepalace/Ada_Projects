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

   procedure Test_Evaluate_Cell (L : in out Logic_Test) is

      Dead_Cell : Game_Of_Life.Cell := (
         State => Game_Of_Life.Cell_State'(Dead)
      );
      Live_Cell : Game_Of_Life.Cell := (
         State => Game_Of_Life.Cell_State'(Alive)
      );

      New_Cell_State : Game_Of_Life.Cell_State;

      type Stay_Dead_Array is array (1 .. 8) of Integer;
      type Die_Array is array (1 .. 7) of Integer;
      type Survive_Array is array (1 .. 2) of Integer;

      Stay_Dead_Neighbour_Count
         : constant Stay_Dead_Array
         := (0, 1, 2, 4, 5, 6, 7, 8);
      Come_Alive_Neighbour_Count : constant Integer := 3;
      Die_Neighbour_Count
         : constant Die_Array
         := (0, 1, 4, 5, 6, 7, 8);
      Survive_Neighbour_Count
         : constant Survive_Array
         := (2, 3);
   begin

      for N in Stay_Dead_Neighbour_Count'Range loop
         New_Cell_State := Game_Of_Life.Evaluate_Cell (
            Dead_Cell
            , Stay_Dead_Neighbour_Count (N)
         );
         Assert (
            New_Cell_State = Game_Of_Life.Cell_State'(Dead)
            , "Cell didn't stay dead; Living_Neighbours ="
               & Integer'Image (Stay_Dead_Neighbour_Count (N))
         );
      end loop;

      New_Cell_State := Game_Of_Life.Evaluate_Cell (
         Dead_Cell
         , Come_Alive_Neighbour_Count
      );
      Assert (
         New_Cell_State = Game_Of_Life.Cell_State'(Alive)
         , "Cell didn't come alive; Living_Neighbours ="
            & Integer'Image (Come_Alive_Neighbour_Count)
      );

      for N in Die_Neighbour_Count'Range loop
         New_Cell_State := Game_Of_Life.Evaluate_Cell (
            Live_Cell
            , Die_Neighbour_Count (N)
         );
         Assert (
            New_Cell_State = Game_Of_Life.Cell_State'(Dead)
            , "Cell didn't die; Living_Neighbours ="
               & Integer'Image (Die_Neighbour_Count (N))
         );
      end loop;

      for N in Survive_Neighbour_Count'Range loop
         New_Cell_State := Game_Of_Life.Evaluate_Cell (
            Live_Cell
            , Survive_Neighbour_Count (N)
         );
         Assert (
            New_Cell_State = Game_Of_Life.Cell_State'(Alive)
            , "Cell didn't survive; Living_Neighbours ="
               & Integer'Image (Survive_Neighbour_Count (N))
         );
      end loop;

   end Test_Evaluate_Cell;

   procedure Test_Count_Living_Neighbours (L : in out Logic_Test) is
      Dead_Cell : constant Cell := (
         State => Game_Of_Life.Cell_State'(Dead)
      );
      Live_Cell : constant Cell := (
         State => Game_Of_Life.Cell_State'(Alive)
      );
      GoL : Game_Of_Life.Logic := (
         Row_Size => 9
         , Game_Board => (others => Dead_Cell)
      );
      Center_Index : constant Integer := 41;

      procedure Execute_Count (Expected : Integer) is
         Count : Integer;
      begin
         Count := GoL.Count_Living_Neighbours (Center_Index);
         Assert (
            Count = Expected
            , "Count is"
               & Integer'Image (Count)
               & " expected"
               & Integer'Image (Expected)
         );
      end Execute_Count;

   begin

      Execute_Count (0);

      GoL.Game_Board (22) := Live_Cell;
      Execute_Count (0);

      GoL.Game_Board (32) := Live_Cell;
      Execute_Count (1);

      GoL.Game_Board (50) := Live_Cell;
      Execute_Count (2);

      GoL.Game_Board (42) := Live_Cell;
      Execute_Count (3);

      GoL.Game_Board (40) := Live_Cell;
      Execute_Count (4);

      GoL.Game_Board (33) := Live_Cell;
      Execute_Count (5);

      GoL.Game_Board (51) := Live_Cell;
      Execute_Count (6);

      GoL.Game_Board (49) := Live_Cell;
      Execute_Count (7);

      GoL.Game_Board (31) := Live_Cell;
      Execute_Count (8);

      GoL.Game_Board (41) := Live_Cell;
      Execute_Count (8);

      GoL.Game_Board := (others => Live_Cell);
      Execute_Count (8);

   end Test_Count_Living_Neighbours;

end Game_Of_Life.Tests;
