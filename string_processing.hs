module StringProcessing where
import Data.Char

replaceThe :: String -> String
replaceThe = unwords . map notThe . words

notThe :: String -> String
notThe "The" = "A"
notThe "the" = "a"
notThe s = s

countBeforeTheVowel :: String -> Int
countBeforeTheVowel = checkWords 0 . words

checkWords :: Int -> [String] -> Int
checkWords acc [] = acc
checkWords acc ("the":xs)
    | isVowel $ head $ head xs = checkWords (acc + 1) xs
    | otherwise = checkWords acc xs
checkWords acc ("The":xs)
    | isVowel $ head $ head xs = checkWords (acc + 1) xs
    | otherwise = checkWords acc xs
checkWords acc (_:xs) = checkWords acc xs

countVowels :: [Char] -> Int
countVowels = length . filter isVowel

isVowel :: Char -> Bool
isVowel = flip elem "aeiou" . toLower
