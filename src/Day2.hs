module Day2
    (
        part1,
        part2
    ) where

import Debug.Trace

data Direction = Forward | Up | Down
data Instruction = Instruction { direction :: Direction, distance :: Int}
data Coordinate = Coordinate { depth :: Int, horizontal :: Int}
data Ship = Ship { coordinate :: Coordinate, aim :: Int }

move :: Coordinate -> Instruction -> Coordinate
move coord instr = case direction instr of 
    Forward -> Coordinate (depth coord) (horizontal coord + distance instr)
    Up -> Coordinate (depth coord - distance instr) (horizontal coord)
    Down -> Coordinate (depth coord + distance instr) (horizontal coord)

moveShip :: Ship -> Instruction -> Ship
moveShip ship (Instruction Forward dist) = Ship (Coordinate (shipDepth ship + (aim ship * dist)) (shipHorizontal ship + dist)) (aim ship)
moveShip ship (Instruction Up dist) = Ship (coordinate ship) (aim ship - dist)
moveShip ship (Instruction Down dist) = Ship (coordinate ship) (aim ship + dist)
    
shipDepth :: Ship -> Int
shipDepth = depth . coordinate

shipHorizontal :: Ship -> Int
shipHorizontal = horizontal . coordinate

f1 :: String -> (String, String)
f1 str = (head wrds, last wrds)
    where wrds = words str

f2 :: (String, String) -> (String, Int)
f2 (dir, dist) = (dir, read dist :: Int)

f3 :: (String, Int) -> Instruction
f3 ("forward", dist) = Instruction Forward dist
f3 ("up", dist) = Instruction Up dist
f3 ("down", dist) = Instruction Down dist

getInstruction :: String -> Instruction
getInstruction = f3 . f2 . f1

part1 :: [String] -> Int
part1 strings = let instrs = map getInstruction strings
                    finalCoord = foldl move (Coordinate 0 0) instrs
                    in depth finalCoord * horizontal finalCoord

part2 :: [String] -> Int
part2 strings = let instrs = map getInstruction strings
                    finalCoord = foldl moveShip (Ship (Coordinate 0 0) 0) instrs
                    in shipDepth finalCoord * shipHorizontal finalCoord