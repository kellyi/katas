#!/usr/bin/env elixir

defmodule Solve do
  use Bitwise

  def puzzle_part_one(input, range_max) do
    input
    |> String.trim()
    |> String.split(",", trim: true)
    |> Enum.map(&(String.to_integer(&1)))
    |> tie_knot(Enum.to_list(Range.new(0, range_max)))
    |> calculate_answer
  end

  def puzzle_part_two(input, range_max) do
    input
    |> String.trim()
    |> String.codepoints()
    |> Enum.map(fn(x) -> Code.eval_string("?#{x}") end)
    |> Enum.concat(Enum.map([17, 31, 73, 47, 23], fn(x) -> {x, []} end))
    |> Enum.map(fn({x, []}) -> Integer.to_string(x) end)
    |> Enum.map(&(String.to_integer(&1)))
    |> create_sparse_hash(Enum.to_list(Range.new(0, range_max)))
    |> create_dense_hash
    |> Enum.join
  end

  defp calculate_answer({[f, s|_], _, _}) do
    f * s
  end

  defp tie_knot(inputs, registers) do
    tie_knot(registers, inputs, 0, 0)
  end

  defp tie_knot(registers, [], current, skip) do
    {registers, current, skip}
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

  defp create_sparse_hash(inputs, register) do
    create_sparse_hash(inputs, register, 64, 0, 0)
  end

  defp create_sparse_hash(_, register, 0, _, _) do
    register
  end

  defp create_sparse_hash(inputs, register, round, current, skip) do
    {new_register, new_current, new_skip} = tie_knot(register, inputs, current, skip)
    create_sparse_hash(inputs, new_register, round - 1, new_current, new_skip)
  end

  defp create_dense_hash(register) do
    register
    |> Enum.chunk_every(16)
    |> Enum.map(fn(l) -> Enum.reduce(l, fn(x, y) -> x ^^^ y end) end)
    |> Enum.map(fn(x) -> pad_hex(Integer.to_string(x, 16)) end)
  end

  defp pad_hex(hex) do
    case String.length(hex) == 1 do
      true -> "0#{hex}"
      _ -> hex
    end
  end
end

{:ok, f} = File.read("2017_advent_day_ten_input.txt")
range_max = 255
{Solve.puzzle_part_one(f, range_max), Solve.puzzle_part_two(f, range_max)}
|> IO.inspect
