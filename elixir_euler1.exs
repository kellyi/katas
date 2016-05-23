#!/usr/bin/env elixir
# sum all multiples of 3 & 5 below 1000

IO.puts Enum.filter(1..999, fn (a) -> (rem(a, 3) == 0 || rem(a, 5) == 0) end) |> Enum.sum
