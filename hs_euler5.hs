module Solve where

solve :: Int
solve = divisibleby 1 1

divisibleby :: Int -> Int -> Int
divisibleby n 21 = n
divisibleby n d
    | rem n d == 0  = divisibleby n (d + 1)
    | otherwise     = divisibleby (n + 1) 1
