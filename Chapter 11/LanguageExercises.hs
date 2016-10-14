module LanguageExercises where

import Data.Char

capitalizeWord :: String -> String
capitalizeWord (x:xs) = (toUpper x) : xs


capitalizeParagraph :: [Char] -> [Char]
capitalizeParagraph xs = (toUpper (head xs)) : (capitalizeParagraph' (tail xs))

capitalizeParagraph' :: [Char] -> [Char]
capitalizeParagraph' [] = []
capitalizeParagraph' remaining@(x:[]) = remaining
capitalizeParagraph' remaining@(x1:x2:[]) = remaining
capitalizeParagraph' remaining@(x1:x2:x3:[])
    | x1 == '.' && x2 == ' ' = x1 : x2: [(toUpper x3)]
    | otherwise = x1: (capitalizeParagraph' (x2:x3:[]))
capitalizeParagraph' remaining@(x1:x2:x3:xs)
    | x1 == '.' && x2 == ' ' = x1: x2: (toUpper x3) : (capitalizeParagraph' xs)
    | otherwise = x1: (capitalizeParagraph' (x2:x3:xs))
