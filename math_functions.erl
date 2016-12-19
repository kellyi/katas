% ch 4, ex 5, 6, and 7 from programming erlang
-module(math_functions).
-export([even/1, odd/1, filter/2, split/1, filter_split/1, prime/1]).

even(N) when N rem 2 == 0 -> true;
even(_) -> false.

odd(N) when N rem 2 == 1 -> true;
odd(_) -> false.

filter(F, L) -> filter(F, L, []).
filter(_, [], Result) -> lists:reverse(Result);
filter(F, [H|T], Result) ->
    case F(H) of
        true -> filter(F, T, [H|Result]);
        false -> filter(F, T, Result)
    end.

split(L) -> split(L, [], []).
split([], Even, Odd) -> {lists:reverse(Even), lists:reverse(Odd)};
split([H|T], Even, Odd) ->
    case even(H) of
        true -> split(T, [H|Even], Odd);
        false -> split(T, Even, [H|Odd])
    end.

filter_split(L) -> 
    {filter(fun math_functions:even/1, L), filter(fun math_functions:odd/1, L)}.

prime(2) -> true;
prime(N) when N < 2 -> false;
prime(N) when N rem 2 == 0 -> false;
prime(N) -> prime(N, 3).
prime(N, D) when D*D > N -> true;
prime(N, D) when N rem D == 0 -> false;
prime(N, D) -> prime(N, D+2).
