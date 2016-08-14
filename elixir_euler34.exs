#!/usr/bin/env elixir

defmodule DigitFactorials do
    def solve() do
        count(3, 0)
    end

    defp count(n, acc) when n >= 10000000 do
        acc
    end

    defp count(n, acc) do
        case check(n) do
            true -> count(n + 1, acc + n)
            _ -> count(n + 1, acc)
        end
    end

    defp split(n) do
        split(n, [])
    end

    defp split(n, list) when n < 10 do
        Enum.concat(list, [n])
    end

    defp split(n, list) do
        split(div(n, 10), Enum.concat(list, [rem(n, 10)]))
    end

    def factorial(n) do
        factorial(n, 1)
    end

    defp factorial(n, accumulator) when n == 0 or n == 1 do
        accumulator
    end

    defp factorial(n, accumulator) do
        factorial(n - 1, accumulator * n)
    end

    defp check(n) do
        n == Enum.sum(Enum.map(split(n), fn x -> factorial(x) end))
    end
end

DigitFactorials.solve()
|> IO.inspect
