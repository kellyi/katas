-module(new_advent_day_2).
-export([solve/0]).

solve() ->
    solve(parse(file:read_file("new_advent_day_2_input.txt"))).

parse({ok, F}) ->
    string:tokens(binary:bin_to_list(F), "\n").

solve(L) -> solve(hd(L), tl(L), 5, []).

solve([], [], Current, Code) -> 
    io:format("~w~n", [Code++[Current]]);
solve([], [H|T], Current, Code) ->
    solve(H, T, Current, Code++[Current]);
solve([H|T], L, Current, Code) ->
    case H of
        76 -> solve(T, L, next_number("L", Current), Code);
        82 -> solve(T, L, next_number("R", Current), Code);
        85 -> solve(T, L, next_number("U", Current), Code);
        68 -> solve(T, L, next_number("D", Current), Code)
    end.

next_number(Direction, CurrentNumber) ->
    case {Direction, CurrentNumber} of
        {"L", 1} -> 1;
        {"L", 2} -> 1;
        {"L", 3} -> 2;
        {"L", 4} -> 4;
        {"L", 5} -> 4;
        {"L", 6} -> 5;
        {"L", 7} -> 7;
        {"L", 8} -> 7;
        {"L", 9} -> 8;
        {"R", 1} -> 2;
        {"R", 2} -> 3;
        {"R", 3} -> 3;
        {"R", 4} -> 5;
        {"R", 5} -> 6;
        {"R", 6} -> 6;
        {"R", 7} -> 8;
        {"R", 8} -> 9;
        {"R", 9} -> 9;
        {"U", 1} -> 1;
        {"U", 2} -> 2;
        {"U", 3} -> 3;
        {"U", 4} -> 1;
        {"U", 5} -> 2;
        {"U", 6} -> 3;
        {"U", 7} -> 4;
        {"U", 8} -> 5;
        {"U", 9} -> 6;
        {"D", 1} -> 4;
        {"D", 2} -> 5;
        {"D", 3} -> 6;
        {"D", 4} -> 7;
        {"D", 5} -> 8;
        {"D", 6} -> 9;
        {"D", 7} -> 7;
        {"D", 8} -> 8;
        {"D", 9} -> 9
    end.
