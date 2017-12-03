#!/usr/bin/env elixir

defmodule Solve do
  def puzzle_part_one(input) do
    input
    |> String.trim
    |> String.to_integer
    |> walk_graph
  end

  def puzzle_part_two(input) do
    input
    |> String.trim
    |> String.to_integer
  end

  defp walk_graph(n) do
    walk_graph(n - 1, 0, 0, 0, 0, :east)
  end

  defp walk_graph(0, x, y, _, _, _) do
    abs(x) + abs(y)
  end

  defp walk_graph(n, x, y, xmax, ymax, _) when x > xmax do
    walk_graph(n - 1, x, y + 1, xmax + 1, ymax + 1, :north)
  end

  defp walk_graph(n, x, y, xmax, ymax, :east) do
    walk_graph(n - 1, x + 1, y, xmax, ymax, :east)
  end

  defp walk_graph(n, x, y, xmax, ymax, :north) when y == ymax do
    walk_graph(n - 1, x - 1, y, xmax, ymax, :west)
  end

  defp walk_graph(n, x, y, xmax, ymax, :north) do
    walk_graph(n - 1, x, y + 1, xmax, ymax, :north)
  end

  defp walk_graph(n, x, y, xmax, ymax, :west) when abs(x) == xmax do
    walk_graph(n - 1, x, y - 1, xmax, ymax, :south)
  end

  defp walk_graph(n, x, y, xmax, ymax, :west) do
    walk_graph(n - 1, x - 1, y, xmax, ymax, :west)
  end

  defp walk_graph(n, x, y, xmax, ymax, :south) when abs(y) == ymax do
    walk_graph(n - 1, x + 1, y, xmax, ymax, :east)
  end

  defp walk_graph(n, x, y, xmax, ymax, :south) do
    walk_graph(n - 1, x, y - 1, xmax, ymax, :south)
  end
end

{:ok, input} = File.read("2017_advent_day_three_input.txt")
{Solve.puzzle_part_one(input), Solve.puzzle_part_two(input)}
|> IO.inspect
