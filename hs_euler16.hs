module Solve where

solve :: Integer
solve = splitsum (2 ^ 1000) 0

splitsum :: Integer -> Integer -> Integer
splitsum n acc
    | n < 10 = n + acc
    | otherwise = splitsum (div n 10) (acc + (mod n 10))
