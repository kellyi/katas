#!/usr/bin/env elixir

defmodule LongestLineOne do
    def find_longest_line(filename) do
        {:ok, f} = File.read(filename)
        f
        |> String.split("\n")
        |> Enum.with_index
        |> Enum.map(&char_count_with_line_number/1)
        |> Enum.max_by(fn({_, _, len}) -> len end)
        |> format_element
    end

    defp char_count_with_line_number({line, index}) do
        {index + 1, line, String.length(line)}
    end

    defp format_element({line_number, line, len}) do
        "Line #{line_number} has #{len} char: `#{line}`"
    end
end

LongestLineOne.find_longest_line("./new_advent_day_6.erl")
|> IO.inspect

defmodule LongestLineTwo do
    def find_longest_line(filename) do
        {:ok, f} = File.read(filename)
        f
        |> String.split("\n")
        |> search_for_longest_line
        |> format_result
    end

    defp search_for_longest_line(lines) do
        search_for_longest_line(lines, {}, 1) 
    end

    defp search_for_longest_line([], result, _) do
        result
    end

    defp search_for_longest_line([h|t], {}, current_line) do
        search_for_longest_line(t, {h, current_line, String.length(h)}, current_line + 1)
    end

    defp search_for_longest_line([h|t], {line, line_number, len}, current_line) do
        cond do
            String.length(h) > len -> search_for_longest_line(t, { h, current_line, String.length(h)}, current_line + 1)
            true -> search_for_longest_line(t, {line, line_number, len}, current_line + 1)
        end
    end

    defp format_result({line, line_number, len}) do
        "Line #{line_number} has #{len} char: `#{line}`"
    end
end

LongestLineTwo.find_longest_line("./new_advent_day_6.erl")
|> IO.inspect
