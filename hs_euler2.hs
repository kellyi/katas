module Solve where

solve :: Int
solve = answer
    where (_, _, answer) = checknextterm 1 2 0

checknextterm :: Int -> Int -> Int -> (Int, Int, Int)
checknextterm one two sum
    | two > 4000000 = (two, (one + two), sum)
    | mod two 2 == 0 = checknextterm two (one + two) (sum + two)
    | otherwise = checknextterm two (one + two) sum
