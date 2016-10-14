module Exercises where


-- data Bool = False | True
-- data [] a = [] | a : [a]
--
-- data Trivial = Trivial'
--
--
-- data UnaryTypeCon a = UnaryValueCon a
--
--
--
-- data PugType = PugData
--
-- data HuskyType a = HuskyData
--
-- data DogueDeBordeaux doge = DogueDeBordeaux' doge
--                             deriving (Show)
--
-- data Doggies a = Husky a
--                | Mastiff a
--                deriving (Eq, Show)
--
--
--
-- myPug = PugData :: PugType
--
-- myHusky :: HuskyType a
-- myHusky = HuskyData
--
-- myOtherHusky :: Num a => HuskyType a
-- myOtherHusky = HuskyData
--
-- myOtherOtherHusky :: HuskyType [[[[[[Int]]]]]]
-- myOtherOtherHusky = HuskyData
--
-- myDoge :: DogueDeBordeaux Int
-- myDoge = DogueDeBordeaux' 10
--
-- badDoge :: DogueDeBordeaux String
-- badDoge = DogueDeBordeaux' . show $ 10
--
--
--
--
--
--
--
--
--
--
-- data Size = Size Integer
--             deriving (Eq, Show)
--
-- data Price = Price Integer
--              deriving (Eq, Show)
--
--
-- data Manufacturer = Mini
--                   | Mazda
--                   | Tata
--                   deriving (Eq, Show)
--
--
-- data Airline = PapuAir
--              | CatapultsR'Us
--              | TakeYourChancesUnited
--              deriving (Eq, Show)
--
--
-- data Vehicle = Car Manufacturer Price
--              | Plane Airline Size
--              deriving (Eq, Show)
--
--
--
--
--
-- myCar :: Vehicle
-- myCar    = Car Mini  (Price 14000)
--
-- urCar    = Car Mazda (Price 20000)
--
-- clownCar = Car Tata  (Price 7000)
--
-- doge     = Plane PapuAir
--
-- isCar :: Vehicle -> Bool
-- isCar (Car _ _) = True
-- isCar _         = False
--
-- isPlane :: Vehicle -> Bool
-- isPlane (Plane _ _) = True
-- isPlane _           = False
--
-- areCars :: [Vehicle] -> [Bool]
-- areCars = map isCar
--
--
--
-- getManu :: Vehicle -> Manufacturer
-- getManu (Car x _) = x
-- getManu _         = error "Not a Car!"
--
--
--
--
--
--
-- -- nullary data declaration
-- data Example0 = Example0 deriving (Eq, Show)
--
-- -- unary data declaration
-- data Example1 = Example1  Int deriving (Eq, Show)
--
-- -- product of Int and String data declaration
-- data Example2 = Example2 Int String
--                 deriving (Eq, Show)
--
--
--
--
-- data MyType = MyVal Int deriving (Eq, Show)
--
--
--
--
--
--
--
--
--
-- data Example = MakeExample deriving Show
--
-- data MySecondExample = SecondExample Int deriving Show
--
--
--
-- -- data Goats = Goats Int deriving (Eq, Show)
-- --
-- --
-- --
-- -- tooManyGoats :: Int -> Bool
-- -- tooManyGoats n = n > 42
--
--
--
--
-- -- newtype Goats = Goats Int deriving (Eq, Show)
-- --
-- -- newtype Cows = Cows Int deriving (Eq, Show)
-- --
-- --
-- --
-- --
-- -- tooManyGoats :: Goats -> Bool
-- -- tooManyGoats (Goats n) = n > 42
-- --
--
--
--
--
--
-- class TooMany a where
--   tooMany :: a -> Bool
--
-- instance TooMany Int where
--   tooMany n = n > 42
--
--
-- -- type CloneGoats = Int
--
-- newtype Goats = Goats Int
--                 deriving (Eq, Show)
--
-- instance TooMany Goats where
--   tooMany (Goats n) = tooMany n
--
-- -- instance TooMany CloneGoats where
-- --   tooMany n = n > 0
--
--
--
--
--
--
--
--
--
--
--
--
-- data QuantumBool = QuantumTrue
--                  | QuantumFalse
--                  | QuantumBoth
--                  deriving (Eq, Show)
--
--
-- data TwoQs = MkTwoQs QuantumBool QuantumBool
--              deriving (Eq, Show)
--
--
--
--
-- type TupleTwoQs = (QuantumBool, QuantumBool)
--
--
--
-- -- data Person = MkPerson String Int
-- --               deriving (Eq, Show)
-- --
-- --
-- -- jm = MkPerson "julie" 108
-- -- ca = MkPerson "chris" 16
-- --
-- -- namae :: Person -> String
-- -- namae (MkPerson s _) = s
--
--
-- data Person =  Person { name  :: String
--                       , age :: Int}
--                       deriving (Eq, Show)
--
-- jm = Person {name = "julie", age = 108}
-- ca = Person {name = "chris", age = 102}
--
--
--
-- data Fiction    = Fiction' deriving Show
--
-- data Nonfiction = Nonfiction' deriving Show
--
-- data BookType = FictionBook Fiction
--               | NonfictionBook Nonfiction
--               deriving Show
--
-- type AuthorName = String
--
-- data Author = Author (AuthorName, BookType)
--
--
--
--
-- -- data Expr = Number Int
-- --           | Add Expr Expr
-- --           | Minus Expr
-- --           | Mult Expr Expr
-- --           | Divide Expr Expr
-- --
-- -- type Number = Int
-- -- type Add    = (Expr, Expr)
-- -- type Minus = Expr
-- -- type Mult = (Expr, Expr)
-- -- type Divide = (Expr, Expr)
-- --
-- -- type Expr = Either  Number
-- --                    (Either Add
-- --                            (Either Minus
-- --                                   (Either Mult Divide)))
--
--
--
--
-- -- data FlowerType = Gardenia
-- --                 | Daisy
-- --                 | Rose
-- --                 | Lilac
-- --                 deriving (Show)
--
-- type Gardener = String
--
-- -- data Garden = Garden Gardener FlowerType
-- --               deriving (Show)
--
--
-- data Garden = Gardenia Gardener
--             | Daisy    Gardener
--             | Rose     Gardener
--             | Lilac    Gardener
--             deriving (Show)
--
--
--
--
--
--
--
--
--
--
--
--
--
--
--
-- data GuessWhat = Chickenbutt deriving (Eq, Show)
--
-- -- data Id a = MkId a deriving (Eq, Show)
--
-- data Product a b = Product a b deriving (Eq, Show)
--
-- -- data Sum a b = First a
-- --              | Second b
-- --              deriving (Eq, Show)
--
-- data RecordProduct a b = RecordProduct { pfirst  :: a
--                                        , psecond :: b }
--                                        deriving (Eq, Show)
--
--
--
--
--
--
--
-- newtype NumCow = NumCow Int deriving (Eq, Show)
--
-- newtype NumPig = NumPig Int deriving (Eq, Show)
--
-- data Farmhouse = Farmhouse NumCow NumPig
--                  deriving (Eq, Show)
--
-- type Farmhouse' = Product NumCow NumPig
--
--
--
--
-- newtype NumSheep = NumSheep Int
--                    deriving (Eq, Show)
--
-- data BigFarmhouse = BigFarmhouse NumCow NumPig NumSheep
--                     deriving (Eq, Show)
--
-- type BigFarmhouse' = Product NumCow (Product NumPig NumSheep)
--
--
--
-- -- type Name     = String
--
-- type Age      = Int
--
-- type LovesMud = Bool
--
--
--
-- type PoundsOfWool = Int
--
-- data CowInfo = CowInfo Name Age
--                deriving (Eq, Show)
--
-- data PigInfo = PigInfo Name Age LovesMud
--                deriving (Eq, Show)
--
-- data SheepInfo = SheepInfo Name Age PoundsOfWool
--                  deriving (Eq, Show)
--
-- data Animal = Cow CowInfo
--             | Pig PigInfo
--             | Sheep SheepInfo
--             deriving (Eq, Show)
--
-- type Animal' = Sum CowInfo (Sum PigInfo SheepInfo)
--
--
--
--
-- trivialValue :: GuessWhat
-- trivialValue = Chickenbutt
--
-- data Id a = MkId a deriving (Eq, Show)
--
-- idInt :: Id Integer
-- idInt = MkId 10
--
--
--
-- idIdentity :: Id (a -> a)
-- idIdentity = MkId $ (\x -> x)
--
--
--
--
-- type Name    = String
-- type Awesome = Bool
--
--
-- person :: Product Name Awesome
-- person = Product "Simon" True
--
--
--





