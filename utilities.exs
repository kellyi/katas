#!/usr/bin/env elixir

defmodule Benchmark do

  def measure(func) do
    func
    |> :timer.tc
    |> elem(0)
    |> Kernel./(1_000_000)
  end

end

defmodule Parallel do

  def pmap(collection, func) do
    collection
    |> Enum.map(&Task.async(fn -> func.(&1) end))
    |> Enum.map(&Task.await/1)
  end

  def pfilter(collection, func) do
    collection
    |> Enum.map(&Task.async(fn -> {&1, func.(&1)} end))
    |> Enum.map(&Task.await/1)
    |> Enum.filter(fn x -> elem(x,1) == true end)
    |> Enum.map(fn x -> elem(x,0) end)
  end

end
