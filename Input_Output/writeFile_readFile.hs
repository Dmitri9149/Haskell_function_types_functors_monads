import System.IO
import Data.Char
main = do 
    contents <- readFile "friend.txt"
    putStr contents
    contents <- readFile "friend.txt"
    writeFile "fiendcaps.txt" (map toUpper contents)

