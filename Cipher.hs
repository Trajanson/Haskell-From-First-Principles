module Cipher where

import Data.Char

caesar :: Int -> String -> String
caesar shiftValue text = map (\x -> shiftCharByValue x shiftValue) text

shiftCharByValue :: Char -> Int -> Char
shiftCharByValue character shiftValue = if isUpper character
                                     then handleUpperShift character shiftValue
                                     else if isLower character
                                          then handleLowerShift character shiftValue
                                          else character


handleUpperShift :: Char -> Int -> Char
handleUpperShift = handleShift 'A'

handleLowerShift :: Char -> Int -> Char
handleLowerShift = handleShift 'a'

handleShift :: Char -> Char -> Int -> Char
handleShift startValue character shiftValue = chr valuePositionedInAlphabet
    where newCharacterValue = (ord character) + shiftValue
          valuePositionedInAlphabet = ((newCharacterValue - (ord startValue)) `rem` 26) + ord startValue

unCaesar :: Int -> String -> String
unCaesar shiftValue = caesar ( 26 - (shiftValue `mod` 26))


test x stringh = unCaesar x (caesar x string)
