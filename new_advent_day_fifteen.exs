#!/usr/bin/env elixir

defmodule Solve do
  def puzzle_part_one(input) do
    input
    |> generate_numbers
  end

  def puzzle_part_two(_) do
    :exit
  end

  defp generate_numbers({a_start, b_start, cycles}) do
    generate_numbers(cycles, a_start, b_start, 0)
  end

  defp generate_numbers(0, a, b, matches) do
    case is_match(a, b) do
      true -> matches + 1
      _ -> matches
    end
  end

  defp generate_numbers(cycles, a, b, matches) do
    case is_match(a, b) do
      true -> generate_numbers(cycles - 1, generate_a(a), generate_b(b), matches + 1)
      _ -> generate_numbers(cycles - 1, generate_a(a), generate_b(b), matches)
    end
  end

  defp generate_a(a) do
    rem(a * 16807, 2147483647)
  end

  defp generate_b(b) do
    rem(b * 48271, 2147483647)
  end

  defp is_match(a, b) do
    bin_a = Integer.to_string(a, 2)
            |> String.pad_leading(16, "0")
            |> String.slice(-16..-1)
    bin_b = Integer.to_string(b, 2)
            |> String.pad_leading(16, "0")
            |> String.slice(-16..-1)
    bin_a == bin_b
  end
end

{618, 814, 40000000}
|> Solve.puzzle_part_one
|> IO.inspect
