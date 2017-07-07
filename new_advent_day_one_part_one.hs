module Solve where

main :: IO ()
main = do
    contents <- readFile "./advent_day_one_input.txt"
    print $ processlist $ map droppunct $ words contents

droppunct :: [Char] -> [Char]
droppunct str
    | last str == ',' = init str
    | last str == '\n' = init str
    | otherwise = str

getturn :: [Char] -> Char
getturn s = head s

countblocks :: String -> Integer
countblocks s = parsedint
    where parsedint = read $ tail s :: Integer

processlist :: [String] -> Integer
processlist l = solve l 0 0 "north"

solve :: [String] -> Integer -> Integer -> String -> Integer
solve [] x y _ = abs(x) + abs(y)
solve (h:t) x y "north"
    | getturn h == 'L' = solve t (x - countblocks h) y "west"
    | getturn h == 'R' = solve t (x + countblocks h) y "east"
solve (h:t) x y "south"
    | getturn h == 'L' = solve t (x + countblocks h) y "east"
    | getturn h == 'R' = solve t (x - countblocks h) y "west"
solve (h:t) x y "west"
    | getturn h == 'L' = solve t x (y - countblocks h) "south"
    | getturn h == 'R' = solve t x (y + countblocks h) "north"
solve (h:t) x y "east"
    | getturn h == 'L' = solve t x (y + countblocks h) "north"
    | getturn h == 'R' = solve t x (y - countblocks h) "south"
