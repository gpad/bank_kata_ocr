defmodule BankKataOcrTest do
  use ExUnit.Case
  doctest BankKataOcr
  @zeros  " _  _  _  _  _  _  _  _  _ \n" <>
          "| || || || || || || || || |\n" <>
          "|_||_||_||_||_||_||_||_||_|\n" <>
          "                           "

  test "extract digits string" do
    assert BankKataOcr.extract_digits(@zeros) == ((1..9) |> Enum.map(fn _ -> BankKataOcr.zero end))
  end

  test "read all zeros" do
    assert BankKataOcr.readOCR(@zeros) == "000000000"
  end
end
