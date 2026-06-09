----------------------------------
-- | Linear Algebra utilities | --
----------------------------------

-- ^ Eventually: Rot, FCoef.

module LAUtils
    ( ZVec
    , vec
    , lsVec
    , vAdd
    , vScale
    ) where

import qualified Data.Vector.Unboxed as V

type ZVec= V.Vector Int

vec :: [Int] -> ZVec
vec= V.fromList

lsVec :: ZVec -> [Int]
lsVec= V.toList

vAdd :: ZVec -> ZVec -> ZVec
vAdd= V.zipWith (+)

vScale :: Int -> ZVec -> ZVec
vScale a = V.map (*a)
