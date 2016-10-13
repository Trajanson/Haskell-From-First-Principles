import Data.Time
import Data.List

data DatabaseItem = DbString String
                  | DbNumber Integer
                  | DbDate   UTCTime
                  deriving (Eq, Ord, Show)


theDatabase :: [DatabaseItem]
theDatabase =
  [ DbDate (UTCTime
             (fromGregorian 1911 5 1)
    (secondsToDiffTime 34123))
  , DbNumber 9001
  , DbString "Hello, world!"
  , DbDate (UTCTime
           (fromGregorian 1921 5 1)
           (secondsToDiffTime 34123))
  ]





filterDbDate :: [DatabaseItem] -> [UTCTime]
filterDbDate (xs) = map (getUTCTime)
                        (filter isDbDate xs)
    where isDbDate (DbDate _) = True
          isDbDate _          = False
          getUTCTime (DbDate x) = x


filterDbNumber :: [DatabaseItem] -> [Integer]
filterDbNumber (xs) = map (getDbNumber)
                          (filter isDbNumber xs)
    where isDbNumber (DbNumber _) = True
          isDbNumber _            = False
          getDbNumber (DbNumber x) = x


mostRecent :: [DatabaseItem] -> UTCTime
mostRecent xs = maximum dates
-- mostRecent xs = foldr (\a b -> if a > b then a else b)
--                       (last dates)
--                       dates
    where dates = filterDbDate xs


sumDb :: [DatabaseItem] -> Integer
sumDb xs = foldr (+) 0 (filterDbNumber xs)


avgDb :: [DatabaseItem] -> Double
avgDb xs = fromIntegral(sumDb xs) / fromIntegral(length . filterDbNumber $ xs) 
