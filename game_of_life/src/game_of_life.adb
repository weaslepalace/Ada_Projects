package body Game_Of_Life is

   procedure Update (L : in out Logic) is
   begin
      null;
   end Update;

   function Count_Living_Neighbours (
      L : in out Logic
      ; Cell_Index : Integer
   ) return Integer is

      type Neighbour_Indicies_Record is record
         N : Integer;
         NE : Integer;
         E : Integer;
         SE : Integer;
         S : Integer;
         SW : Integer;
         W : Integer;
         NW : Integer;
      end record;

      Neighbours_Indicies : constant Neighbour_Indicies_Record := (
         N => Cell_Index - L.Row_Size
         , NE => Cell_Index - L.Row_Size + 1
         , E => Cell_Index + 1
         , SE => Cell_Index + L.Row_Size + 1
         , S => Cell_Index + L.Row_Size
         , SW => Cell_Index + L.Row_Size - 1
         , W => Cell_Index - 1
         , NW => Cell_Index - L.Row_Size - 1
      );

      function Evaluate_Neighbour (Index : Integer) return Integer is
         Neighbour : constant Cell := L.Game_Board (Index);
      begin
         if Neighbour.State = Alive then
            return 1;
         else
            return 0;
         end if;
      end Evaluate_Neighbour;

      Neighbour_Count : Integer;

   begin
      Neighbour_Count :=
         Evaluate_Neighbour (Neighbours_Indicies.N)
         + Evaluate_Neighbour (Neighbours_Indicies.NE)
         + Evaluate_Neighbour (Neighbours_Indicies.E)
         + Evaluate_Neighbour (Neighbours_Indicies.SE)
         + Evaluate_Neighbour (Neighbours_Indicies.S)
         + Evaluate_Neighbour (Neighbours_Indicies.SW)
         + Evaluate_Neighbour (Neighbours_Indicies.W)
         + Evaluate_Neighbour (Neighbours_Indicies.NW)
         ;
      return Neighbour_Count;
   end Count_Living_Neighbours;

   function Evaluate_Cell (
      C : in out Cell
      ; Living_Neighbours : Integer
   )
   return Cell_State is
      New_Cell_State : Cell_State := C.State;
   begin
      case C.State is
         when Dead =>
            if Living_Neighbours = 3 then
               New_Cell_State := Alive;
            end if;
         when Alive =>
            if Living_Neighbours < 2 or else Living_Neighbours > 3 then
               New_Cell_State := Dead;
            end if;
      end case;
      return New_Cell_State;
   end Evaluate_Cell;

end Game_Of_Life;
