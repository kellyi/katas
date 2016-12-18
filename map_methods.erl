% exercise 2 from Programming Erlang Ch 5
-module(map_methods).
-export([search_predicate/2]).

search_predicate(M, Predicate) -> search(maps:to_list(M), Predicate).
search([], _) -> {};
search([{K, V}|T], Predicate) ->
    case V =:= Predicate of
        true -> {K, V};
        false -> search(T, Predicate)
    end.
