-module(erlang_euler20).
-export([solve/0]).

factorial(N) ->
    factorial(N,1).

factorial(1,Acc) ->
    Acc;

factorial(N,Acc) ->
    factorial(N-1,Acc*N).

split_sum(N) ->
    split_sum(N,0).

split_sum(N,Acc) when N<10 ->
    Acc+N;

split_sum(N,Acc) ->
    split_sum(N div 10, Acc+(N rem 10)).

solve() ->
    split_sum(factorial(100)).
