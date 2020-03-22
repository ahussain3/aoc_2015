import System.IO
import qualified Data.Set as Set

data Point = Point Int Int deriving (Show)

fly :: Point -> String -> Set.Set(Int, Int) -> Int
fly (Point x y) (d:ds) visited
    | d == '^' = fly (Point x (y+1)) ds (Set.insert (x, y) visited)
    | d == 'v' = fly (Point x (y-1)) ds (Set.insert (x, y) visited)
    | d == '<' = fly (Point (x-1) y) ds (Set.insert (x, y) visited)
    | d == '>' = fly (Point (x+1) y) ds (Set.insert (x, y) visited)
    | otherwise = Set.size visited

main = do
    handle <- openFile "day_3.in" ReadMode
    contents <- hGetContents handle
    let res = fly (Point 0 0) contents (Set.fromList [(0,0)])
    print res
    hClose handle
