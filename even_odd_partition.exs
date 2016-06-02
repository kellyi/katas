#!/usr/bin/env elixir
# https://programmingpraxis.com/2012/05/04/even-odd-partition/

defmodule EvenOddPartition do
    def split(lst) do
        Enum.partition(lst, fn x -> rem(x,2) == 0 end)
    end
end

EvenOddPartition.split([1,2,3,4,5,6,7,8,9,10])
|> IO.inspect
