defmodule BankKataOcr do

  @zero " _ " <>
        "| |" <>
        "|_|" <>
        "   "

  def zero(), do: @zero

  def digit(@zero), do: "0"

  def readOCR(s) do
    extract_digits(s) |> Enum.reduce("", fn s, acc -> acc <> digit(s) end)
  end

  def extract_digits(s) do
    String.split(s, "\n") |>
      extract_digit([])
  end

  defp extract_digit(["", "", "", ""], acc), do: acc

  defp extract_digit(strings, acc) do
    digit = Enum.reduce(strings, "", fn s, a -> a <> String.slice(s, 0, 3) end)
    rest = Enum.map(strings, fn s -> String.slice(s, 3..-1) end)
    extract_digit(rest, acc ++ [digit])
  end

end
