-module(median).
-export([find/2]).

median(L) ->
    case length(L) rem 2 == 1 of
        true -> lists:nth((length(L) div 2) + 1, L);
        false -> (lists:nth((length(L) div 2 + 1), L) + lists:nth(length(L) div 2, L)) / 2
    end.

find(L, []) -> median(L);
find([], L) -> median(L);
find([H1|T1], [H2|T2]) ->
    case H1 < H2 of
        true -> find(T1, [H2|T2], [H1]);
        false -> find([H1|T1], T2, [H2])
    end.

find([], [], ResultList) -> median(ResultList);
find([], [H|T], ResultList) -> find([], T, [H|ResultList]);
find([H|T], [], ResultList) -> find(T, [], [H|ResultList]);
find([H1|T1], [H2|T2], ResultList) when H1 < H2 -> find(T1, [H2|T2], [H1|ResultList]);
find(L, [H2|T2], ResultList) -> find(L, [T2], [H2|ResultList]).
