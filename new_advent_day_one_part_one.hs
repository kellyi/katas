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

countblocks :: String -> Integer
countblocks s = parsedint
    where parsedint = read s :: Integer

processlist :: [String] -> Integer
processlist l = solve l 0 0 "north"

solve :: [String] -> Integer -> Integer -> String -> Integer
solve [] x y _ = abs(x) + abs(y)
solve(('L':c):t) x y "north" = answer
    where answer = solve t (x - countblocks c) y "west"
solve(('R':c):t) x y "north" = answer
    where answer = solve t (x + countblocks c) y "east"
solve(('L':c):t) x y "south" = answer
    where answer = solve t (x + countblocks c) y "east"
solve(('R':c):t) x y "south" = answer
    where answer = solve t (x - countblocks c) y "west"
solve(('L':c):t) x y "west" = answer
    where answer = solve t x (y - countblocks c) "south"
solve(('R':c):t) x y "west" = answer
    where answer = solve t x (y + countblocks c) "north"
solve(('L':c):t) x y "east" = answer
    where answer = solve t x (y + countblocks c) "north"
solve(('R':c):t) x y "east" = answer
    where answer = solve t x (y - countblocks c) "south"
