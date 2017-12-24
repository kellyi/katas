#!/usr/bin/env elixir

defmodule Solve do
  def puzzle_part_one(input, range_max) do
    input
    |> String.trim()
    |> String.split(",", trim: true)
    |> Enum.map(&(String.to_integer(&1)))
    |> tie_knot(Enum.to_list(Range.new(0, range_max)))
  end

  def puzzle_part_two(_, _) do
    :exit
  end

  defp tie_knot(inputs, registers) do
    tie_knot(registers, inputs, 0, 0)
  end

  defp tie_knot([f, s|_], [], _, _) do
    f * s
  end

  defp tie_knot(registers, [input|t], current, skip) when input >= length(registers) do
    registers
    |> adjust_registers(input, current)
    |> tie_knot(t, rem(current, length(registers)), skip + 1)
  end

  defp tie_knot(registers, [input|t], current, skip) do
    registers
    |> adjust_registers(input, current)
    |> tie_knot(t, rem(current + input + skip, length(registers)), skip + 1)
  end

  defp adjust_registers(registers, input, current) do
    registers
    |> rotate(current)
    |> flip(input)
    |> unrotate(current)
  end

  defp rotate(registers, current) do
    Enum.drop(registers, current) ++ Enum.take(registers, current)
  end

  defp unrotate(registers, current) do
    Enum.reverse(registers)
    |> rotate(current)
    |> Enum.reverse
  end

  defp flip(registers, input) do
    Enum.reverse(Enum.take(registers, input)) ++ Enum.drop(registers, input)
  end
end

{:ok, f} = File.read("2017_advent_day_ten_input.txt")
range_max = 255
{Solve.puzzle_part_one(f, range_max), Solve.puzzle_part_two(f, range_max)}
|> IO.inspect
