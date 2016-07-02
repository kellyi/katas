#!/usr/bin/env elixir

defmodule LightGrid do

    def solve(input) do
        state = Map.new(0..999, fn x -> {x, Map.new(0..999, fn y -> {y, 0} end)} end)
        open_file(input)
        |> Enum.map(&(parse_command(&1)))
        |> Enum.each(&(perform_action(&1, state)))
    end

    defp open_file(input) do
        {_, f} = File.read(input)
        String.split(f, "\n", trim: true)
    end

    defp parse_command(cmd) do
        case cmd do
            "toggle" <> rest = _ -> {:toggle, parse_numbers(rest)}
            "turn off" <> rest = _ -> {:turn_off, parse_numbers(rest)}
            "turn on" <> rest = _ -> {:turn_on, parse_numbers(rest)}
        end
    end

    defp parse_numbers(num) do
        String.split(num, "through", trim: true)
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

    # action format:
    # toggle: %{end_x: 968, end_y: 279, start_x: 609, start_y: 148}

    defp perform_action({key,value}, state) do
        case key do
            :toggle -> toggle()
            :turn_on -> IO.puts "turning on"
            :turn_off -> IO.puts "turning off"
        end
    end

    defp toggle(start_x, start_y, end_x, end_y, state) when start_x > end_x and start_y > end_y do
        state
    end

    defp toggle(start_x, start_y, end_x, end_y, state) when start_x > end_x do
        new_state = put_in(state[start_x][start_y], flip(state[start_x][start_y]))
    end

    defp toggle(start_x, start_y, end_x, end_y, state) when start_y > end_y do

    end

    defp flip(0) do
        1
    end

    defp flip(1) do
        0
    end

end

LightGrid.solve("advent_day_6_input.txt")
#|> IO.inspect
