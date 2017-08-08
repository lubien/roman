defmodule RomanTest do
  use ExUnit.Case
  doctest Roman

  test "the truth" do
    assert Roman.to_integer("I") == 1
    assert Roman.to_integer("II") == 2
    assert Roman.to_integer("III") == 3

    assert Roman.to_integer("V") == 5

    assert Roman.to_integer("X") == 10
    assert Roman.to_integer("XX") == 20
    assert Roman.to_integer("XXX") == 30

    assert Roman.to_integer("VII") == 7
    assert Roman.to_integer("VIII") == 8
    assert Roman.to_integer("IX") == 9
    assert Roman.to_integer("XC") == 90

    assert Roman.to_integer("MCMLIV") == 1954
    assert Roman.to_integer("MCMXC") == 1990
    assert Roman.to_integer("MMXIV") == 2014
  end
end
