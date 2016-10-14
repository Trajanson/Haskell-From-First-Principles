module PhoneExercise where

import Data.Char

newtype Presses   = Presses   Int  deriving (Show, Eq)

data SettingChoice = Capitalize
                     deriving (Show, Eq)

data    Selection = Setting SettingChoice
                  | Selection Char
                  deriving (Show, Eq)

class HasOptions a where
  getOptions :: a -> [Selection]

data Button = ButtonOne
              | ButtonTwo
              | ButtonThree
              | ButtonFour
              | ButtonFive
              | ButtonSix
              | ButtonSeven
              | ButtonEight
              | ButtonNine
              | ButtonStar
              | ButtonZero
              | ButtonPound
              deriving (Show, Eq, Ord, Enum, Bounded)

instance HasOptions Button where
  getOptions ButtonOne   = [Selection '1']
  getOptions ButtonTwo   = [Selection 'A',
                            Selection 'B',
                            Selection 'C',
                            Selection '2']
  getOptions ButtonThree = [Selection 'D',
                            Selection 'E',
                            Selection 'F',
                            Selection '3']
  getOptions ButtonFour  = [Selection 'G',
                            Selection 'H',
                            Selection 'I',
                            Selection '4']
  getOptions ButtonFive  = [Selection 'J',
                            Selection 'K',
                            Selection 'L',
                            Selection '5']
  getOptions ButtonSix   = [Selection 'M',
                            Selection 'N',
                            Selection 'O',
                            Selection '6']
  getOptions ButtonSeven = [Selection 'P',
                            Selection 'Q',
                            Selection 'R',
                            Selection 'S',
                            Selection '7']
  getOptions ButtonEight = [Selection 'T',
                            Selection 'U',
                            Selection 'V',
                            Selection '8']
  getOptions ButtonNine  = [Selection 'W',
                            Selection 'X',
                            Selection 'Y',
                            Selection 'Z',
                            Selection '9']
  getOptions ButtonStar  = [Setting Capitalize,
                            Selection '*',
                            Selection '^']
  getOptions ButtonZero  = [Selection ' ',
                            Selection '+',
                            Selection '_',
                            Selection '0']
  getOptions ButtonPound = [Selection '.',
                            Selection ',',
                            Selection '#']



data Direction = Direction { button  :: Button
                           , presses :: Presses}
                           deriving (Show, Eq)

isCharacterAmongOptions :: Char -> [Selection] -> Bool
isCharacterAmongOptions a b = any test b
  where test (Selection b) = a == b
        test _ = False

isSettingChoiceAmongOptions :: SettingChoice -> [Selection] -> Bool
isSettingChoiceAmongOptions a b = any test b
  where test (Setting b) = Setting a == Setting b
        test _ = False


buttonWithCharacter :: Char -> Button
buttonWithCharacter x = go startButton
    where startButton = minBound :: Button
          lastPossibleButton = maxBound :: Button
          upperCasedChar = toUpper x
          go currentButton
             | isCharacterAmongOptions upperCasedChar (getOptions currentButton) = currentButton
             | otherwise =
                   if currentButton == lastPossibleButton
                   then error "not possible to enter character into phone"
                   else go (succ currentButton)



buttonWithSetting :: SettingChoice -> Button
buttonWithSetting setting = go startButton
    where startButton = minBound :: Button
          lastPossibleButton = maxBound :: Button
          go currentButton
             | isSettingChoiceAmongOptions setting (getOptions currentButton) = currentButton
             | otherwise =
                   if currentButton == lastPossibleButton
                   then error "not possible to engage that setting on phone"
                   else go (succ currentButton)



pressesToGetCharacterFromButton :: Button -> Char -> Presses
pressesToGetCharacterFromButton button char = go options 1
    where options = getOptions button
          upperChar = toUpper char
          go remainingOptions count
              | null remainingOptions = error (upperChar : " is not an available option on the selected button")
              | (head remainingOptions) == Selection upperChar = Presses count
              | otherwise = go (tail remainingOptions) (count + 1)

pressesToGetSettingFromButton :: Button -> SettingChoice -> Presses
pressesToGetSettingFromButton button setting = go options 1
    where options = getOptions button
          go remainingOptions count
              | (head remainingOptions) == Setting setting = Presses count
              | otherwise = go (tail remainingOptions) (count + 1)



getDirectionsForDesiredKey :: Selection -> Direction
getDirectionsForDesiredKey (Selection char) = directions
    where button = buttonWithCharacter char
          presses = pressesToGetCharacterFromButton button
                                                    char
          directions = Direction button presses
getDirectionsForDesiredKey (Setting setting) = directions
    where button = buttonWithSetting setting
          presses = pressesToGetSettingFromButton button
                                                  setting
          directions = Direction button presses











parseText :: [String] -> [[Selection]]
parseText texts = map (parseIndividualText) (texts)

parseIndividualText :: String -> [Selection]
parseIndividualText text = go False text
    where go inCapsMode remainingText
           | null remainingText = []
           | isUpper (head remainingText) && (not inCapsMode) = [Setting Capitalize,
                                           Selection (head remainingText)]
                                             ++ go (True) (tail remainingText)
           | isLower (head remainingText) && (inCapsMode)     = [Setting Capitalize,
                                           Selection (head remainingText)]
                                             ++ go (False) (tail remainingText)
           | otherwise                     = [Selection (head remainingText)]
                                             ++ go (inCapsMode) (tail remainingText)



getDirectionsForText :: String -> [Direction]
getDirectionsForText text = map (getDirectionsForDesiredKey)  (parseIndividualText text)

fingerTaps :: [Direction] -> Int
fingerTaps = foldr (\dir sum -> (getPresses (presses dir)) + sum ) 0
    where getPresses (Presses x) = x

fingerTapsForText :: String -> Int
fingerTapsForText = fingerTaps . getDirectionsForText

fingerTapsForConvo :: [String] -> Int
fingerTapsForConvo = foldr (\a b -> (fingerTapsForText a) + b ) 0

countCharacterInString :: Char -> String -> Int
countCharacterInString char text = go 0 text
    where go count remainingText
           | null remainingText = count
           | head remainingText == char = go (count + 1)
                                             (tail remainingText)
           | otherwise = go (count)
                            (tail remainingText)

mostCommonCharacterInString :: String -> Char
mostCommonCharacterInString text = go ' ' 0 text
  where go maxChar maxCount remainingText
         | null remainingText = maxChar
         | otherwise = if countCharacterInString (head remainingText)
                                                 (text)
                           > maxCount
                       then go (head remainingText)
                               (countCharacterInString (head remainingText)
                                                       (text))
                               (tail remainingText)
                       else go maxChar maxCount (tail remainingText)




countTapsForCharInString :: Char -> String -> Int
countTapsForCharInString char text = tapsPerChar * (countCharacterInString char text)
  where button = buttonWithCharacter char
        tapsPerChar = (\(Presses a) -> a) (pressesToGetCharacterFromButton button char)





firstLine :: String
firstLine = "Wanna play 20 questions"



convo :: [String]
convo =
 ["Wanna play 20 questions",
  "Ya",
  "U 1st haha",
  "Lol ok. Have u ever tasted alcohol lol",
  "Lol ya",
  "Wow ur cool haha. Ur turn",
  "Ok. Do u think I am pretty Lol",
  "Lol ya",
  "Haha thanks just making sure rofl ur turn"]
