#!/usr/bin/env elixir

defmodule TrialDivision do
  
  def prime(1) do
    false
  end
 
  def prime(2) do
    true
  end

  def prime(n) do
    test_prime(n, 2, :math.sqrt(n))
  end

  defp test_prime(_,d,limit) when d >= limit do
    true
  end

  defp test_prime(n,_,_) when rem(n,2) == 0 do
    false
  end

  defp test_prime(n,d,limit) do
    case rem(n,d) == 0 do
      true -> false
      _ -> test_prime(n, d+1, limit)
    end
  end

end

1..100
|> Enum.to_list
|> Enum.filter(&(TrialDivision.prime(&1)))
|> IO.inspect
