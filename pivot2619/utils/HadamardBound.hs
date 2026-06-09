----------------------------------------------------
-- | Hadamard method for maxnorm bound checking | --
----------------------------------------------------

import qualified Data.Vector.Unboxed as V

type ZVec= V.Vector Int

vec :: [Int] -> ZVec
vec= V.fromList
