-module(erlang_euler14).
-export([solve/0]).

next_collatz_term(N) when N rem 2 == 0 ->
    N div 2;

next_collatz_term(N) ->
    ((3 * N) + 1).

collatz_sequence(1, Count) ->
    Count+1;

collatz_sequence(N, Count) ->
    collatz_sequence(next_collatz_term(N), Count+1).

find_longest_sequence(1000000, N, _) ->
    N;

find_longest_sequence(I, N, Length) ->
    NewLength = collatz_sequence(I, 0),
    case (NewLength > Length) of
        true -> find_longest_sequence(I+1, I, NewLength);
        false -> find_longest_sequence(I+1, N, Length)
    end.

solve() ->
    find_longest_sequence(1,1,1).
