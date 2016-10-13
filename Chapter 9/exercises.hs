module Exercises where

import Data.Char

collectUpper :: [Char] -> [Char]
collectUpper xs = filter isUpper xs


capitalizeFirstLetter :: String -> String
capitalizeFirstLetter [] = []
capitalizeFirstLetter (x:xs) = toUpper x : xs


allCaps :: String -> String
allCaps [] = []
allCaps (x:xs) = toUpper x : allCaps xs


capitalizeAndGetFirstLetter :: String -> Char
capitalizeAndGetFirstLetter = toUpper . head





myAnd :: [Bool] -> Bool
myAnd [] = True
myAnd (x:xs) = if x == False then False else myAnd xs

mySecondAnd :: [Bool] -> Bool
mySecondAnd [] = True
mySecondAnd (x:xs) = x && myAnd xs




myOr :: [Bool] -> Bool
myOr [] = False
myOr (x:xs) = if x == True then True else myOr xs


myAny :: (a -> Bool) -> [a] -> Bool
myAny _ [] = False
myAny func (x:xs) = if func x then True else myAny func xs



myElem :: Eq a => a -> [a] -> Bool
myElem goal list = myAny (\x -> x == goal) list


myReverse :: [a] -> [a]
myReverse [] = []
myReverse (x:xs) = (myReverse xs) ++ [x]




squish :: [[a]] -> [a]
squish [] = []
squish (x:xs) = x ++ squish xs


squishMap :: (a -> [b]) -> [a] -> [b]
squishMap func list = squish ( map func list)


myMaximumBy :: (a -> a -> Ordering) -> [a] -> a
myMaximumBy _ []  = error "No elements in list"
myMaximumBy _ (x:[])  = x
myMaximumBy func list = go (tail list) (head list)
    where go remainingList currentMaximum
           | null remainingList = currentMaximum
           | otherwise = if (func currentMaximum (head remainingList)) == LT
             then go (tail remainingList) (head remainingList)
             else go (tail remainingList) (currentMaximum)


myMinimumBy :: (a -> a -> Ordering) -> [a] -> a
myMinimumBy _ []  = error "No elements in list"
myMinimumBy _ (x:[])  = x
myMinimumBy func list = go (tail list) (head list)
   where go remainingList currentMaximum
          | null remainingList = currentMaximum
          | otherwise = if (func currentMaximum (head remainingList)) == GT
            then go (tail remainingList) (head remainingList)
            else go (tail remainingList) (currentMaximum)




myMaximum :: (Ord a) => [a] -> a
myMaximum = myMaximumBy compare

myMinimum :: (Ord a) => [a] -> a
myMinimum = myMinimumBy compare









--
