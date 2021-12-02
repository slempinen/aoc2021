module Main where

import System.IO
import Day1 ( countIncreases, countSlidingIncreases )
import Day2 ( part1, part2 )
import Lib
    ( computeAnswer,
      parseIntList,
      parseStringList,
      printAnswer,
      Part(PartTwo, PartOne),
      Puzzle(Puzzle) )

main :: IO ()
main = do
    let puzzle1 = Puzzle 1 PartOne
    let puzzle2 = Puzzle 1 PartTwo
    let puzzle3 = Puzzle 2 PartOne 
    let puzzle4 = Puzzle 2 PartTwo 
    answer1 <- computeAnswer "inputs/day1/part1/input.txt" parseIntList countIncreases
    answer2 <- computeAnswer "inputs/day1/part2/input.txt" parseIntList countSlidingIncreases
    answer3 <- computeAnswer "inputs/day2/part1/input.txt" parseStringList part1
    answer4 <- computeAnswer "inputs/day2/part2/input.txt" parseStringList part2
    printAnswer puzzle1 answer1
    printAnswer puzzle2 answer2
    printAnswer puzzle3 answer3
    printAnswer puzzle4 answer4
