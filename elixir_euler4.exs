#!/usr/bin/env elixir

defmodule PalindromicProduct do

    def largest_of_n_digits(n) when n >= 1 do
        lst = round(:math.pow(10,n-1))..round(:math.pow(10, n))-1
        Enum.map(lst, fn multiplier ->
            Enum.map(lst, fn multiplicand ->
                multiplier * multiplicand
            end)
        end)
        |> Enum.flat_map(fn x -> x end)
        |> Enum.filter(fn x ->
            Integer.to_string(x) == String.reverse(Integer.to_string(x))
        end)
        |> Enum.max
    end

end

PalindromicProduct.largest_of_n_digits(3)
|> IO.inspect
