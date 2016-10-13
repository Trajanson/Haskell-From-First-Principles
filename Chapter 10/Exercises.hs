module Exercises where

stops  = "pbtdkg"
vowels = "aeiou"

combinations = [ (a, b, c) | a <- stops, b <- vowels, c <- stops ]

combinations1 = [ (a, b, c) | a <- stops,
                              b <- vowels,
                              c <- stops,
                              a == 'p']

sampleNouns = ["cat" , "hat", "bat"]
sampleVerbs = ["sat", "chat", "pat"]

createTuples noun verb = [ (a, b, a) | a <- noun,
                                       b <- verb,
                                       c <- noun]


-- average length of each word
seekritFunc :: String -> Float
seekritFunc x = (/) (fromIntegral .sum $ (map length (words x)))
                    (fromIntegral . length $ (words x))





myAnd :: (Foldable t) => t Bool -> Bool
myAnd = foldr (&&) True



myOr :: (Foldable t) => t Bool -> Bool
myOr = foldr (||) False

myAny :: (Foldable t) => (a -> Bool) -> t a -> Bool
myAny func = foldr (\a b -> func a || b) False


myFirstElem :: (Foldable t, Eq a) => a -> t a -> Bool
myFirstElem char = foldr (\a b -> (a == char) || b ) False


mySecondElem :: (Foldable t, Eq a) => a -> t a -> Bool
mySecondElem char = myAny (== char)




myReverse :: [a] -> [a]
myReverse = foldl (flip (:)) []


myMap :: (a -> b) -> [a] -> [b]
myMap func = foldr (\a b -> (func a) : b) []


myFilter :: (a -> Bool) -> [a] -> [a]
myFilter func = foldr (\a b -> if (func a) then a : b else b)
                      []





squish :: [[a]] -> [a]
squish = foldr (\a b -> a ++ b)
                 []




squishMap :: (a -> [b]) -> [a] -> [b]
squishMap func = squish . myMap func



squishAgain :: [[a]] -> [a]
squishAgain = squishMap id


myMaximumBy :: (a -> a -> Ordering) -> [a] -> a
myMaximumBy func xs = foldr (\a b -> case (func a b) of
                                        GT -> a
                                        _  -> b)
                       (last xs)
                       (xs)








myMinimumBy :: (a -> a -> Ordering) -> [a] -> a
myMinimumBy func xs = foldr (\a b -> case (func a b) of
                                        LT -> a
                                        _  -> b)
                       (last xs)
                       (xs)
