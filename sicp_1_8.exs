#!/usr/bin/env elixir

defmodule NewtonsMethod do

    def cbrt(x) do
        cbrt_iter(1.0, x)
    end

    defp cbrt_iter(guess, x) do
        case good_enough(guess, x) do
            true -> guess
            _ -> cbrt_iter(improve(guess, x), x)
        end
    end

    defp cube(x) do
        x * x * x
    end

    defp improve(guess, x) do
        (((x/(guess * guess)) + (2 * guess)) / 3.0)
    end

    defp good_enough(guess, x) do
        abs(cube(guess) - x) < 0.000000000001
    end

end

NewtonsMethod.cbrt(27)
|> IO.inspect

NewtonsMethod.cbrt(64)
|> IO.inspect

NewtonsMethod.cbrt(5 * 5 * 5)
|> IO.inspect
