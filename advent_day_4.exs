#!/usr/bin/env elixir

defmodule AdventCoin do

    def solve(input, match) do
        check(input, 1, match)
    end

    defp check(input, counter, match) do
        case encode(input, counter, String.length(match)) == match do
            true -> counter
            _ -> check(input, counter + 1, match)
        end
    end

    defp encode(input, counter, len) do
        test_string = input <> Integer.to_string(counter)
        String.slice(Base.encode16(:crypto.hash(:md5, test_string)), 0..(len-1))
    end

end

AdventCoin.solve("bgvyzdsv", "00000")
|> IO.inspect

AdventCoin.solve("bgvyzdsv", "000000")
|> IO.inspect
