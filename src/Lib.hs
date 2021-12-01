module Lib
    (
        Part (PartOne, PartTwo),
        Puzzle (Puzzle),
        computeAnswer,
        printAnswer,
        parseIntList
    ) where
import System.IO


data Part = PartOne | PartTwo
    deriving Show

data Puzzle = Puzzle { day :: Int, part :: Part }
    deriving Show

computeAnswer :: Show b => String -> (String -> IO a) -> (a -> b) -> IO b
computeAnswer filepath parse func = do
    content <- readFileContent filepath
    input <- parse content
    return $ func input

printAnswer :: Show a => Puzzle -> a -> IO ()
printAnswer puzzle answer = do
    putStrLn $ show puzzle ++ ": "++ show answer

readFileContent :: String -> IO String
readFileContent filepath = do
    file <- openFile filepath ReadMode
    hGetContents file

parseIntList :: String -> IO [Int]
parseIntList content = do
    let ls = lines content
    let intList = map read ls :: [Int]
    return intList




