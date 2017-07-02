module Quicksort where

quicksort :: [Int] -> [Int]
quicksort [] = []
quicksort (pivot:tl) = res
    where lss   = quicksort [x | x <- tl, x <= pivot]
          grtr  = quicksort [x | x <- tl, x > pivot]
          res   = concat [lss, [pivot], grtr]
