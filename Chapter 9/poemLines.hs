module PoemLines where

firstSen = "Tyger Tyger, burning bright\n"
secondSen = "In the forests of the night\n"
thirdSen = "What immortal hand or eye\n"
fourthSen = "Could frame thy fearful symmetry?"
sentences = firstSen ++ secondSen
            ++ thirdSen ++ fourthSen

takeUntilCharacter :: Char -> [Char] -> [Char]
takeUntilCharacter char = takeWhile(/= char) . dropWhile (== char)

dropUntilCharacter :: Char -> [Char] -> [Char]
dropUntilCharacter char = dropWhile(/= char) . dropWhile(== char)


getNextLine :: [Char] -> [Char]
getNextLine = takeUntilCharacter '\n'

dropNextLine :: [Char] -> [Char]
dropNextLine = dropUntilCharacter '\n'

myLines :: [Char] -> [[Char]]
myLines input = go input []
    where go remainingString linesCollection
           | null remainingString = linesCollection
           | otherwise = go ( dropNextLine remainingString) (linesCollection ++ [(getNextLine remainingString)])


shouldEqual =
    [ "Tyger Tyger, burning bright"
    , "In the forests of the night"
    , "What immortal hand or eye"
    , "Could frame thy fearful symmetry?" ]


main :: IO ()
main =
  print $ "Are they equal? "
          ++ show (myLines sentences == shouldEqual)
