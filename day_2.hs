import System.IO
import Data.List 

split :: String -> Char -> [String]
split [] delim = [""]
split (c:cs) delim
    | c == delim = "" : rest
    | otherwise = (c : head rest) : tail rest
    where
        rest = split cs delim

surfaceArea :: [Int] -> Int
surfaceArea [l, w, h] = 2*l*w + 2*w*h + 2*h*l

excess :: [Int] -> Int
excess d | (a:b:_) <- sort d = a * b
         | otherwise = 0

paperNeeded :: [Int] -> Int
paperNeeded rect = surfaceArea rect + excess rect

main = do
    withFile "day_2.in" ReadMode (\handle -> do
        contents <- hGetContents handle
        let inputs = map (\x -> split x 'x') (lines contents)
        let rects = map (map  (\x -> read x::Int)) inputs
        let res = sum $ map paperNeeded rects
        print res)
