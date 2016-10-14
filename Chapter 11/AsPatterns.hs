module AsPattern where

import Data.Char

f :: Show a => (a, b) -> IO (a, b)
f t@(a, _) = do
  print a
  return t

doubleUp :: [a] -> [a]
doubleUp [] = []
doubleUp xs@(x:_) = x : xs



isSubsequenceOf :: (Eq a) => [a] -> [a] -> Bool
isSubsequenceOf [] _ = True
isSubsequenceOf _ [] = False
isSubsequenceOf t1@(x:xs) t2@(y:ys)  = (elem x t2) && (isSubsequenceOf xs t2)

capitalizeWords :: String -> [(String, String)]
capitalizeWords string = map capitalizeAndTuple (words string)
    where capitalizeAndTuple t@(x:xs) = (t, [toUpper x] ++ xs)
