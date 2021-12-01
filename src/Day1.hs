module Day1
    ( countIncreases,
      countSlidingIncreases
    ) where

countIncreases :: [Int] -> Int
countIncreases (a:b:xs) = if a < b then 1 + countIncreases ( b:xs ) else countIncreases ( b:xs )
countIncreases xs = 0

countSlidingIncreases :: [Int] -> Int
countSlidingIncreases (a1:a2:a3:a4:xs) = if  sum1 < sum2
    then 1 + countSlidingIncreases ( a2:a3:a4:xs )
    else countSlidingIncreases ( a2:a3:a4:xs )
    where sum1 = a1+a2+a3
          sum2 = a2+a3+a4
countSlidingIncreases xs = 0
