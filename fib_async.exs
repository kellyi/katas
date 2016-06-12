#!/usr/bin/env elixir

defmodule FibAsync do
    def nth(0) do
        0
    end
    
    def nth(1) do
        1
    end
    
    def nth(n) do
        FibAsync.nth(n-1) + FibAsync.nth(n-2)
    end

end

IO.puts "Calculating the 20th Fibonacci number:"
worker = Task.async(fn -> FibAsync.nth(20) end)
IO.puts "Squaring some numbers in the meantime..."
1..10
|> Enum.map(fn x -> x * x end)
|> IO.inspect

IO.puts "Wait for the task"
result = Task.await(worker)
IO.puts "the result is #{result}"
