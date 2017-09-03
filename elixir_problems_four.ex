# https://wiki.haskell.org/99_questions/31_to_41

defmodule Solve do
    # Determine whether a given integer number is prime.
    def is_prime(0), do: false
    def is_prime(1), do: false
    def is_prime(2), do: true
    def is_prime(n), do: n == hd(Enum.reverse(sieve(Enum.to_list(2..n), [])))

    defp sieve([h|[]], primes), do: primes ++ [h]

    defp sieve([h|t], primes) do
        sieve(t |> Enum.filter(&(&1 / h != div(&1, h))), primes ++ [h])
    end

    # Determine the greatest common divisor of two positive integer numbers.
    def gcd(x, y) when x == y, do: x
    def gcd(x, y) when x > y, do: gcd(x - y, y)
    def gcd(x, y), do: gcd(x, (y - x))

    # Determine whether two positive integer numbers are coprime.
    def coprime(x, y), do: gcd(x, y) == 1

end
