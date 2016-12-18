% ch 4, ex 3, programming erlang
-module(module_time).
-export([time_func/1, my_date_string/0]).

time_func(F) -> time_func(F, erlang:timestamp()).
time_func(F, Start) ->
    F, io:format("start: ~p\nfinish: ~p\n", [Start, erlang:timestamp()]).

my_date_string() ->
    {Y, Month, D} = erlang:date(),
    {H, Minute, _} = erlang:time(),
    case H > 12 of
        true -> my_date_string({H-12, Minute, Month, D, Y});
        false -> my_date_string({H, Minute, Month, D, Y})
    end.

my_date_string({Hour, Minute, Month, Day, Year}) ->
    io:format("It's ~p:~p on ~p/~p/~p\n", [Hour, Minute, Month, Day, Year]).
