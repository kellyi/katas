module Solve where
-- https://wiki.haskell.org/99_questions/21_to_28
import Data.List()
import System.Random
import Data.Array.IO
import Control.Monad

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

-- Extract a given number of randomly selected elements from a list.
twentythree :: Int -> [a] -> IO [a]
twentythree count xs = do
        ar <- newlist n xs
        forM [1..count] $ \i -> do
            j <- randomRIO (i,n)
            vi <- readArray ar i
            vj <- readArray ar j
            writeArray ar j vi
            return vj
  where n = length xs
        newlist :: Int -> [a] -> IO (IOArray Int a)
        newlist c l =  newListArray (1, c) l

-- Lotto: Draw N different random numbers from the set 1..M.
twentyfour :: IO [Integer]
twentyfour = twentythree 6 [1..50]

-- Generate a random permutation of the elements of a list.
twentyfive :: [a] -> IO [a]
twentyfive l = twentythree (length l) l
