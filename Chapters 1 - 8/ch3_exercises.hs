module Reverse where

text = "Curry is awesome"

rvrs :: String -> String
rvrs [] = []
rvrs (x:xs) = (rvrs xs) ++ [x]


main :: IO ()
main = print . rvrs $ text








thirdLetter :: String -> Char
thirdLetter x = x !! 2

letterIndex :: Int -> Char
letterIndex x = "Curry is awesome" !! x
