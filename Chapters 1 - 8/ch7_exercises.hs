module Exercises where

f :: Char -> String
f = undefined

g :: String -> [String]
g = undefined

h :: Char -> [String]
h = g . f




f3 :: Ord a => a -> a -> Bool
f3 = undefined


f5 :: a -> a
f5 x = x



tensDigit :: Integral a => a -> a
tensDigit x = d
  where xLast = x `div` 10
        d     = xLast `mod` 10




tensDigitPF :: Integral a => a -> a
tensDigitPF = (`mod` 10) . (`div` 10)

hunsD :: Integral a => a -> a
hunsD = (`mod` 10) . (`div` 100)











foldBool :: a -> a -> Bool -> a
foldBool = error "Error: Need to implement foldBool!"

foldBool3 :: a -> a -> Bool -> a
foldBool3 x y True = x
foldBool3 x y False = y




foldBool4 :: a -> a -> Bool -> a
foldBool4 x y condition
  | condition = x
  | otherwise = y



g2 :: (a -> b) -> (a, c) -> (b, c)
g2 f (a, c) = (f a, c)






-- id :: a -> a
-- id x = x

roundTrip :: (Show a, Read a) => a -> a
roundTrip a = read (show a)


main = do
  print (roundTrip 4)
  print (roundTripFP 4)
  print (roundTripInt 4 :: Int)
  print (id 4)


roundTripFP :: (Show a, Read a) => a -> a
roundTripFP = read . show


roundTripInt :: (Show a, Read b) => a -> b
roundTripInt = read . show
