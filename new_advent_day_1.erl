-module(new_advent_day_1).
-export([solve/0]).

solve() -> 
    solve(parse(file:read_file("new_advent_day_1_input.txt"))).

parse({ok, F}) ->
    string:tokens(string:strip(
        binary:bin_to_list(F), both, $\n), ", ").

solve(L) -> solve(L, 0, 0, north).

solve([], X, Y, _) -> abs(X) + abs(Y);

solve([H|T], X, Y, north) ->
    {Blocks, _} = string:to_integer(string:sub_string(H, 2)),
    case string:sub_string(H, 1, 1) of
        "L" -> solve(T, X - Blocks, Y, west);
        "R" -> solve(T, X + Blocks, Y, east)
    end;

solve([H|T], X, Y, south) ->
    {Blocks, _} = string:to_integer(string:sub_string(H, 2)),
    case string:sub_string(H, 1, 1) of
        "L" -> solve(T, X + Blocks, Y, east);
        "R" -> solve(T, X - Blocks, Y, west)
    end;

solve([H|T], X, Y, west) ->
    {Blocks, _} = string:to_integer(string:sub_string(H, 2)),
    case string:sub_string(H, 1, 1) of
        "L" -> solve(T, X, Y - Blocks, south);
        "R" -> solve(T, X, Y + Blocks, north)
    end;
        
solve([H|T], X, Y, east) ->
    {Blocks, _} = string:to_integer(string:sub_string(H, 2)),
    case string:sub_string(H, 1, 1) of
        "L" -> solve(T, X, Y + Blocks, north);
        "R" -> solve(T, X, Y - Blocks, south)
    end.
