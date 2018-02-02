defmodule CalcTest do
  use ExUnit.Case
  doctest Calc

  test "sample expressions" do
  	assert Calc.eval("2 + 3") == 5
  	assert Calc.eval("5 * 1") == 5
  	assert Calc.eval("20 / 4") == 5
  	assert Calc.eval("24 / 6 + (5 - 4)") == 5
  end

  test "additional expressions" do
  	assert Calc.eval("2 - 3") == -1
  	assert Calc.eval("5 * 10") == 50
  	assert Calc.eval("20 / 5") == 4
  	assert Calc.eval("24 / 6 + (5 - 5)") == 4
  	assert Calc.eval("(1 + 2) * (3 + 4)") == 21
  end
end
