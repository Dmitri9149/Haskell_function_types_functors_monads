import System.Random

-- StdGen is an instance of RandomGen typeclass --

-- mkStdGen has type :   mkStdGen :: Int -> StdGen
--
-- random :: (RandonGen g, Random a) => g -> (a,g) 


threeCoins :: StdGen -> (Bool, Bool, Bool)
threeCoins gen = 
    let (firstCoin, newGen) = random gen
        (secondCoin, newGen') = random newGen
        (thirdCoin, newGen'') = random newGen'
    in  (firstCoin, secondCoin, thirdCoin) 

-- take a generator and return an inf list of random nimbers
randoms' :: (RandomGen g, Random a) => g -> [a] 
randoms' gen = let(value, newGen) = random gen in value:randoms' newGen

-- generate finite stream of rundom numbers

finiteRandoms :: (RandomGen g, Random a, Num n) => n -> g -> ([a], g)
finiteRandoms 0 gen = ([], gen)
finiteRandoms n gen = 
    let (value, newGen) = random gen
        (restOfList, finalGen) = finiteRandoms (n-1) newGen 
    in (value:restOfList, finalGen)

--getStdGen abd newStdGen -> splits current random generator , updates the
-- global rand gen and encapsulates the other as result

--Here's a little program that will make the user guess which number it's thinking of.


main = do
    gen <- getStdGen
    askForNumber gen

askForNumber :: stdGen -> IO()
askForNumber gen = do
    let (randNumber, newGen) = randomR (1,10) gen :: (Int, StdGen) 
    putStr "Which number in the range from 1 to 10 am I thinking of? " 
    numberString <- getLine
    when (not $ null numberString) $ do
        let number = read numberString 
        if randNumber = number 
            then putStrLn "You are correct!"
            else putStrLn $ "Sorry, it was" ++ show randNumber
        askForNumber newGen











 
