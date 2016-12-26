-module(new_advent_day_3).
-export([solve/0]).

solve() ->
    solve(parse(file:read_file("new_advent_day_3_input.txt"))).

parse({ok, F}) ->
    string:tokens(binary:bin_to_list(F), "\n").

solve(List) -> solve(List, 0).
solve([], Count) -> Count;
solve([H|T], Count) ->
    case valid_triangle(H) of
        true -> solve(T, Count+1);
        false -> solve(T, Count)
    end.

valid_triangle(Input) ->
    [{X, _}, {Y, _}, {Z, _}] = lists:map(fun(E) -> string:to_integer(E) end,
        string:tokens(string:strip(Input, left, $ ), "  ")),
    ((X + Y > Z) and (X + Z > Y) and (Y + Z > X)).
