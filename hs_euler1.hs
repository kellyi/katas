module Solve where

solve x     = foldl (+) 0 [i | i <- [1..x - 1], i `mod` 3 == 0 || i `mod` 5 == 0]
