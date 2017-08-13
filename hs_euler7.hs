module Solve where
import Data.Numbers.Primes

solve :: Int
solve = last $ take 10001 primes
