import Data.Char

-- thefunction prompted the user for a line, returned it to him in CAPSLOCK 
--  and then did that all over again, indefinitely
main = do 
    contents <- getContents
    putStr (map toUpper contents)

