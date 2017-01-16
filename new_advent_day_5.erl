-module(new_advent_day_5).
-export([solve/0]).

solve() -> solve("ffykfhsq", [], 0).

solve(_, Result, _) when length(Result) == 8 -> io:format(Result);
solve(Input, Result, Iteration) ->
    Hash = md5_hex(Input ++ integer_to_list(Iteration)),
    case five_zero_prefix(Hash) of 
        true -> solve(Input, Result ++ [sixth_char(Hash)], Iteration + 1);
        _ -> solve(Input, Result, Iteration + 1)
    end.

five_zero_prefix(Hash) -> lists:sublist(Hash, 5) == "00000".

sixth_char(Hash) -> lists:nth(6, Hash).

% md5/hex stuff from http://sacharya.com/md5-in-erlang/
md5_hex(S) ->
       Md5_bin =  erlang:md5(S),
       Md5_list = binary_to_list(Md5_bin),
       lists:flatten(list_to_hex(Md5_list)).

hex(N) when N < 10 -> $0 + N;
hex(N) when N >= 10, N < 16 -> $a + (N - 10).

list_to_hex(L) -> lists:map(fun(X) -> int_to_hex(X) end, L).
 
int_to_hex(N) when N < 256 -> [hex(N div 16), hex(N rem 16)].
