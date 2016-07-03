#!/usr/bin/env elixir

defmodule GiftDelivery do

    def solve(input) do
        open_file(input)
        |> count_houses
    end

    defp open_file(input) do
        {_, f} = File.read(input)
        String.split(f, "", trim: true)
        |> Enum.filter(&(&1 != "\n"))
    end

    defp count_houses(list) do
        count_houses(list, {0,0}, [{0,0}])
    end

    defp count_houses([h|t], position, delivered) when t == [] do
        new_position = case h do
            ">" -> {elem(position,0) + 1, elem(position,1)}
            "<" -> {elem(position,0) - 1, elem(position,1)}
            "^" -> {elem(position,0), elem(position,1) + 1}
            "v" -> {elem(position,0), elem(position,1) - 1}
        end
        new_delivered = case Enum.find(delivered, &(&1 == new_position)) do
            nil -> Enum.concat(delivered, [new_position])
            _ -> delivered
        end
        Enum.count(new_delivered)
    end

    defp count_houses([h|t], position, delivered) do
        new_position = case h do
            ">" -> {elem(position,0) + 1, elem(position,1)}
            "<" -> {elem(position,0) - 1, elem(position,1)}
            "^" -> {elem(position,0), elem(position,1) + 1}
            "v" -> {elem(position,0), elem(position,1) - 1}
        end
        new_delivered = case Enum.find(delivered, &(&1 == new_position)) do
            nil -> Enum.concat(delivered, [new_position])
            _ -> delivered
        end
        count_houses(t, new_position, new_delivered)
    end

end

GiftDelivery.solve("advent_day_3_input.txt")
|> IO.inspect

defmodule GiftDeliveryTwo do

    def solve(input) do
        open_file(input)
        |> count_houses
    end

    defp open_file(input) do
        {_, f} = File.read(input)
        String.split(f, "", trim: true)
        |> Enum.filter(&(&1 != "\n"))
    end

    defp count_houses(list) do
        count_houses(list, 0, {0,0}, {0,0}, [{0,0}])
    end

    defp count_houses([h|t], turn, santa_pos, robo_santa_pos, delivered) when t == [] do
        base_position = case rem(turn,2) do
            0 -> santa_pos
            1 -> robo_santa_pos
        end
        new_position = case h do
            ">" -> {elem(base_position,0) + 1, elem(base_position,1)}
            "<" -> {elem(base_position,0) - 1, elem(base_position,1)}
            "^" -> {elem(base_position,0), elem(base_position,1) + 1}
            "v" -> {elem(base_position,0), elem(base_position,1) - 1}
        end
        new_delivered = case Enum.find(delivered, &(&1 == new_position)) do
            nil -> Enum.concat(delivered, [new_position])
            _ -> delivered
        end
        Enum.count(new_delivered)
    end

    defp count_houses([h|t], turn, santa_pos, robo_santa_pos, delivered) do
        base_position = case rem(turn,2) do
            0 -> santa_pos
            1 -> robo_santa_pos
        end
        new_position = case h do
            ">" -> {elem(base_position,0) + 1, elem(base_position,1)}
            "<" -> {elem(base_position,0) - 1, elem(base_position,1)}
            "^" -> {elem(base_position,0), elem(base_position,1) + 1}
            "v" -> {elem(base_position,0), elem(base_position,1) - 1}
        end
        new_delivered = case Enum.find(delivered, &(&1 == new_position)) do
            nil -> Enum.concat(delivered, [new_position])
            _ -> delivered
        end
        case rem(turn,2) do
            0 -> count_houses(t, turn+1, new_position, robo_santa_pos, new_delivered)
            1 -> count_houses(t, turn+1, santa_pos, new_position, new_delivered)
        end
    end

end

GiftDeliveryTwo.solve("advent_day_3_input.txt")
|> IO.inspect
