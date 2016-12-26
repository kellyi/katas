-module(new_advent_day_1).
-export([solve/0]).

solve() -> 
    solve(parse(file:read_file("new_advent_day_1_input.txt"))).

parse({ok, F}) ->
    string:tokens(string:strip(
        binary:bin_to_list(F), both, $\n), ", ").

count_blocks(S) ->
    {Blocks, _} = string:to_integer(string:sub_string(S, 2)),
    Blocks.

get_turn(S) -> string:sub_string(S, 1, 1).

solve(L) -> solve(L, 0, 0, north).

solve([], X, Y, _) -> abs(X) + abs(Y);

solve([H|T], X, Y, Direction) ->
    case {get_turn(H), Direction} of 
        {"L", north} -> solve(T, X - count_blocks(H), Y, west);
        {"R", north} -> solve(T, X + count_blocks(H), Y, east);
        {"L", south} -> solve(T, X + count_blocks(H), Y, east);
        {"R", south} -> solve(T, X - count_blocks(H), Y, west);
        {"L", west} -> solve(T, X, Y - count_blocks(H), south);
        {"R", west} -> solve(T, X, Y + count_blocks(H), north);
        {"L", east} -> solve(T, X, Y + count_blocks(H), north);
        {"R", east} -> solve(T, X, Y - count_blocks(H), south)
    end.
