module Main where

import System.IO
import Day1 ( countIncreases, countSlidingIncreases )
import Lib

main :: IO ()
main = do
    let puzzle1 = Puzzle 1 PartOne
    let puzzle2 = Puzzle 1 PartTwo
    answer1 <- computeAnswer "inputs/day1/part1/input.txt" parseIntList countIncreases
    answer2 <- computeAnswer "inputs/day1/part2/input.txt" parseIntList countSlidingIncreases
    printAnswer puzzle1 answer1
    printAnswer puzzle2 answer2
