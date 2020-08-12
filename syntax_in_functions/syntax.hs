factorial n = product [1..n]

addVectors :: (Num a) => (a, a) -> (a, a) -> (a, a)
addVectors (x1, y1) (x2, y2) = (x1 + x2, y1 + y2) 

first :: (a, b, c) -> a  
first (x, _, _) = x  
    
second :: (a, b, c) -> b  
second (_, y, _) = y  
    
third :: (a, b, c) -> c  
third (_, _, z) = z  

length' :: (Num b) => [a] -> b  
length' [] = 0  
length' (_:xs) = 1 + length' xs 

sum' :: (Num a) => [a] -> a  
sum' [] = 0  
sum' (x:xs) = x + sum' xs 

capital :: String -> String  
capital "" = "Empty string, whoops!"  
capital all@(x:xs) = "The first letter of " ++ all ++ " is " ++ [x]  

initials :: String -> String -> String  
initials firstname lastname = [f] ++ ". " ++ [l] ++ "."  
    where (f:_) = firstname  
          (l:_) = lastname

head' :: [a] -> a  
head' [] = error "No head for empty lists!"  
head' (x:_) = x 

head1 :: [a] -> a  
head1 xs = case xs of [] -> error "No head for empty lists!"  
                      (x:_) -> x  

describeList :: [a] -> String  
describeList xs = "The list is " ++ what xs  
    where what [] = "empty."  
          what [x] = "a singleton list."  
          what xs = "a longer list." 

describe1List :: [a] -> String  
describe1List xs = "The list is " ++ case xs of [] -> "empty."  
                                               [x] -> "a singleton list."   
                                               xs -> "a longer list." 