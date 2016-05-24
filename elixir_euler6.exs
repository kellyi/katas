#!/usr/bin/env elixir

sum_of_squares = 1..100 |> Stream.map(&(&1 * &1)) |> Enum.sum
sum = 1..100 |> Enum.sum
IO.puts sum * sum - sum_of_squares
