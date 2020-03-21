import System.IO

count_parens :: String -> Int
count_parens "" = 0
count_parens (x:xs) = case x of 
                        '(' -> count_parens xs + 1
                        ')' -> count_parens xs - 1
                        _ -> count_parens xs

main = do
    withFile "day_1.in" ReadMode (\handle -> do
        contents <- hGetContents handle
        let res = count_parens contents
        print res)
