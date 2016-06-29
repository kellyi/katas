#!/usr/bin/env elixir

defmodule NiceStrings do

    def solve_part_one(filename) do
        open_file(filename)
        |> Enum.filter(&(does_not_contain(&1)))
        |> Enum.filter(&(contains_three_vowels(&1)))
        |> Enum.filter(&(contains_duplicated_letter(&1)))
        |> Enum.count
    end

    def solve_part_two(filename) do
        open_file(filename)
        |> Enum.filter(&(contains_two_nonoverlapping(&1)))
        |> Enum.filter(&(contains_one_repeat_with_one_between(&1)))
        |> Enum.count
    end

    defp open_file(filename) do
        {_, f} = File.read(filename)
        String.split(f, "\n")
    end

    defp does_not_contain(s) do
        case String.contains?(s, "ab") or
             String.contains?(s, "cd") or
             String.contains?(s, "pq") or
             String.contains?(s, "xy") do
            true -> false
            _ -> true
        end
    end

    defp contains_three_vowels(s) do
        check_three_vowels(String.split(s, ""), 0)
    end

    defp check_three_vowels(_, counter) when counter >= 3 do
        true
    end

    defp check_three_vowels([_|t], _) when t == [] do
        false
    end

    defp check_three_vowels([h|t], counter) do
        case h == "a" or h == "e" or h == "i" or h =="o" or h == "u" do
            true -> check_three_vowels(t, counter+1)
            _ -> check_three_vowels(t, counter)
        end
    end

    defp contains_duplicated_letter(s) do
        check_duplicated_letter(String.split(s, "", trim: true), "")
    end

    defp check_duplicated_letter([h|t], last_letter) when last_letter == "" do
        check_duplicated_letter(t, h)
    end

    defp check_duplicated_letter([h|_], last_letter) when h == last_letter do
        true
    end

    defp check_duplicated_letter([_|t], _) when t == [] do
        false
    end

    defp check_duplicated_letter([h|t], _) do
        check_duplicated_letter(t,h)
    end

    defp contains_one_repeat_with_one_between(s) do
        check_one_repeat_one_between(String.split(s, ""), "", "")
    end

    defp check_one_repeat_one_between([h|_], _, two_back) when h == two_back do
        true
    end

    defp check_one_repeat_one_between([_|t], _, _) when t == [] do
        false
    end

    defp check_one_repeat_one_between([h|t], one_back, _) do
        check_one_repeat_one_between(t, h, one_back)
    end

    defp contains_two_nonoverlapping(s) do
        check_two_nonoverlapping(String.split(s, ""), "", "", "", [])
    end

    defp check_two_nonoverlapping([h|t], one_back, two_back, _, pairs) when t == [] do
        Enum.filter(pairs, &(&1 == one_back <> two_back)) != [] and h != two_back
    end

    defp check_two_nonoverlapping([h|t], one_back, two_back, three_back, pairs) when one_back == "" do
        check_two_nonoverlapping(t, h, two_back, three_back, pairs)
    end

    defp check_two_nonoverlapping([h|t], one_back, two_back, three_back, pairs) when two_back == "" do
        check_two_nonoverlapping(t, h, one_back, three_back, pairs)
    end

    defp check_two_nonoverlapping([h|t], one_back, two_back, three_back, pairs)
        when not (one_back == two_back and one_back == three_back) do
        case Enum.filter(pairs, &(&1 == one_back <> two_back)) != [] do
            true -> true
            _ -> check_two_nonoverlapping(t, h, one_back, two_back, Enum.concat(pairs, [one_back <> two_back]))
        end
    end

    defp check_two_nonoverlapping([h|t], one_back, two_back, _, pairs) do
        check_two_nonoverlapping(t, h, one_back, two_back, pairs)
    end

end

NiceStrings.solve_part_one("advent_day_5_input.txt")
|> IO.inspect

NiceStrings.solve_part_two("advent_day_5_input.txt")
|> IO.inspect
