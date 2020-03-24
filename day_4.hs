import Data.Digest.Pure.MD5 (md5)
import qualified Data.ByteString.Lazy.Char8 as C
import Data.List (find)

format :: Int -> String
format a = "iwrupvqb" ++ (show a)

hash :: Int -> String
hash a = show $ md5 $ C.pack (format a)

main = do
    let res = find (\x -> "000000" == take 6 (hash x)) [1..]
    print res
