#!/usr/bin/env elixir

Stream.unfold({1, 1}, fn {a, b} -> {a, {b, a + b}} end)
|> Enum.take_while(&(&1 < 4000000))
|> Enum.filter(&(rem(&1,2) ==0))
|> Enum.sum
|> IO.inspect
