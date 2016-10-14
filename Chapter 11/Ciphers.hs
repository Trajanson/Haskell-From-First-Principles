module Cipher where

import Data.Char


shiftChar :: Char -> Int -> Char
shiftChar letter shiftVal = case isLetter letter of
                            True  -> handleShift letter shiftVal
                            False -> letter


handleShift :: Char -> Int -> Char
handleShift letter shiftVal = chr adjustedValue
    where rawAdjustedValue = (ord letter) + shiftVal
          adjustedValue
              | isUpper letter = ((rawAdjustedValue - (ord 'A'))
                `mod` 26) + (ord 'A')
              | isLower letter = ((rawAdjustedValue - (ord 'a')) `mod` 26) + (ord 'a')
              | otherwise = error "input is not a letter"


shiftDistance :: Char -> Char -> Int
shiftDistance startChar endChar
    | (isUpper startChar) && (isUpper endChar) = calcDistance
    | (isLower startChar) && (isLower endChar) = calcDistance
    | otherwise = error "character is not letter or letters are not same case"
        where startCharValue = ord startChar
              endCharValue   = ord endChar
              calcDistance   = endCharValue - startCharValue


getCodePattern :: String -> String -> [Int]
getCodePattern unencoded encoded = map (\x -> shiftDistance (fst x) (snd x) ) availableStringTuple
    where unencodedLetters = concat . words $ unencoded
          encodedLetters   = concat . words $ encoded
          availableStringTuple = zip unencodedLetters encodedLetters


vigenereCiper :: String -> String -> String
vigenereCiper unencoded encoded = go unencodedLetters codePattern ""
    where unencodedLetters = concat . words $ unencoded
          encodedLetters   = concat . words $ encoded
          codePattern = getCodePattern unencodedLetters encodedLetters
          go unencodedString codePattern encodedString
           | null unencodedString = encodedString
           | otherwise = go (tail unencodedString)
                            ((tail codePattern) ++ [(head codePattern)])
                            (encodedString ++ [(shiftChar (head unencodedString)
                                                          (head codePattern))])



unencryptedText = "abbacadabra"
code            = "ba"


test = vigenereCiper unencryptedText code
