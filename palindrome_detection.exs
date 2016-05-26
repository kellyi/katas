#!/usr/bin/env elixir

defmodule DetectPalindrome do
    def is_palindrome(str) do
        Enum.with_index(Enum.to_list(Enum.reverse(String.split(str, " ")))) ==
        Enum.with_index(Enum.to_list(String.split(str, " ")))
    end
end

test_string = "ingirumimusnocteetconsumimurigni"
IO.puts DetectPalindrome.is_palindrome(test_string)
