import System.IO

count_parens :: String -> Int
count_parens "" = 0
count_parens (x:xs) = case x of 
                        '(' -> count_parens xs + 1
                        ')' -> count_parens xs - 1
                        _ -> count_parens xs

track_floor :: String -> Int -> Int -> Int
track_floor (x:xs) floor step
    | floor == (-1) = step
    | x == '(' = track_floor xs (floor + 1) (step + 1)
    | x == ')' = track_floor xs (floor - 1) (step + 1)
    | otherwise = track_floor xs floor (step + 1)

main = do
    withFile "day_1.in" ReadMode (\handle -> do
        contents <- hGetContents handle
        let res = track_floor contents 0 0
        print res)
