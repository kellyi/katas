#!/usr/bin/env elixir

defmodule Prime do

    def is_prime(n) do
        check_is_prime(n,2)
    end

    defp check_is_prime(1, _) do
        false
    end

    defp check_is_prime(2, _) do
        true
    end

    defp check_is_prime(n,d) when n == d do
        true
    end

    defp check_is_prime(n,d) when n/d == div(n,d) do
        false
    end

    defp check_is_prime(n,d) do
        check_is_prime(n,d+1)
    end

end

1..1000
|> Enum.filter(fn x -> Prime.is_prime(x) end)
|> IO.inspect
