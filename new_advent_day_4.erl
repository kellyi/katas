-module(new_advent_day_4).
-export([solve/0]).

parse({ok, F}) -> string:tokens(binary:bin_to_list(F), "\n").

solve() -> solve(parse(file:read_file("new_advent_day_4_input.txt")), 0).

solve([], Accumulator) -> Accumulator;
solve([H|T], Accumulator) -> 
    case valid(H) of 
        true -> solve(T, Accumulator + value(H));
        _ -> solve(T, Accumulator)
    end.

value(S) -> 
    {Number, _} = string:to_integer(string:left(string:right(S, 10), 3)),
    Number.

checksum(S) -> string:left(string:right(S, 6), 5).

name(S) -> 
    re:replace(string:left(S, length(S) - 10), "-", "", [global, {return, list}]).

count_char(List, Char) ->
    F = fun(X, N) when X =:= Char -> N + 1;
           (_, N) -> N
        end,
    lists:foldl(F, 0, List).

valid(S) -> checksum(S) == validate(name(S)).

validate(Name) -> validate(Name, Name, #{}).

validate([], _, ResultMap) -> format_map(ResultMap);
validate([H|T], Name, Map) ->
    case maps:is_key(H, Map) of 
        true -> validate(T, Name, Map);
        _ -> validate(T, Name, maps:merge(Map, #{H => count_char(Name, H)}))
    end.

format_map(M) ->
    L = lists:reverse(lists:sort(lists:map(fun({K, V}) -> {V, K} end, (maps:to_list(M))))),
    F = fun({CountOne, CharOne}, {CountTwo, CharTwo}) when CountOne == CountTwo -> CharOne < CharTwo;
           ({CountOne, _}, {CountTwo, _}) -> CountOne > CountTwo
        end,
    lists:map(fun({_,X}) -> X end, lists:sublist(lists:sort(F, L), 5)).
