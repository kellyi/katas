module Solve where
-- https://wiki.haskell.org/99_questions/1_to_10

-- Find the last element of a list.
one :: [a] -> Maybe a
one [] = Nothing
one [a] = Just a
one (_:a) = one a

-- Find the last but one element of a list.
two :: [a] -> Maybe a
two [] = Nothing
two (x:_:[]) = Just x
two (_:x) = two x

-- Find the K'th element of a list.
three :: [a] -> Int -> Maybe a
three [] _ = Nothing
three (h:_) 0 = Just h
three (_:t) c = three t (c - 1)

-- Find the number of elements of a list.
four :: [a] -> Int
four [] = 0
four l = fourhelper l 0

fourhelper :: [a] -> Int -> Int
fourhelper [] c = c
fourhelper (_:t) c = fourhelper t (c + 1)

--  Reverse a list.
five :: [a] -> [a]
five [] = []
five [a] = [a]
five l = fivehelper l []

fivehelper :: [a] -> [a] -> [a]
fivehelper [] rev = rev
fivehelper (h:t) rev = fivehelper t (concat [[h], rev])

-- Find out whether a list is a palindrome.
six :: Eq a => [a] -> Bool
six l = l == (five l)

-- Flatten a nested list structure.
data NestedList a = Elem a | List [NestedList a]
seven :: NestedList a -> [a]
seven (List []) = []
seven (Elem a) = [a]
seven (List (h:t)) = concat [seven h, seven (List t)]

-- Eliminate consecutive duplicates of list elements.
eight :: Eq a => [a] -> [a]
eight [] = []
eight [a] = [a]
eight l = eighthelper l []

eighthelper :: Eq a => [a] -> [a] -> [a]
eighthelper [] l = l
eighthelper (h:t) [] = eighthelper t [h]
eighthelper (h:t) output
    | h == last output = eighthelper t output
    | otherwise = eighthelper t (concat [output, [h]])

-- Pack consecutive duplicates of list elements into sublists.
-- If a list contains repeated elements they should be placed in
-- separate sublists.
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

-- Run-length encoding of a list.
ten :: Eq a => [a] -> [(Int, a)]
ten [] = []
ten l = map (\(h:t) -> (four (h:t), h)) (nine l)
