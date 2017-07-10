module Solve where

solve :: Int
solve = findmaxpalindrome 1000

findmaxpalindrome :: Int -> Int
findmaxpalindrome x = answer
    where answer = maximum $ filter ispalindrome [a * b | a <- [1..x], b <- [1..x]]

ispalindrome :: Int -> Bool
ispalindrome x = x == reversenum x

joinlist :: [Int] -> Int
joinlist l = fusenumlist l 1 0

fusenumlist :: [Int] -> Int -> Int -> Int
fusenumlist l magnitude acc
    | length l == 1     = (last l * magnitude) + acc
    | otherwise         = fusenumlist newlist newmag newacc
        where newacc    = (last l * magnitude) + acc
              newmag    = magnitude * 10
              newlist   = init l

reversenum :: Int -> Int
reversenum x = revnum x []

revnum :: Int -> [Int] -> Int
revnum x l
    | x < 10            = joinlist $ reverse (x:l)
    | otherwise         = revnum (div x 10) ((mod x 10):l)
