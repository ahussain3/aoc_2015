import System.IO
import qualified Data.Set as Set

data Point = Point Int Int deriving (Show)

fly :: Point -> String -> Set.Set(Int, Int) -> Set.Set(Int, Int)
fly (Point x y) (d:ds) visited
    | d == '^' = fly (Point x (y+1)) ds (Set.insert (x, y) visited)
    | d == 'v' = fly (Point x (y-1)) ds (Set.insert (x, y) visited)
    | d == '<' = fly (Point (x-1) y) ds (Set.insert (x, y) visited)
    | d == '>' = fly (Point (x+1) y) ds (Set.insert (x, y) visited)
    | otherwise = visited
fly _ [] visited = visited

first(x:y:xs) = x : first xs
first _ = []

second(x:y:xs) = y : second xs
second _ = []

main = do
    handle <- openFile "day_3.in" ReadMode
    contents <- hGetContents handle
    let santa_path = first contents
    let robo_path = second contents

    let santa_visits = fly (Point 0 0) santa_path (Set.fromList [(0,0)])
    let robo_visits = fly (Point 0 0) robo_path (Set.fromList [(0,0)])

    let res = Set.size $ Set.union santa_visits robo_visits

    print res
    hClose handle
