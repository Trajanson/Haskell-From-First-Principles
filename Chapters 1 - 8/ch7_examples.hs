module Examples where

isItTwo :: Integer -> Bool
isItTwo 2 = True
isItTwo _ = False


newtype Username = Username String
newtype AccountNumber = AccountNumber Integer

data User = UnregisteredUser
          | RegisteredUser Username AccountNumber

printUser :: User -> IO ()
printUser UnregisteredUser = putStrLn "UnregisteredUser"
printUser (RegisteredUser (Username name)
                          (AccountNumber acctNum))
          = putStrLn $ name ++ " " ++ show acctNum




data WherePenguinsLive =
    Galapagos
  | Antarctica
  | Australia
  | SouthAfrica
  | SouthAmerica
  deriving (Eq, Show)

data Penguin =
  Peng WherePenguinsLive
  deriving (Eq, Show)

isSouthAfrica :: WherePenguinsLive -> Bool
isSouthAfrica SouthAfrica  = True
isSouthAfrica _            = False
-- isSouthAfrica Galapagos    = False
-- isSouthAfrica Antarctica   = False
-- isSouthAfrica Australia    = False
-- isSouthAfrica SouthAmerica = False

gimmeWhereTheyLive :: Penguin -> WherePenguinsLive
gimmeWhereTheyLive (Peng whereitLives) = whereitLives



galapagosPenguin :: Penguin -> Bool
galapagosPenguin (Peng Galapagos) = True
galapagosPenguin _                = False

antarcticPenguin :: Penguin -> Bool
antarcticPenguin (Peng Antarctica) = True
antarcticPenguin _                 = False


antarcticOrGalapagos :: Penguin -> Bool
antarcticOrGalapagos p =
  (galapagosPenguin p) || (antarcticPenguin p)





addEmUp2 :: Num a => (a, a) -> a
addEmUp2 (x, y) = x + y

addEmUp2Alt :: Num a => (a, a) -> a
addEmUp2Alt tup = (fst tup) + (snd tup)

fst3 :: (a, b, c) -> a
fst3 (x, _, _) = x

third3 :: (a, b, c) -> c
third3 (_, _, x) = x








funcZ :: (Num a, Eq a) => a -> [Char]
funcZ x =
  case x + 1 == 1 of
    True -> "AWESOME"
    False -> "wut"


pal :: Eq a => [a] -> [Char]
pal xs =
  case xs == reverse xs of
    True -> "yes"
    False -> "no"

pal' :: Eq a => [a] -> [Char]
pal' xs =
  case y of
    True -> "yes"
    False -> "no"
  where y = xs == reverse xs




greetIfCool :: String -> IO ()
greetIfCool coolness =
  case cool of
    True -> putStrLn "eyyyyy. What's shakin'?"
    False -> putStrLn "pshhhh."
  where cool = coolness == "downright frosty yo"




functionC :: Ord a => a -> a -> a
functionC x y = if (x > y) then x else y

functionC' :: Ord a => a -> a -> a
functionC' x y =
  case x > y of
    True -> x
    False -> y

ifEvenAdd2 :: Integral a => a -> a
ifEvenAdd2 n = if even n then (n + 2) else n

ifEvenAdd2' :: Integral a => a -> a
ifEvenAdd2' n =
  case even n of
    True -> n + 2
    False -> n


nums :: (Ord a, Num a, Num b) => a -> b
nums x =
  case compare x 0 of
    LT -> -1
    EQ -> 0
    GT -> 1





data Employee = Coder
              | Manager
              | Veep
              | CEO
              deriving (Eq, Ord, Show)

reportBoss :: Employee -> Employee -> IO ()
reportBoss e e' =
  putStrLn $ show e ++ " is the boss of " ++ show e'

codersRuleCEOsDrool :: Employee -> Employee -> Ordering
codersRuleCEOsDrool Coder Coder = EQ
codersRuleCEOsDrool Coder _     = GT
codersRuleCEOsDrool _     Coder = LT
codersRuleCEOsDrool e     e'    = compare e e'


employeeRank :: (Employee -> Employee -> Ordering)
              -> Employee
              -> Employee
              -> IO ()
employeeRank f e e' =
  case f e e' of
    GT -> reportBoss e e'
    EQ -> putStrLn "Neither employee is the boss"
    LT -> (flip reportBoss) e e'








dodgy :: (Num a) => a -> a -> a
dodgy x y = x + y * 10

oneIsOne :: (Num a) => (a -> a)
oneIsOne = dodgy 1 -- (\y -> 1 + y * 10)

oneIsTwo :: (Num a) => (a -> a)
oneIsTwo = (flip dodgy) 2 -- (\x -> x + 2 * 10)






isRight a b c
  | (a^2 :: Integer) + b^2 == c^2 = "RIGHT ON"
  | otherwise = "not right"



dogYrs :: Integer -> Integer
dogYrs x
  | x <= 0    = 0
  | x <= 1    = x * 15
  | x <= 2    = x * 12
  | x <= 4    = x * 8
  | otherwise = x * 6





avgGrade :: (Fractional a, Ord a) => a -> Char
avgGrade x
 | y >= 0.9 = 'A'
 | y >= 0.8 = 'B'
 | y >= 0.7 = 'C'
 | y >= 0.59 = 'D'
 | y < 0.59 = 'F'
 where y = x / 100


myPal :: (Eq a) => [a] -> Bool
myPal xs
  | xs == reverse xs = True
  | otherwise        = False


numbers :: (Num a, Ord a) => a -> a
numbers x
  | x < 0 = -1
  | x == 0 = 0
  | x > 0 = 1






add :: Int -> Int -> Int
add x y = x + y

addPF :: Int -> Int -> Int
addPF = (+)

addOne :: Int -> Int
addOne = \x -> x + 1

addOnePF :: Int -> Int
addOnePF = (+1)


main :: IO ()
main = do
  print (0 :: Int) -- 0
  print (add 1 0)  -- 1
  print (addOne 0) -- 1
  print (addOnePF 0) -- 1
  print ((addOne . addOne) 0) -- 2

  print ((addOnePF . addOne) 0) -- 2
  print ((addOne . addOnePF) 0) -- 2
  print ((addOnePF . addOnePF) 0) -- 2
  print (negate (addOne 0)) -- -1
  print ((negate . addOne) 0) -- -1
  print ((addOne . addOne . addOne
          . negate . addOne) 0) -- 2





myPrint :: Show a => a -> IO ()
myPrint a = putStrLn (show a)

myPrint :: Show a => a -> IO ()
myPrint a = putStrLn . show $ a















--
