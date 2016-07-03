#!/usr/bin/env elixir

defmodule LightGrid do

    def solve(input) do
        open_file(input)
        |> Enum.map(&(parse_command(&1)))
        |> derive_results
        |> count_results
    end

    defp open_file(input) do
        {_, f} = File.read(input)
        String.split(f, "\n", trim: true)
    end

    defp derive_results(commands) do
        derive_results(commands, Map.new(0..999, fn x -> {x, Map.new(0..999, fn y -> {y, 0} end)} end))
    end

    defp derive_results([h|t], state) when t == [] do
        perform_action(h, state)
    end

    defp derive_results([h|t], state) do
        new_state = perform_action(h, state)
        derive_results(t, new_state)
    end

    defp count_results(results) do
        count_results(results, 999, 0)
    end

    defp count_results(_, x, accumulator) when x < 0 do
        accumulator
    end

    defp count_results(results, x, accumulator) do
        count_results(results, x-1, accumulator+Enum.sum(Map.values(results[x])))
    end

    defp parse_command(cmd) do
        case cmd do
            "toggle" <> rest -> {:toggle, parse_numbers(rest)}
            "turn off" <> rest -> {:turn_off, parse_numbers(rest)}
            "turn on" <> rest -> {:turn_on, parse_numbers(rest)}
        end
    end

    defp parse_numbers(num) do
        String.split(num, "through")
        |> Enum.map(&(String.trim(&1)))
        |> Enum.flat_map(&(String.split(&1, ",")))
        |> Enum.map(&(String.to_integer(&1)))
        |> create_tuples
    end

    defp create_tuples(num_list) do
        %{
            :start_x => elem(Enum.fetch(num_list, 0), 1),
            :start_y => elem(Enum.fetch(num_list, 1), 1),
            :end_x => elem(Enum.fetch(num_list, 2), 1),
            :end_y => elem(Enum.fetch(num_list, 3), 1)
        }
    end

    defp perform_action({action,val}, state) do
        act(action, val[:start_x], val[:start_y], val[:end_x], val[:end_y], state, val)
    end

    defp act(_, x, _, end_x, _, state, _) when x > end_x do
        state
    end

    defp act(action, x, y, end_x, end_y, state, val) when y > end_y do
        act(action, x+1, val[:start_y], end_x, end_y, state, val)
    end

    defp act(action, x, y, end_x, end_y, state, val) do
        new_state = case action do
            :turn_on -> put_in(state[x][y], 1)
            :turn_off -> put_in(state[x][y], 0)
            :toggle -> put_in(state[x][y], toggle(state[x][y]))
        end
        act(action, x, y+1, end_x, end_y, new_state, val)
    end

    defp toggle(0) do
        1
    end

    defp toggle(1) do
        0
    end

end

LightGrid.solve("advent_day_6_input.txt")
|> IO.inspect

defmodule LightGridTwo do

    def solve(input) do
        open_file(input)
        |> Enum.map(&(parse_command(&1)))
        |> derive_results
        |> count_results
    end

    defp open_file(input) do
        {_, f} = File.read(input)
        String.split(f, "\n", trim: true)
    end

    defp derive_results(commands) do
        derive_results(commands, Map.new(0..999, fn x -> {x, Map.new(0..999, fn y -> {y, 0} end)} end))
    end

    defp derive_results([h|t], state) when t == [] do
        perform_action(h, state)
    end

    defp derive_results([h|t], state) do
        new_state = perform_action(h, state)
        derive_results(t, new_state)
    end

    defp count_results(results) do
        count_results(results, 999, 0)
    end

    defp count_results(_, x, accumulator) when x < 0 do
        accumulator
    end

    defp count_results(results, x, accumulator) do
        count_results(results, x-1, accumulator+Enum.sum(Map.values(results[x])))
    end

    defp parse_command(cmd) do
        case cmd do
            "toggle" <> rest -> {:toggle, parse_numbers(rest)}
            "turn off" <> rest -> {:turn_off, parse_numbers(rest)}
            "turn on" <> rest -> {:turn_on, parse_numbers(rest)}
        end
    end

    defp parse_numbers(num) do
        String.split(num, "through")
        |> Enum.map(&(String.trim(&1)))
        |> Enum.flat_map(&(String.split(&1, ",")))
        |> Enum.map(&(String.to_integer(&1)))
        |> create_tuples
    end

    defp create_tuples(num_list) do
        %{
            :start_x => elem(Enum.fetch(num_list, 0), 1),
            :start_y => elem(Enum.fetch(num_list, 1), 1),
            :end_x => elem(Enum.fetch(num_list, 2), 1),
            :end_y => elem(Enum.fetch(num_list, 3), 1)
        }
    end

    defp perform_action({action,val}, state) do
        act(action, val[:start_x], val[:start_y], val[:end_x], val[:end_y], state, val)
    end

    defp act(_, x, _, end_x, _, state, _) when x > end_x do
        state
    end

    defp act(action, x, y, end_x, end_y, state, val) when y > end_y do
        act(action, x+1, val[:start_y], end_x, end_y, state, val)
    end

    defp act(action, x, y, end_x, end_y, state, val) do
        new_state = case action do
            :turn_on -> put_in(state[x][y], state[x][y]+1)
            :toggle -> put_in(state[x][y], state[x][y]+2)
            :turn_off -> case state[x][y] > 0 do
                true -> put_in(state[x][y], state[x][y]-1)
                _ -> put_in(state[x][y], 0)
            end
        end
        act(action, x, y+1, end_x, end_y, new_state, val)
    end

end

LightGridTwo.solve("advent_day_6_input.txt")
|> IO.inspect
