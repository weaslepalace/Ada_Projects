package body Game_Of_Life is

   procedure Update (L : in out Logic) is
   begin
      null;
   end Update;

   procedure Update_Cell (
      L : in out Logic
      ; C : in out Cell
      ; Living_Neighbours : Integer
   ) is
   begin
      case C.State is
         when Dead =>
            if Living_Neighbours = 3 then
               C.State := Alive;
            end if;
         when Alive =>
            null;
      end case;
   end Update_Cell;

end Game_Of_Life;
