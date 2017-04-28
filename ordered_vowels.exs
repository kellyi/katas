#!/usr/bin/env elixir

defmodule OrderedVowels do
    def solve do
        {:ok, f} = File.read("./unixdict.txt")
        f
        |> String.split("\n")
        |> Enum.map(&make_tuple_with_vowels/1)
        |> Enum.filter(&has_ordered_vowels/1)
        |> Enum.map(fn({word, _}) -> word end)
    end

    defp make_tuple_with_vowels(str) do
        {str, find_vowels(str)}
    end

    defp find_vowels(str) do
        find_vowels(String.split(str, ""), [])
    end

    defp find_vowels([], vowels) do
        Enum.reverse(vowels)
    end

    defp find_vowels([h|t], vowels) do
        case Enum.member?(["a", "e", "i", "o", "u"], h) do
            true -> find_vowels(t, [h|vowels])
            _ -> find_vowels(t, vowels)
        end
    end

    defp has_ordered_vowels({_, []}) do
        false
    end

    defp has_ordered_vowels({_, vowels}) do
        has_ordered_vowels(vowels)
    end

    defp has_ordered_vowels([h|t]) do
        has_ordered_vowels(t, h)
    end

    defp has_ordered_vowels([], _) do
        true
    end

    defp has_ordered_vowels([h|t], check) do
        case check <= h do
            true -> has_ordered_vowels(t, h)
            _ -> false
        end
    end
end

OrderedVowels.solve
|> IO.inspect
