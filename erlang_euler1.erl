-module(erlang_euler1).
-export([sum35/1]).

sum35(N) -> 
    sum35(N,0).
sum35(1000,Acc) -> 
    Acc;
sum35(N,Acc) when N rem 3 == 0 -> 
    sum35(N+1,Acc+N);
sum35(N,Acc) when N rem 5 == 0 -> 
    sum35(N+1,Acc+N);
sum35(N,Acc) -> 
    sum35(N+1,Acc).

