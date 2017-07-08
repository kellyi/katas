module FizzBuzz where

import Data.List

main :: IO ()
main = do
    putStrLn $ intercalate "\n" $ map fb [1..100]

fb :: Int -> String
fb x
    | mod x 5 == 0 && mod x 3 == 0 = fizzbuzz
    | mod x 5 == 0 = buzz
    | mod x 3 == 0 = fizz
    | otherwise = show x

fizz :: String
fizz = "fizz"

buzz :: String
buzz = "buzz"

fizzbuzz :: String
fizzbuzz = "fizzbuzz"
