#!/usr/bin/env elixir
# https://programmingpraxis.com/2010/07/23/happy-numbers/

defmodule HappyNumbers do
    def is_happy(n) do
        check_is_happy(n, n, [])
    end

    defp check_is_happy(_, 1, _) do
        true
    end

    defp check_is_happy(n, next, lst) do
        case Enum.find(lst, fn x -> x == next end) do
            nil -> check_is_happy(n, split_and_square_number(next), Enum.concat(lst, [next]))
            _ -> false
        end
    end

    defp square(n) do
        n * n
    end

    defp string_to_integer("") do
        0
    end

    defp string_to_integer(s) do
        elem(Integer.parse(s), 0)
    end

    defp split_and_square_number(n) do
        String.split(Integer.to_string(n), "")
        |> Enum.map(&(string_to_integer(&1)))
        |> Enum.map(&(square(&1)))
        |> Enum.sum
    end

end

1..1000
|> Enum.filter(&(HappyNumbers.is_happy(&1)))
|> IO.inspect
