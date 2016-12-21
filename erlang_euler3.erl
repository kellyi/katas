-module(erlang_euler3).
-export([solve/1]).

sieve(N) -> sieve(lists:seq(2, N), []).

sieve([], Primes) -> Primes;
sieve([H|T], Primes) ->
    sieve(lists:filter(fun(N) -> N/H /= N div H end, T), Primes++[H]).

% adapted from https://rosettacode.org/wiki/Factors_of_an_integer#Erlang
prime_factors(N) -> [I || I <- sieve(trunc(math:sqrt(N))), N rem I == 0].

solve(N) -> lists:last(prime_factors(N)).
