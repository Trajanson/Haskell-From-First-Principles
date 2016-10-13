module Examples where
import Data.Bool

safeTail        :: [a] -> Maybe [a]
safeTail []     = Nothing
safeTail (x:[]) = Nothing
safeTail (_:xs) = Just xs


safeHead        :: [a] -> Maybe a
safeHead []     = Nothing
safeHead (x:xs) = Just x



calculateEnumDistance :: (Enum a, Ord a) => a -> a -> Integer
calculateEnumDistance a b = go a b 0
    where go current stop count
           | current == stop = count
           | current < stop  = go (succ current) stop (count + 1)

doTimes :: (Num b, Ord b) => (a -> a) -> b -> a -> a
doTimes f numTimes subject = go f 0 numTimes subject
    where go func timesDone timeToDo subj
           | timesDone == timeToDo = subj
           | timesDone < timeToDo = go func (timesDone + 1) timeToDo (func subj)

countUpEnum :: (Enum a, Ord a) => a -> a -> Integer -> [a]
countUpEnum a b leapSize = go a b leapSize []
    where go current end leapSize list
           | compare current end == GT = list
           | compare current end == EQ = list ++ [current]
           | compare current end == LT = go (doTimes succ leapSize current) end leapSize (list ++ [current])

-- enumFromTo
eftBool :: Bool -> Bool -> [Bool]
eftBool a b
    | compare a b == GT = []
    | compare a b == EQ = [a]
    | compare a b == LT = countUpEnum a b 1

-- enumFromTo
eftOrd :: Ordering -> Ordering -> [Ordering]
eftOrd a b
    | compare a b == GT = []
    | compare a b == EQ = [a]
    | compare a b == LT = countUpEnum a b 1


-- enumFromTo
eftInt :: Int -> Int -> [Int]
eftInt a b
    | compare a b == GT = []
    | compare a b == EQ = [a]
    | compare a b == LT = countUpEnum a b 1


--enumFromTo
eftChar :: Char -> Char -> [Char]
eftChar a b
    | compare a b == GT = []
    | compare a b == EQ = [a]
    | compare a b == LT = countUpEnum a b 1




getNextWord :: [Char] -> [Char]
getNextWord = takeWhile(/= ' ') . dropWhile (== ' ')

dropNextWord :: [Char] -> [Char]
dropNextWord = dropWhile(/= ' ') . dropWhile (== ' ')

myWords :: [Char] -> [[Char]]
myWords input = go input []
    where go remainingString wordCollection
           | null remainingString = wordCollection
           | otherwise = go ( dropNextWord remainingString) (wordCollection ++ [(getNextWord remainingString)])





mySqr = [x^2 | x <- [1..5]]
myCube = [y^3 | y <- [1..5]]

myTuple = [(x, y) | x <- mySqr, y <- myCube, x < 50, y < 50]

lengthOfMyTuple = length myTuple














myLength :: [a] -> Integer
myLength [] = 0
myLength (_:xs) = 1 + myLength xs


mySum :: (Num a) => [a] -> a
mySum [] = error "Need numbers to find a sum. This array is empty"
mySum (x:[]) = x
mySum (x:xs) = x + mySum xs




isItMystery :: [Char] -> [Bool]
isItMystery xs = map (\x -> elem x "aeiou") xs


getMultiplesOfThree :: [Integer] -> [Integer]
getMultiplesOfThree = filter (\x -> x `rem` 3 == 0)


lengthOfMultiplesOfThree :: [Integer] -> Integer
lengthOfMultiplesOfThree = toInteger . length . getMultiplesOfThree


myFilter :: String -> [String]
myFilter [] = []
myFilter text = filter (\x -> x /= "the" && x /= "a" && x /= "an") . words $ text





myZip :: [a] -> [b] -> [(a, b)]
myZip a b = go [] a b
    where go accum aRemain bRemain
           | null aRemain  || null bRemain = accum
           | otherwise = go
                          (accum ++ [(head aRemain, head bRemain)])
                          (drop 1 aRemain)
                          (drop 1 bRemain)





myZipWith :: (a -> b -> c) -> [a] -> [b] -> [c]
myZipWith func a b = go [] a b
    where go accum aRemain bRemain
            | null aRemain || null bRemain = accum
            | otherwise = go
                          (accum ++ [func (head aRemain) (head bRemain)])
                          (drop 1 aRemain)
                          (drop 1 bRemain)


myThirdZip :: [a] -> [b] -> [(a, b)]
myThirdZip a b = myZipWith (\x y -> (x, y)) a b
