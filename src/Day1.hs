module Day1
    ( countIncreases,
      countSlidingIncreases
    ) where

countIncreases :: [Int] -> Int
countIncreases = f 1

countSlidingIncreases :: [Int] -> Int
countSlidingIncreases = f 3

f :: Int -> [Int] -> Int 
f winSize xs
    | length xs < winSize = 0
    | otherwise = if sum1 < sum2 then 1 + f winSize (tail xs) else f winSize (tail xs)
        where sum1 = sum $ take winSize xs
              sum2 = sum $ take winSize $ drop 1 xs