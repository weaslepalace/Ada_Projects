package Game_Of_Life is

   type Logic is tagged private;
   type Cell is private;

   type Cell_State is (
      Dead
      , Alive
   );

   procedure Update (L : in out Logic);
   procedure Update_Cell (
      L : in out Logic
      ; C : in out Cell
      ; Living_Neighbours : Integer
   );

private

   type Cell is record
      State : Cell_State;
   end record;

   type Logic is tagged record
      Value : Integer;
   end record;

end Game_Of_Life;
