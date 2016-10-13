module Examples where

myAny :: (a -> Bool) -> [a] -> Bool
myAny f xs =
  foldr (\x b -> f x || b) False xs




-- foldr (*) 1 [1..5]
-- 1* 2* 3 * 4 * 5 * 1

-- foldl (flip (*)) 1 [1..5]
-- (*) 5 ((*) 4 ((*) 3 ((*) 2 ((*) 1 1))))


foldr (\a b -> take 3 a  ++ b) "" ["Pizza", "Apple", "Banana"]
