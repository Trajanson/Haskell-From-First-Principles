module PoemLines where

-- firstSen  = "Tyger Tyger, burning bright\n"
-- secondSen = "In the forests of the night\n"
-- thirdSen  = "What immortal hand or eye\n"
-- fourthSen = "Could frame thy fearful symmetry?"
-- sentences = firstSen ++ secondSen ++ thirdSen ++ fourthSen



 getNextSentence :: [Char] -> [Char]
 -- getNextSentence = takeWhile(/= ' ') . dropWhile (== ' ')
 getNextSentence x = ['a']


--  dropNextSentence :: [Char] -> [Char]
--  dropNextSentence = dropWhile(/= ' ') . dropWhile (== ' ')
--
--
-- takeNextSentence :: String -> String
-- takeNextSentence = undefined

-- takeNextSentence :: String -> String
-- takeNextSentence "" = ""
-- takeNextSentence text = go text "" False
--     where go remainingText accumulatedSentence lastCharWasSlash
--            | remainingText == "" = accumulatedSentence
--            | lastCharWasSlash && (head remainingText == 'n') = accumulatedSentence
--            | lastCharWasSlash && (head remainingText /= 'n')
--                  = go (drop 1 remainingText) (accumulatedSentence ++ ['\\', (head remainingText)]) False
--            | head remainingText == '\\'
--                  = go (drop 1 remainingText) (accumulatedSentence) True
--            | otherwise
--                  = go (drop 1 remainingText) (accumulatedSentence ++ [(head remainingText)]) False





myLines :: String -> [String]
myLines = undefined

shouldEqual =
  [ "Tyger Tyger, burning bright"
  , "In the forests of the night"
  , "What immortal hand or eye"
  , "Could frame thy fearful symmetry?" ]



main :: IO ()
main =
  print $ "Are they equal? "
          ++ show (myLines sentences == shouldEqual)
