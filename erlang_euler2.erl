-module(erlang_euler2).
-export([sum_fibo/0]).

sum_fibo() ->
    sum_fibo({1,2,0}).
sum_fibo({_, Second, Acc}) when Second>=4000000 ->
    Acc;
sum_fibo({First, Second, Acc}) when Second rem 2 == 0 ->
    sum_fibo({Second, First+Second, Acc+Second});
sum_fibo({First, Second, Acc}) ->
    sum_fibo({Second, First+Second, Acc}).    

