-- we can add lines to todo.txt using addLine and run main 
-- to ask what line to delete from todo.txt

import System.IO
import System.Directory
import Data.List


addLine :: IO()

addLine = do
    todoItem <- getLine
    appendFile "todo.txt" (todoItem ++ "\n")


withFileAndBuffer :: IO()

withFileAndBuffer = do 
    withFile "todo.txt" ReadMode (\handle -> do 
        hSetBuffering handle $ BlockBuffering (Just 2048) 
        contents <- hGetContents handle
        putStr contents)

main = do 
    handle <- openFile "todo.txt" ReadMode
    (tempName, tempHandle) <- openTempFile "." "temp"
    contents <- hGetContents handle
    let todoTasks = lines contents
        numberedTasks = zipWith (\ n line -> show n ++ " - " ++ line) [0..] todoTasks
    putStrLn "These are your To - DO items:" 
--  mapM putStrLn numberedTasks
    putStr $ unlines numberedTasks 
    putStrLn "Which one do you want to delete?" 
    numberString  <- getLine 
    let number = read numberString
        newTodoItems = delete (todoTasks !! number) todoTasks
    hPutStr tempHandle $ unlines newTodoItems
    hClose handle
    hClose tempHandle
    removeFile "todo.txt"
    renameFile tempName "todo.txt"










