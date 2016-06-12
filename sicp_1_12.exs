#!/usr/bin/env elixir

defmodule Pascal do
    def element(row, col) do
        get_pascal_element(row, col)
    end
    
    defp get_pascal_element(_, 0) do
        1
    end
    
    defp get_pascal_element(row, col) when row < col do
        nil
    end
    
    defp get_pascal_element(row, col) when row === col do
        1
    end
    
    defp get_pascal_element(row, col) do
        get_pascal_element(row-1, col-1) + get_pascal_element(row-1, col)
    end
end

Pascal.element(0, 0)
|> IO.inspect

Pascal.element(1, 0)
|> IO.inspect

Pascal.element(4, 2)
|> IO.inspect

Pascal.element(20, 10)
|> IO.inspect
