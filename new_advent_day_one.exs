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
end

Solve.puzzle_part_one("2017_advent_day_one_input.txt")
