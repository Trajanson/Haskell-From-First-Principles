module Exercises where

import Data.List(intersperse)

-- #1
-- :t [[True, False], [True, True], [False, True]]
-- [[Bool]]


-- #2
-- b

-- #3
-- d

-- #4
-- d


cattyConny :: String -> String -> String
cattyConny x y = x ++ " mrow " ++ y

-- flippy = \x y -> y ++ " mrow " ++ x
flippy = flip cattyConny

-- appedCatty = \y -> "woops" + " mrow " ++ y
appedCatty = cattyConny "woops"
-- frappe = \y -> y ++ " mrow " ++ "haha"
frappe     = flippy "haha"

-- #1
-- appedCatty "woohoo!"
-- "woops mrow woohoo!"

-- #2
-- "1 mrow haha"

-- #3
-- "woops mrow 2 mrow haha"

-- #4
-- "woops mrow blue mrow haha"

-- #5
-- "pink mrow haha mrow green mrow woops mrow blue"

-- #6
-- "are mrow Pugs mrow awesome"


recursiveSum :: (Eq a, Num a) => a -> a
recursiveSum startingNum = go 0 startingNum
    where go total currentNum
           | currentNum == 0 = total
           | otherwise = go (total + currentNum) (currentNum - 1)




recursiveMultiplication :: (Integral a) => a -> a -> a
recursiveMultiplication num1 num2 = go num1 num2 0
    where go multiplier counter total
           | counter == 0 = total
           | counter < 0 = go multiplier (counter + 1) (total - multiplier)
           | otherwise = go multiplier (counter - 1) (total + multiplier)


mc91 :: (Integral a) => a -> a
mc91 n
     | n > 100  = n - 10
     | n <= 100 = mc91(mc91(n + 11))




digitToWord :: Int -> String
digitToWord 0 = "zero"
digitToWord 1 = "one"
digitToWord 2 = "two"
digitToWord 3 = "three"
digitToWord 4 = "four"
digitToWord 5 = "five"
digitToWord 6 = "six"
digitToWord 7 = "seven"
digitToWord 8 = "eight"
digitToWord 9 = "nine"
digitToWord _ = error "Not a digit"

digits :: Int -> [Int]
digits 0 = [0]
digits n = go n []
    where go number collection
           | number == 0 = collection
           | otherwise = go (headDigitsOfInteger number) ( [lastDigitOfInteger number] ++ collection)

wordNumber :: Int -> String
wordNumber n = concat $ intersperse "-" (map digitToWord (digits n))



lastDigitOfInteger :: Int -> Int
lastDigitOfInteger = (`mod` 10)

headDigitsOfInteger :: Int -> Int
headDigitsOfInteger = (`div` 10)
