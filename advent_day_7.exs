#!/usr/bin/env elixir

defmodule BitwiseCircuits do
    use Bitwise

    def solve(input) do
        open_file(input)
        |> parse_input
        |> derive_results
    end

    defp open_file(input) do
        {_, f} = File.read(input)
        String.split(f, "\n", trim: true)
    end

    defp derive_results(commands) do
        derive_results(commands, %{})
    end

    defp derive_results([], state) do
        state
    end

    defp derive_results([h|t], state) do
        new_state = exec_command(h, state)
        derive_results(t, new_state)
    end

    def parse_input(input) do
        Enum.map(input, &(create_command(&1)))
    end

    defp create_command(cmd) do
        [operation, value] = String.split(cmd, "->", trim: true)
        new_operation = operation_to_tuple(String.split(operation, " ", trim: true))
        %{
            :op => elem(new_operation, 0),
            :operands => elem(new_operation, 1),
            :value => String.trim(value)
        }
    end

    defp operation_to_tuple(op) do
        op_tuple = List.to_tuple(op)
        case Enum.count(op) do
            1 -> {"ASSIGN", {elem(op_tuple, 0)}}
            2 -> {elem(op_tuple, 0), {elem(op_tuple, 1)}}
            3 -> {elem(op_tuple, 1), {elem(op_tuple, 0), elem(op_tuple, 2)}}
        end
    end

    defp is_int(s) do
        case Integer.parse(s) do
            :error -> false
            _ -> true
        end
    end

    defp get_element(element, state) do
        case Map.has_key?(state, element) do
            true -> state[element]
            _ -> case is_int(element) do
                true -> String.to_integer(element)
                _ -> element
            end
        end
    end

    defp bitwise_assign(element, state, value) do
        Map.put(state, value, get_element(element, state))
    end

    defp bitwise_not(element, state, value) do
        # hard coded to force using 16 bit integers
        Map.put(state, value, 65535 - get_element(element, state))
    end

    defp bitwise_and(left, right, state, value) do
        Map.put(state, value, band(get_element(left, state), get_element(right, state)))
    end

    defp bitwise_or(left, right, state, value) do
        Map.put(state, value, bor(get_element(left, state), get_element(right, state)))
    end

    defp bitwise_lshift(left, right, state, value) do
        Map.put(state, value, bsl(get_element(left, state), get_element(right, state)))
    end

    defp bitwise_rshift(left, right, state, value) do
        Map.put(state, value, bsr(get_element(left, state), get_element(right, state)))
    end

    defp exec_command(cmd, state) do
        case cmd[:op] do
            "ASSIGN" -> bitwise_assign(elem(cmd[:operands], 0), state, cmd[:value])
            "AND" -> bitwise_and(elem(cmd[:operands], 0), elem(cmd[:operands], 1), state, cmd[:value])
            "OR" -> bitwise_or(elem(cmd[:operands], 0), elem(cmd[:operands], 1), state, cmd[:value])
            "LSHIFT" ->  bitwise_lshift(elem(cmd[:operands], 0), elem(cmd[:operands], 1), state, cmd[:value])
            "RSHIFT" -> bitwise_rshift(elem(cmd[:operands], 0), elem(cmd[:operands], 1), state, cmd[:value])
            "NOT" -> bitwise_not(elem(cmd[:operands], 0), state, cmd[:value])
        end
    end

end

BitwiseCircuits.solve("advent_day_7_test_input.txt")
|> IO.inspect
