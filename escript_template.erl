#!/usr/bin/env escript

main([Arg]) -> io:format("arg: ~s\n", [Arg]);
main(_) -> usage().

usage() ->
    io:format("usage: ...\n"),
    halt(1).
