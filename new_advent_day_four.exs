#!/usr/bin/env elixir

defmodule Solve do
  def puzzle_part_one(input) do
    input
    |> String.split("\n", trim: true)
    |> Enum.map(&(String.split(&1, " ", trim: true)))
    |> Enum.map(&(is_valid(&1)))
    |> Enum.count(fn(x) -> x end)
  end

  def puzzle_part_two(input) do
    input
    |> String.split("\n", trim: true)
    |> Enum.map(&(String.split(&1, " ", trim: true)))
    |> Enum.map(&(alt_is_valid(&1)))
    |> Enum.count(fn(x) -> x end)
  end

  defp is_valid(phrase) do
    length(Enum.uniq(phrase)) == length(phrase)
  end

  defp alt_is_valid(phrase) do
    length(phrase) == sorted_uniq_phrase_length(phrase)
  end

  defp sorted_uniq_phrase_length(phrase) do
    Enum.map(phrase, &(sort_element(&1)))
    |> Enum.uniq
    |> length
  end

  defp sort_element(el) do
    String.split(el, "", trim: true)
    |> Enum.sort
    |> Enum.join("")
  end
end

{:ok, input} = File.read("2017_advent_day_four_input.txt")
{Solve.puzzle_part_one(input), Solve.puzzle_part_two(input)}
|> IO.inspect
