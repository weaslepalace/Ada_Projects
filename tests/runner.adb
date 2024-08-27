with AUnit.Reporter.Text;
with AUnit.Run;
with Test_Suite; use Test_Suite;

procedure Runner is
   procedure Test_Runner is new AUnit.Run.Test_Runner (Suite);
   Reporter : AUnit.Reporter.Text.Text_Reporter;
begin
   Test_Runner (Reporter);
end Runner;
