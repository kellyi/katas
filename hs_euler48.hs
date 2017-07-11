module Solve where

solve :: Integer
solve = sum [x ^ x | x <- [1..1000]]