-- data Sum a b = First a
--              | Second b
--              deriving (Eq, Show)
--
-- data Twitter = Twitter
--                deriving (Eq, Show)
--
-- data AskFm = AskFm
--              deriving (Eq, Show)
--
-- socialNetwork :: Sum Twitter AskFm
-- socialNetwork = First Twitter



-- data SocialNetwork = Twitter
--                    | AskFm
--                    deriving (Eq, Show)


-- type Twitter = String
-- type AskFm = String
--
-- twitter :: Sum Twitter AskFm
-- twitter = First "Twitter"
--
--
--
-- askfm :: Sum Twitter AskFm
-- askfm = First "AskFm"
--

data Product a b = Product a b deriving (Eq, Show)


data RecordProduct a b = RecordProduct { pfirst  :: a
                                       , psecond :: b }
                                       deriving (Eq, Show)






data OperatingSystem = GnuPlusLinux
                     | OpenBSDPlusNevermindJustBSDStill
                     | Mac
                     | Windows
                     deriving (Eq, Show)

data ProgrammingLanguage = Haskell
                         | Agda
                         | Idris
                         | PureScript
                         deriving (Eq, Show)

data Programmer = Programmer { os   :: OperatingSystem
                             , lang :: ProgrammingLanguage }
                             deriving (Eq, Show)


