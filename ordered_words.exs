#!/usr/bin/env elixir

defmodule OrderedWords do

    def find(file_name) do
        {_, bin} = File.read(file_name)
        String.split(bin, "\n")
        |> find_ordered_words
    end

    defp find_ordered_words(words) do
        Enum.filter(words, fn w -> w == sorted(w) end)
        |> Enum.sort(&(String.length(&1) > String.length(&2)))
    end

    defp sorted(word) do
        String.split(word, "", trim: true)
        |> Enum.sort
        |> Enum.join
    end

end

OrderedWords.find("unixdict.txt")
|> IO.inspect
