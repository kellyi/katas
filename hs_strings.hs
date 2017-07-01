module HsStrings where

exclaim x = reverse ('!' : reverse x)

fourth x = x !! 4

y x = "y"

lasteight x = reverse (take 8 (reverse x))

thirdLetter :: String -> Char
thirdLetter x = head $ tail $ tail x

letterIndex :: Int -> Char
letterIndex n = "Hello" !! n

rvrs :: [Char] -> [Char]
rvrs x = (drop 9 x) ++ " " ++ (take 2 (drop 6 x)) ++ " " ++ (take 5 x) ++ "."
