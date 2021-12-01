module Main where

import System.IO
import Day1 ( countIncreases, countSlidingIncreases )

data Part = PartOne | PartTwo

main :: IO ()
main = do
    input1 <- readIntegerInputs "inputs/day1/part1/input.txt"
    input2 <- readIntegerInputs "inputs/day1/part2/input.txt"
    let result1 = countIncreases input1
    let result2 = countSlidingIncreases input2
    printAnswer 1 PartOne result1
    printAnswer 1 PartTwo result2

printAnswer :: Show a => Int -> Part -> a -> IO ()
printAnswer day PartOne answer = do
    putStrLn ("The answer for day " ++ show day ++ " part one is: " ++ show answer)
printAnswer day PartTwo answer = do
    putStrLn ("The answer for day " ++ show day ++ " part two is: " ++ show answer)

readIntegerInputs :: String -> IO [Int]
readIntegerInputs filename = do
    handle <- openFile filename ReadMode
    raw <- hGetContents handle
    let rawLines = lines raw
    let input = map read rawLines
    return input
