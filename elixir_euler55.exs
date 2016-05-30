#!/usr/bin/env elixir

defmodule Lychrel do

    def is_lychrel(n) do
        sum_palindrome(n, 0)
    end

    defp sum_palindrome(_, 50) do
        true
    end

    defp sum_palindrome(n, 0) do
        sum_palindrome(next_term(n), 1)
    end

    defp sum_palindrome(n, count) do
        case is_palindrome(n) do
            true -> false
            false -> sum_palindrome(next_term(n), count+1)
        end
    end

    defp is_palindrome(n) do
        Integer.to_string(n) == String.reverse(Integer.to_string(n))
    end

    defp next_term(n) do
        n + elem(Integer.parse(String.reverse(Integer.to_string(n))), 0)
    end

end

Enum.filter(1..10000, fn x -> Lychrel.is_lychrel(x) end)
|> Enum.count
|> IO.inspect
