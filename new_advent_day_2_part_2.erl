-module(new_advent_day_2_part_2).
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
        {"L", 2} -> 2;
        {"L", 3} -> 2;
        {"L", 4} -> 3;
        {"L", 5} -> 5;
        {"L", 6} -> 5;
        {"L", 7} -> 6;
        {"L", 8} -> 7;
        {"L", 9} -> 8;
        {"L", a} -> a;
        {"L", b} -> a;
        {"L", c} -> b;
        {"L", d} -> d;
        {"R", 1} -> 1;
        {"R", 2} -> 3;
        {"R", 3} -> 4;
        {"R", 4} -> 4;
        {"R", 5} -> 6;
        {"R", 6} -> 7;
        {"R", 7} -> 8;
        {"R", 8} -> 9;
        {"R", 9} -> 9;
        {"R", a} -> b;
        {"R", b} -> c;
        {"R", c} -> c;
        {"R", d} -> d;
        {"U", 1} -> 1;
        {"U", 2} -> 2;
        {"U", 3} -> 1;
        {"U", 4} -> 4;
        {"U", 5} -> 5;
        {"U", 6} -> 2;
        {"U", 7} -> 3;
        {"U", 8} -> 4;
        {"U", 9} -> 9;
        {"U", a} -> 6;
        {"U", b} -> 7;
        {"U", c} -> 8;
        {"U", d} -> b;
        {"D", 1} -> 3;
        {"D", 2} -> 6;
        {"D", 3} -> 7;
        {"D", 4} -> 8;
        {"D", 5} -> 5;
        {"D", 6} -> a;
        {"D", 7} -> b;
        {"D", 8} -> c;
        {"D", 9} -> 9;
        {"D", a} -> a;
        {"D", b} -> d;
        {"D", c} -> c;
        {"D", d} -> d
    end.
