-module(erlang_euler6).
-export([solve/0]).

square(N) ->
    N * N.

solve() ->
    square_sums(1,0) - sum_squares(1,0).

sum_squares(101, Acc) ->
    Acc;

sum_squares(N, Acc) ->
    sum_squares(N+1, Acc+square(N)).

square_sums(101, Acc) ->
    square(Acc);

square_sums(N, Acc) ->
    square_sums(N+1, Acc+N).

