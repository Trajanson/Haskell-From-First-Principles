module PityTheBool where

import Data.Int

-- Cardinality: 4
data BigSmall = Big   Bool
              | Small Bool
              deriving (Eq, Show)



-- Cardinality: 256 * 2 = 512
data NumberOrBool = Numba Int8
                  | BoolyBool Bool
                  deriving (Eq, Show)
