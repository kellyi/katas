-module(erlang_euler4).
-export([solve/0]).

solve() -> io:format("~p\n", [solve(100, 100, (100 * 100))]).

solve(1000, 1000, Largest) -> Largest;
solve(N, 1000, Largest) -> solve(N+1, 100, Largest);
solve(X, Y, Largest) when (X * Y) =< Largest -> solve(X, Y+1, Largest);
solve(X, Y, Largest) ->
    case palindrome(X*Y) == X*Y of
        true -> solve(X, Y+1, X*Y);
        false -> solve(X, Y+1, Largest)
    end.

palindrome(N) -> list_to_integer(lists:reverse(integer_to_list(N))).
