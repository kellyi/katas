% https://programmingpraxis.com/2016/11/22/missing-items/
-module(missingitems).
-export([find/2]).

find(L, []) -> L;
find(One, Two) -> find(One, Two, []).

find([], _, Missing) -> Missing;
find([H|T], Two, Missing) ->
    case lists:member(H, Two) of
        true -> find(T, Two, Missing);
        false -> find(T, Two, lists:append(Missing, H))
    end.