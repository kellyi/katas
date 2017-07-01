module Solve where

solve :: Int
solve = answer
    where answer = sum $ sieve 2000000

sieve :: Int -> [Int]
sieve n = primes [2..n] []

primes :: [Int] -> [Int] -> [Int]
primes [] list = list
primes (h:t) p = primes newlist newprimes
    where newprimes     = p ++ [h]
          notprime num  = rem num h /= 0
          newlist       = filter notprime t
