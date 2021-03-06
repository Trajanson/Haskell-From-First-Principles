module Examples where

data Maybe' a = Nothing' | Just' a

ifEvenAdd2 :: Integer -> Maybe Integer
ifEvenAdd2 n = if even n
               then Just (n + 2)
               else Nothing




-- mkPerson :: Name -> Age -> Maybe Person
-- mkPerson name age
--    | name /= "" && age >= 0 = Just $ Person name age
--    | otherwise = Nothing


data Either' a b = Left' a | Right' b



toString :: PersonInvalid -> String
toString NameEmpty = "NameEmpty"
toString AgeTooLow = "AgeTooLow"


-- instance Show PersonInvalid where
--   show = toString
--
-- instance Eq PersonInvalid where
--   (==) NameEmpty NameEmpty = True
--   (==) AgeTooLow AgeTooLow = True
--   (==) _ _ = False


blah :: PersonInvalid -> String
blah pi
  | pi == NameEmpty = "NameEmpty"
  | pi == AgeTooLow = "AgeTooLow"
  | otherwise = "???"







type Name = String
type Age  = Integer


type ValidatePerson a = Either [PersonInvalid] a

data Person = Person Name Age deriving (Show)


data PersonInvalid = NameEmpty
                    | AgeTooLow
                    deriving (Eq, Show)



ageOkay :: Age -> Either [PersonInvalid] Age
ageOkay age = case age >= 0 of
  True  -> Right age
  False -> Left [AgeTooLow]

nameOkay :: Name -> Either [PersonInvalid] Name
nameOkay name = case name /= "" of
  True  -> Right name
  False -> Left [NameEmpty]


mkPerson :: Name -> Age -> ValidatePerson Person
mkPerson name age = mkPerson' (nameOkay name) (ageOkay age)

mkPerson' :: ValidatePerson Name -> ValidatePerson Age -> ValidatePerson Person
mkPerson' (Right nameOk) (Right ageOk) = Right (Person nameOk ageOk)
mkPerson' (Left badName) (Left badAge) = Left (badName ++ badAge)
mkPerson' (Left badName) _ = Left badName
mkPerson' _ (Left badAge) = Left badAge



data Example a = Blah | RoofGoats | Woot a





safeTail :: [a] -> Maybe [a]
safeTail    []  = Nothing
safeTail (x:[]) = Nothing
safeTail (_:xs) = Just xs
































--
