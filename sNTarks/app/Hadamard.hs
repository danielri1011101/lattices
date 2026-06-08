----------------------------------------------------
-- | Hadamard method for maxnorm bound checking | --
----------------------------------------------------

module Hadamard (hadBndCheck) where

import qualified Data.Vector.Unboxed as V

import LAUtils

-- | If @ZVec strictly satisfies norm bound @Int
hadBndCheck :: ZVec -> Int -> Bool
hadBndCheck v b=
    0 == (sum (lsVec exhaust))
  where
    exhaust= foldl hadProd v shifts
    hadProd= V.zipWith (*)
    shifts= [v `vAdd` as | as <- rays]
    beta= b-1
    rays=
        let n= length $ lsVec v
        in map vec [take n $ repeat a | a <- [(-beta)..beta]]
