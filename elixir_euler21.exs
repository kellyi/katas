#!/usr/bin/env elixir

defmodule Amicable do

    def sum_divisors(n) when n <= 1 do
        0
    end

    def sum_divisors(n) when n > 1 do
        1..n-1 |> Enum.filter(fn d -> rem(n, d) == 0 end) |> Enum.sum
    end

end


Enum.filter(1..9999, fn x ->
    x == Amicable.sum_divisors(Amicable.sum_divisors(x))
        and x != Amicable.sum_divisors(x)
end) |> Enum.sum |> IO.inspect
