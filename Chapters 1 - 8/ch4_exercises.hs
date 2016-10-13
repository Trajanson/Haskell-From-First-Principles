module Exercises where

isPalindrome :: (Eq a) => [a] -> Bool
isPalindrome x = reverse x == x


myAbs :: Integer -> Integer
myAbs x = if x <= 0 then negate x else 0 - x

f :: (a, b) -> (c, d) -> ((b, d), (a, c))
f x y = (firstTuple, secondTuple)
  where firstTuple  = (snd x, snd y)
        secondTuple = (fst x, fst y)



x = (+)

f2 xs = w `x` 1
  where w = length xs

id_function :: a -> a
id_function x = x

myHead :: [a] -> a
myHead (x:xs) = x


myFst :: (a, b) -> a
myFst (a, b) = a
