module Solve where

solve :: Int
solve = foldl (*) 1 [a, b, c]
    where (a, b, c) = head $ filter checktriplet l
          l = [(x, y, z) | x <- [1..500], y <- [x + 1..500], z <- [y + 1..500]]

checktriplet :: (Int, Int, Int) -> Bool
checktriplet (x, y, z)
    | x + y + z /= 1000 = False
    | x ^ 2 + y ^ 2 /= z ^ 2 = False
    | otherwise = (x < y) && (y < z)
