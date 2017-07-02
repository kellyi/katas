module Solve where

solve :: [Int]
solve = scanl (+) 0 $ filter amicable [1..9999]

amicable :: Int -> Bool
amicable x
    | x == sumDiv x = False
    | otherwise     = x == sumDiv(sumDiv x) 

sumDiv :: Int -> Int
sumDiv 0 = 0
sumDiv 1 = 0
sumDiv n = result
    where result    = sum $ filter evenDiv [1..div n 2]
          evenDiv d = rem n d == 0
