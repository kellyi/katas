module Solve where
-- https://wiki.haskell.org/99_questions/11_to_20

-- Modified run-length encoding.
-- helper methods from haskell_problems_one.hs
four :: [a] -> Int
four [] = 0
four l = fourhelper l 0

fourhelper :: [a] -> Int -> Int
fourhelper [] c = c
fourhelper (_:t) c = fourhelper t (c + 1)

five :: [a] -> [a]
five [] = []
five [a] = [a]
five l = fivehelper l []

fivehelper :: [a] -> [a] -> [a]
fivehelper [] rev = rev
fivehelper (h:t) rev = fivehelper t (concat [[h], rev])

nine :: Eq a => [a] -> [[a]]
nine [] = []
nine [a] = [[a]]
nine l = ninehelper l []

ninehelper :: Eq a => [a] -> [[a]] -> [[a]]
ninehelper [] l = five l
ninehelper (h:t) [] = ninehelper t [[h]]
ninehelper (h:t) (oh:ot)
    | h == last oh = ninehelper t ((h:oh):ot)
    | otherwise = ninehelper t ([h]:oh:ot)

ten :: Eq a => [a] -> [(Int, a)]
ten [] = []
ten l = map (\(h:t) -> (four (h:t), h)) (nine l)

data Element a = Multiple Int a | Single a
    deriving (Eq, Ord, Show)
eleven :: Eq a => [a] -> [Element a]
eleven [] = []
eleven l = map elevenhelper (ten l)

elevenhelper :: Eq a => (Int, a) -> Element a
elevenhelper (1, x) = Single x
elevenhelper (n, x) = Multiple n x

-- Decode a run-length encoded list.
twelve :: [Element a] -> [a]
twelve l = concat $ map twelvehelper l

twelvehelper :: Element a -> [a]
twelvehelper (Single a) = [a]
twelvehelper (Multiple n a) = take n $ repeat a

-- Run-length encoding of a list (direct solution).
thirteen :: String -> [Element a]
thirteen = undefined

-- Duplicate the elements of a list.
fourteen :: [n] -> [n]
fourteen l = concat $ map (\x -> [x, x]) l

-- Replicate the elements of a list a given number of times.
fifteen :: [n] -> Int -> [n]
fifteen l times = concat $ map (\x -> take times $ repeat x) l

-- Drop every N'th element from a list.
sixteen :: [n] -> Int -> [n]
sixteen l nth = sixteenhelper l [] (nth - 1) 0

sixteenhelper :: [n] -> [n] -> Int -> Int -> [n]
sixteenhelper [] result _ _ = result
sixteenhelper (h:t) result nth counter
    | nth == counter = sixteenhelper t result nth 0
    | otherwise = sixteenhelper t (concat [result, [h]]) nth (counter + 1)

-- Split a list into two parts; the length of the first part is given.
seventeen :: [a] -> Int -> ([a], [a])
seventeen l len = seventeenhelper l [] len

seventeenhelper :: [a] -> [a] -> Int -> ([a], [a])
seventeenhelper [] h _ = (h, [])
seventeenhelper l _ 0 = ([], l)
seventeenhelper (h:t) res len
    | length res == len = (res, (h:t))
    | otherwise = seventeenhelper t (concat [res, [h]]) len

-- Extract a slice from a list.
eighteen :: [a] -> Int -> Int -> [a]
eighteen l k i = eighteenhelper l [] (k - 1) (i - 1)

eighteenhelper :: [a] -> [a] -> Int -> Int -> [a]
eighteenhelper [] slice _ _ = slice
eighteenhelper _ slice _ 1 = slice
eighteenhelper (h:t) slice k i
    | k > 0 = eighteenhelper t slice (k - 1) i
    | otherwise = eighteenhelper t (concat [slice, [h]]) 0 (i - 1)

-- Rotate a list N places to the left.
nineteen :: [a] -> Int -> [a]
nineteen [] _ = []
nineteen l 0 = l
nineteen (h:t) 1 = concat [t, [h]]
nineteen (h:t) rot = nineteen (concat [t, [h]]) (rot - 1)

-- Remove the K'th element from a list.
twenty :: [a] -> Int -> [a]
twenty [] _ = []
twenty _ 0 = []
twenty (_:t) 1 = t
twenty l kth
    | length l <= kth = []
    | otherwise = twentyhelper l [] (kth - 1)

twentyhelper :: [a] -> [a] -> Int -> [a]
twentyhelper (_:t) res 0 = concat [res, t]
twentyhelper (h:t) res kth = twentyhelper t (concat [res, [h]]) (kth - 1)
