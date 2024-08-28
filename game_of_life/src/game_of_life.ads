package Game_Of_Life is

   type Logic is tagged private;
   type Cell is private;

   type Cell_State is (
      Dead
      , Alive
   );

   procedure Update (L : in out Logic);

   function Evaluate_Cell (
      C : in out Cell
      ; Living_Neighbours : Integer
   )
   return Cell_State;

private

   type Cell is record
      State : Cell_State;
   end record;

   type Logic is tagged record
      Value : Integer;
   end record;

end Game_Of_Life;
