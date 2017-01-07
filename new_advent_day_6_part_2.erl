-module(new_advent_day_6_part_2).
-export([solve/0]).

parse({ok, F}) -> string:tokens(binary:bin_to_list(F), "\n").
format(L) -> lists:map(fun(X) -> least_common_char(X) end, L).

solve() -> 
    solve(parse(file:read_file("new_advent_day_6_input.txt")),
                [[], [], [], [], [], [], [], []]).

solve([], Results) -> format(Results);
solve([H|T], Results) -> add_terms(H, T, Results).

add_terms(Head, T, [First, Second, Third, Fourth, Fifth, Sixth, Seventh, Eighth]) ->
    solve(T, [[lists:nth(1, Head)|First], 
              [lists:nth(2, Head)|Second],
              [lists:nth(3, Head)|Third],
              [lists:nth(4, Head)|Fourth],
              [lists:nth(5, Head)|Fifth],
              [lists:nth(6, Head)|Sixth],
              [lists:nth(7, Head)|Seventh],
              [lists:nth(8, Head)|Eighth]]).

least_common_char(List) ->
    Char = lists:nth(1, List),
    Count = count_char(List, Char),
    least_common_char(List, List, Char, Count).
least_common_char([], _, Char, _) -> Char;
least_common_char([H|T], List, Char, Count) ->
    NewCount = count_char(List, H),
    case NewCount < Count of 
        true -> least_common_char(T, List, H, NewCount);
        _ -> least_common_char(T, List, Char, Count)
    end.

count_char(List, Char) ->
    F = fun(X, N) when X =:= Char -> N + 1;
           (_, N) -> N
        end,
    lists:foldl(F, 0, List).