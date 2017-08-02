module Solve where
-- https://wiki.haskell.org/99_questions/21_to_28

-- Insert an element at a given position into a list.
twentyone :: [a] -> a -> Integer -> [a]
twentyone l el pos = twentyonehelper l el pos []

twentyonehelper :: [a] -> a -> Integer -> [a] -> [a]
twentyonehelper l el 0 prior = concat [prior, [el], l]
twentyonehelper (h:t) el pos prior =
    twentyonehelper t el (pos - 1) (concat [prior, [h]])

-- Create a list containing all integers within a given range.
twentytwo :: Integer -> Integer -> [Integer]
twentytwo a b = twentytwohelper a b []

twentytwohelper :: Integer -> Integer -> [Integer] -> [Integer]
twentytwohelper a b l
    | a == b = concat [l, [b]]
    | otherwise = twentytwohelper (a + 1) b (concat [l, [a]])
