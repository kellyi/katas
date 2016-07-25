-module(erlang_euler5).
-export([solve/0]).

divisible_by(N, 21) ->
    N;

divisible_by(N, D) ->
    case (N rem D == 0) of
        true -> divisible_by(N, D+1);
        false -> divisible_by(N+1,1)
    end.

solve() ->
    divisible_by(1,1).
