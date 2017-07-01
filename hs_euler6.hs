module Solve where

solve :: Int -> Int
solve n = answer
    where answer = squaresum n - sumsquares n

square :: Int -> Int
square x = x * x

squaresum :: Int -> Int
squaresum n = square $ sum [1..n]

sumsquares :: Int -> Int
sumsquares n = sum $ map square [1..n]
