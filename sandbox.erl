-module(sandbox).
-compile(export_all).

count(Str, Char) ->
    count(Str, Char, 0).

count([], _, Counter) -> Counter;
count([H|T], Char, Counter) ->
    case Char == H of 
        true -> count(T, Char, Counter+1);
        false -> count(T, Char, Counter)
    end.

frequencies(Str) ->
    Binary = re:split(Str, ""),
    frequencies(Binary, Binary, []).

frequencies([], _, [_|List]) -> 
    lists:sublist(lists:reverse(lists:sort(List)), 1, 3);
frequencies([H|T], Str, List) ->
    Element = {count(Str, H), H},
    case lists:member(Element, List) of 
        true -> frequencies(T, Str, List);
        false -> frequencies(T, Str, [Element|List])
    end.
