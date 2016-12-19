-module(erlang_euler10).
-export([solve/0]).

prime(2) -> true;
prime(N) when N < 2 -> false;
prime(N) when N rem 2 == 0 -> false;
prime(N) -> prime(N, 3).
prime(N, D) when D*D > N -> true;
prime(N, D) when N rem D == 0 -> false;
prime(N, D) -> prime(N, D+2).

solve() -> solve(1, 0).
solve(Counter, Accumulator) when Counter == 2000000 -> Accumulator;
solve(Counter, Accumulator) ->
    case prime(Counter) of
        true -> solve(Counter+1, Accumulator+Counter);
        false -> solve(Counter+1, Accumulator)
    end.
