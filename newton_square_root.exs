#!/usr/bin/env elixir

defmodule NewtonsMethod do

    def sqrt(x) do
        sqrt_iter(1.0, x)
    end

    defp sqrt_iter(guess, x) do
        case good_enough(guess, x) do
            true -> guess
            _ -> sqrt_iter(improve(guess, x), x)
        end
    end

    defp square(x) do
        x * x
    end

    defp improve(guess, x) do
        average(guess, x/guess)
    end

    defp average(x,y) do
        (x + y) / 2
    end

    defp good_enough(guess, x) do
        abs(square(guess) - x) < 0.0000000000001
    end

end

NewtonsMethod.sqrt(9)
|> IO.inspect

NewtonsMethod.sqrt(16)
|> IO.inspect
