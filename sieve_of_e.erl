-module(sieve_of_e).
-export([sieve/1]).

sieve(N) -> sieve(lists:seq(2, N), []).

sieve([], Primes) -> Primes;
sieve([H|T], Primes) ->
    sieve(lists:filter(fun(N) -> N/H /= N div H end, T), Primes++[H]).
