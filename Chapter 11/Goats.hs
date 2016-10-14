{-# LANGUAGE GeneralizedNewtypeDeriving #-}
{-# LANGUAGE FlexibleInstances #-}

class TooMany a where
  tooMany :: a -> Bool

instance TooMany Int where
  tooMany n = n > 42

newtype Goats = Goats Int deriving (Eq, Show, TooMany)


instance TooMany (Int, String) where
  tooMany (n, text)
      | text == "Goats" && n > 12 = True
      | text == "Skynets" && n > 0 = True
      | otherwise = False


instance TooMany (Int, Int) where
  tooMany (n1, n2) = n1 + n2 > 84

instance (Num a, TooMany a) => TooMany (a, a) where
  tooMany (tm1, tm2) = tooMany (tm1 + tm2)
