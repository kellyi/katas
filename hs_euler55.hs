module Solve where

solve :: Int
solve = length $ filter (\x -> islychrel x 0) [1..10000]

islychrel :: Integer -> Integer -> Bool
islychrel n 50 = True
islychrel n 0 = islychrel (sumreverse n) (1)
islychrel n iter
    | ispalindrome n    = False
    | otherwise         = islychrel (sumreverse n) (iter + 1)

sumreverse :: Integer -> Integer
sumreverse x = x + reversenum x

ispalindrome :: Integer -> Bool
ispalindrome x = x == reversenum x

joinlist :: [Integer] -> Integer
joinlist l = fusenumlist l 1 0

fusenumlist :: [Integer] -> Integer -> Integer -> Integer
fusenumlist l magnitude acc
    | length l == 1     = (last l * magnitude) + acc
    | otherwise         = fusenumlist newlist newmag newacc
        where newacc    = (last l * magnitude) + acc
              newmag    = magnitude * 10
              newlist   = init l

reversenum :: Integer -> Integer
reversenum x = revnum x []

revnum :: Integer -> [Integer] -> Integer
revnum x l
    | x < 10            = joinlist $ reverse (x:l)
    | otherwise         = revnum (div x 10) ((mod x 10):l)