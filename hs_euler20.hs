module Solve where

solve :: Integer
solve = sum $ todigits [] $ factorial 100

factorial :: Integer -> Integer
factorial x = foldl (*) 1 [1..x]

todigits :: [Integer] -> Integer -> [Integer] 
todigits digits x
    | x < 10    = (x:digits)
    | otherwise = todigits ((mod x 10):digits) (div x 10)
