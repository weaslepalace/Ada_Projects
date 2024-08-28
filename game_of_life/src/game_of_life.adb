package body Game_Of_Life is

   procedure Update (L : in out Logic) is
   begin
      null;
   end Update;

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
            if Living_Neighbours < 2 or Living_Neighbours > 3 then
               New_Cell_State := Dead;
            end if;
      end case;
      return New_Cell_State;
   end Evaluate_Cell;

end Game_Of_Life;
