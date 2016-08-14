-module(erlang_euler34).
-export([solve/0]).

split(N) ->
    split(N, []).

split(N, Lst) when N<10 ->
    (Lst++[N]);

split(N, Lst) ->
    split(N div 10, Lst++[N rem 10]).

count(N, Acc) when N>=10000000 ->
    Acc;

count(N, Acc) ->
    case check(N) of
        true -> count(N + 1, Acc + N);
        _ -> count(N + 1, Acc)
    end.

factorial(N) ->
    factorial(N, 1).

factorial(N, Acc) ->
    case N of
        0 -> Acc;
        1 -> Acc;
        _ -> factorial(N-1, Acc*N)
    end.

check(N) ->
    N == lists:sum(lists:map(fun(X) -> factorial(X) end, split(N))).

solve() ->
    count(3, 0).
