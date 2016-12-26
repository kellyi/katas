-module(new_advent_day_1_part_2).
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

sum_distance({X, Y}) -> abs(X) + abs(Y).

check(L, X, Y, Direction, [{VHX, VHY}|VT]) ->
    NewVisited = case Direction of 
        east -> [{NewX, Y} || NewX <- lists:reverse(lists:seq(VHX, X))];
        west -> [{NewX, Y} || NewX <- lists:reverse(lists:seq(X, VHX))];
        north -> [{X, NewY} || NewY <- lists:reverse(lists:seq(VHY, Y))];
        south -> [{X, NewY} || NewY <- lists:reverse(lists:seq(Y, VHY))]
    end,
    Duplicates = lists:filter(fun(E) -> lists:member(E, VT) end, NewVisited),
    case length(Duplicates) > 1 of 
        true -> sum_distance(hd(Duplicates));
        false -> solve(L, X, Y, Direction, NewVisited++VT)
    end.

solve(L) -> solve(L, 0, 0, north, [{0, 0}]).

solve([], _, _, _, _) -> nil;

solve([H|T], X, Y, Direction, Visited) ->
    case {get_turn(H), Direction} of 
        {"L", north} -> check(T, X - count_blocks(H), Y, west, Visited);
        {"R", north} -> check(T, X + count_blocks(H), Y, east, Visited);
        {"L", south} -> check(T, X + count_blocks(H), Y, east, Visited);
        {"R", south} -> check(T, X - count_blocks(H), Y, west, Visited);
        {"L", west} -> check(T, X, Y - count_blocks(H), south, Visited);
        {"R", west} -> check(T, X, Y + count_blocks(H), north, Visited);
        {"L", east} -> check(T, X, Y + count_blocks(H), north, Visited);
        {"R", east} -> check(T, X, Y - count_blocks(H), south, Visited)
    end.
