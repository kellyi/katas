module Solve where
-- https://wiki.haskell.org/99_questions/31_to_41

-- Determine whether a given integer number is prime.
thirtyone :: Int -> Bool
thirtyone n
    | n == 0 = False
    | n == 1 = False
    | otherwise = sieve n

sieve :: Int -> Bool
sieve n = elem n $ primes [2..n] []

primes :: [Int] -> [Int] -> [Int]
primes [] list = list
primes (h:t) p = primes newlist newprimes
    where newprimes     = p ++ [h]
          notprime num  = rem num h /= 0
          newlist       = filter notprime t

-- Determine the greatest common divisor of two positive integer numbers.
thirtytwo :: Int -> Int -> Int
thirtytwo a b
    | a == b = a
    | a > b = thirtytwo (a - b) b
    | otherwise = thirtytwo a (b - a)
