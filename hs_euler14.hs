module Solve where

solve :: Int
solve = maxcollatz $ map collatzify [1..999999]

maxcollatz :: [(Int, Int)] -> Int
maxcollatz list = findmax (tail list) (getvalue $ head list) (getcount $ head list)

findmax :: [(Int, Int)] -> Int -> Int -> Int
findmax [] currentmax _ = currentmax
findmax list currentmax currentcount
    | currentcount < (getcount $ head list) =
        findmax (tail list) (getvalue $ head list) (getcount $ head list)
    | otherwise = findmax (tail list) currentmax currentcount

getcount :: (Int, Int) -> Int
getcount n = count
    where (_, count) = n

getvalue :: (Int, Int) -> Int
getvalue n = value
    where (value, _) = n

collatzify :: Int -> (Int, Int)
collatzify n = (n, answer)
    where (_, _, answer) = countcollatzterms n (nextcollatzterm n) 1

countcollatzterms :: Int -> Int -> Int -> (Int, Int, Int)
countcollatzterms start term count
    | term == 1 = (start, term, count + 1)
    | otherwise = countcollatzterms start (nextcollatzterm term) (count + 1)

nextcollatzterm :: Int -> Int
nextcollatzterm n
    | mod n 2 == 0 = div n 2
    | otherwise = (3 * n) + 1
