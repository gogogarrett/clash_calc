defmodule ClashCalcTest do
  use ExUnit.Case

  test "profit?" do
    troops = [
      %{ troop: "archer", level: 6, number: 102 },
      %{ troop: "barb", level: 6, number: 63 },
      %{ troop: "giant", level: 6, number: 11 },
      %{ spell: "healing", level: 2, number: 1}
    ]
    assert ClashCalc.profit?(100_000, troops) == true
  end
end
