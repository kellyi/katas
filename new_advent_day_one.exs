#!/usr/bin/env elixir

defmodule Solve do
  def puzzle_part_one(input) do
    {:ok, f} = File.read(input)
    f
    |> String.trim_trailing
    |> String.split("", trim: true)
    |> Enum.map(&(String.to_integer(&1)))
    |> check_digits
    |> IO.inspect
  end

  def puzzle_part_two(input) do
    {:ok, f} = File.read(input)
    f
    |> String.trim_trailing
    |> String.split("", trim: true)
    |> Enum.map(&(String.to_integer(&1)))
    |> alt_check_digits
    |> IO.inspect
  end

  defp check_digits([h|t]) do
    check_digits([h|t], 0, h)
  end

  defp check_digits([last|[]], acc, first) when last == first do
    acc + first
  end

  defp check_digits([_|[]], acc, _) do
    acc
  end

  defp check_digits([f, s|t], acc, first) when f == s do
    check_digits([s|t], acc + f, first)
  end

  defp check_digits([_|t], acc, first) do
    check_digits(t, acc, first)
  end

  defp alt_check_digits(list) do
    alt_check_digits(list, rotate(list, div(length(list), 2)), 0, 0)
  end

  defp alt_check_digits([], _, _, acc) do
    acc
  end

  defp alt_check_digits([h|t], list, counter, acc) do
    case h == hd(rotate(list, counter)) do
      true -> alt_check_digits(t, list, counter + 1, acc + h)
      _ -> alt_check_digits(t, list, counter + 1, acc)
    end
  end

  defp rotate(list, rotation) do
    Enum.drop(list, rotation) ++ Enum.take(list, rotation)
  end
end

Solve.puzzle_part_one("2017_advent_day_one_input.txt")
Solve.puzzle_part_two("2017_advent_day_one_input.txt")