nineToFive :: Programmer
nineToFive = Programmer { os = Mac
                        , lang = Haskell}

feelingWizardly :: Programmer
feelingWizardly = Programmer { lang = Agda
                             , os = GnuPlusLinux }


allOperatingSystems :: [OperatingSystem]
allOperatingSystems =
  [ GnuPlusLinux
  , OpenBSDPlusNevermindJustBSDStill , Mac
  , Windows
  ]

allLanguages :: [ProgrammingLanguage]
allLanguages = [Haskell, Agda, Idris, PureScript]


allProgrammersWithLanguage :: ProgrammingLanguage -> [Programmer]
allProgrammersWithLanguage language = go allOperatingSystems []
    where go operatingSystems allProgrammers
           | null operatingSystems = allProgrammers
           | otherwise = go (tail operatingSystems)
                            (allProgrammers ++ [Programmer { lang = language
                                                           , os   = (head operatingSystems )}])

allProgrammers :: [Programmer]
allProgrammers = handleLanguages allLanguages []
  where handleLanguages languages allProgrammers
            | null languages = allProgrammers
            | otherwise = handleLanguages (tail languages)
                                          (allProgrammers ++
                                              (allProgrammersWithLanguage (head languages)))






data ThereYet = There Integer Float String Bool
                deriving (Eq, Show)

nope :: Float -> String -> Bool -> ThereYet
nope = There 10

notYet :: String -> Bool -> ThereYet
notYet = nope 25.5

notQuite :: Bool -> ThereYet
notQuite = notYet "woohoo"

yusssss :: ThereYet
yusssss = notQuite False













































































--
