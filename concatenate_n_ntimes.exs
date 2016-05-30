#!/usr/bin/env elixir
# https://programmingpraxis.com/2016/05/10/concatenate-n-n-times/

defmodule Concatenate do
    def concatenate(n) when n > 0 do
        concat_n_ntimes(n, Integer.to_string(n), n)
    end

    defp concat_n_ntimes(0, string, _) do
        string
    end

    defp concat_n_ntimes(remaining, string, base) do
        concat_n_ntimes(remaining-1, string <> Integer.to_string(base), base)
    end
end

IO.inspect Concatenate.concatenate(12)
