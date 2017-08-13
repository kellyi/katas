module Solve where
import Data.Numbers.Primes

solve :: Int -> Int
solve n = last $ primeFactors n
