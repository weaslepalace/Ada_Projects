package Game_Of_Life is

   type Logic is tagged private;
   type Cell is private;

   type Cell_State is (
      Dead
      , Alive
   );

   procedure Update (L : in out Logic);

   function Count_Living_Neighbours (
      L : in out Logic
      ; Cell_Index : Integer
   )
   return Integer;

   function Evaluate_Cell (
      C : in out Cell
      ; Living_Neighbours : Integer
   )
   return Cell_State;

private

   type Cell is record
      State : Cell_State;
   end record;

   type Game_Board_Array is array (1 .. 1024) of Cell;
   type Logic is tagged record
      Row_Size : Integer;
      Game_Board : Game_Board_Array;
   end record;

end Game_Of_Life;
