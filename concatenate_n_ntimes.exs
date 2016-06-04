#!/usr/bin/env elixir
# https://programmingpraxis.com/2016/05/10/concatenate-n-n-times/

defmodule Concatenate do
    def concatenate(n) do
        String.duplicate(Integer.to_string(n), n)
    end
end

IO.inspect Concatenate.concatenate(12)
