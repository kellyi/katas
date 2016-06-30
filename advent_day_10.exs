#!/usr/bin/env elixir

defmodule LookAndSay do

    def solve(input, cycles) do
        look_and_say_seq(input, cycles)
    end

    defp look_and_say_seq(input, 0) do
        String.length(input)
    end

    defp look_and_say_seq(input, cycles) do
        look_and_say_seq(transform_input(input), cycles-1)
    end

    defp transform_input(input) do
        Regex.scan(~r/(\w)\1*/, input)
        |> Enum.map(&(Integer.to_string(String.length(Enum.fetch!(&1, 0))) <> Enum.fetch!(&1, 1)))
        |> Enum.join
    end

end

LookAndSay.solve("3113322113", 40)
|> IO.inspect

LookAndSay.solve("3113322113", 50)
|> IO.inspect
