with Game_Of_Life.Tests; use Game_Of_Life.Tests;
with AUnit.Test_Caller;

package body Test_Suite is

   use AUnit.Test_Suites;

   package Caller is new AUnit.Test_Caller (Logic_Test);

   function Suite return Access_Test_Suite is
      Result : constant Access_Test_Suite := New_Suite;
   begin
      AUnit.Test_Suites.Add_Test (
         Result
         , Caller.Create (
            "Test_Update"
            , Test_Update'Access
         )
      );
      AUnit.Test_Suites.Add_Test (
         Result
         , Caller.Create (
            "Test_Evaluate_Cell"
            , Test_Evaluate_Cell'Access
         )
      );
      AUnit.Test_Suites.Add_Test (
         Result
         , Caller.Create (
            "Test_Count_Living_Neighbours"
            , Test_Count_Living_Neighbours'Access
         )
      );
      return Result;
   end Suite;
end Test_Suite;
