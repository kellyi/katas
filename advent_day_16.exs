#!/usr/bin/env elixir

defmodule AuntSue do

    def solve(input) do
        open_file(input)
        |> Enum.map(&(dictionary_from_string(&1)))
        |> Enum.filter(&(check_MFCSAM(&1, {"akitas", 0})))
        |> Enum.filter(&(check_MFCSAM(&1, {"vizslas", 0})))
        |> Enum.filter(&(check_MFCSAM(&1, {"perfumes", 1})))
        |> Enum.filter(&(check_MFCSAM(&1, {"cars", 2})))
        |> Enum.filter(&(check_MFCSAM(&1, {"samoyeds", 2})))
        |> Enum.filter(&(check_MFCSAM(&1, {"children", 3})))
        |> Enum.filter(&(check_MFCSAM(&1, {"trees", 3})))
        |> Enum.filter(&(check_MFCSAM(&1, {"cats", 7})))
        |> Enum.filter(&(check_MFCSAM(&1, {"pomeranians", 3})))
        |> Enum.filter(&(check_MFCSAM(&1, {"goldfish", 5})))
    end

    def solve_part_two(input) do
        open_file(input)
        |> Enum.map(&(dictionary_from_string(&1)))
        |> Enum.filter(&(check_retroencabulator(&1, {"akitas", 0, :eq})))
        |> Enum.filter(&(check_retroencabulator(&1, {"vizslas", 0, :eq})))
        |> Enum.filter(&(check_retroencabulator(&1, {"perfumes", 1, :eq})))
        |> Enum.filter(&(check_retroencabulator(&1, {"cars", 2, :eq})))
        |> Enum.filter(&(check_retroencabulator(&1, {"samoyeds", 2, :eq})))
        |> Enum.filter(&(check_retroencabulator(&1, {"children", 3, :eq})))
        |> Enum.filter(&(check_retroencabulator(&1, {"trees", 3, :gt})))
        |> Enum.filter(&(check_retroencabulator(&1, {"cats", 7, :gt})))
        |> Enum.filter(&(check_retroencabulator(&1, {"pomeranians", 3, :lt})))
        |> Enum.filter(&(check_retroencabulator(&1, {"goldfish", 5, :lt})))
    end

    defp open_file(input) do
        {_, f} = File.read(input)
        String.split(f, "\n", trim: true)
    end

    defp dictionary_from_string(str) do
        [sue, key_one, val_one, key_two, val_two, key_three, val_three] = String.split(str, [",", ":"])
        [_, n] = String.split(sue, " ")
        %{
            String.trim(key_one) => String.trim(val_one),
            String.trim(key_two) => String.trim(val_two),
            String.trim(key_three) => String.trim(val_three),
            "aunt_number" => String.trim(n)
        }
    end

    defp check_MFCSAM(dict, {key, number}) do
        case dict[key] == nil do
            true -> true
            _ -> String.to_integer(dict[key]) == number
        end
    end

    defp check_retroencabulator(dict, {key, number, comparison}) do
        case comparison do
            :gt -> check_greater_than(dict, {key, number})
            :lt -> check_less_than(dict, {key, number})
            :eq -> check_MFCSAM(dict, {key, number})
        end
    end

    defp check_greater_than(dict, {key, number}) do
        case dict[key] == nil do
            true -> true
            _ -> String.to_integer(dict[key]) > number
        end
    end

    defp check_less_than(dict, {key, number}) do
        case dict[key] == nil do
            true -> true
            _ -> String.to_integer(dict[key]) < number
        end
    end

end

AuntSue.solve("advent_day_16_input.txt")
|> IO.inspect

AuntSue.solve_part_two("advent_day_16_input.txt")
|> IO.inspect
