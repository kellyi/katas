#!/usr/bin/env elixir

defmodule SieveOfE do

    def sieve_up_to(n) do
        sieve(Enum.to_list(2..n), [])
    end

    defp sieve([h|t], prior_primes) do
        new_lst = Enum.concat(prior_primes, [h])
        case Enum.count(t) > 0 do
            true -> sieve(Enum.filter(t, fn n -> n/h != div(n,h) end), new_lst)
            _ -> new_lst
        end
    end

end

SieveOfE.sieve_up_to(100)
|> IO.inspect
