module Fibs where


fibs = 1 : scanl (+) 1 fibs

take20Fibs = take 20 fibs

filteredFibs = takeWhile (< 100) fibs

factorial :: [Int]
factorial = 1 : scanl (*) 1 [2..]
