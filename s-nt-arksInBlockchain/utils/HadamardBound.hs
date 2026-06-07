----------------------------------------------------
-- | Hadamard method for maxnorm bound checking | --
----------------------------------------------------

import Data.Array

-- | Make a map-zip array
mkArray :: Ix a => (a -> b) -> (a, a) -> Array a b
mkArray f bds= let (is, fis)= (range bds, map f is)
               in array bds (zip is fis)


---------------------
-- Integer vectors --
---------------------

type ZVec= Array Int Int

-- | Vectorize a list
vec :: [Int] -> ZVec
vec ns= mkArray (f ns) (bds ns)
  where
f= \ns i -> ns !! i
bds= \ns -> (0, length ns - 1)

-- | Listify vector
zvToList :: ZVec -> [Int]
zvToList= elems

-------------------------
-- Hadamard operations --
-------------------------

-- | Multiplication on vectors
hadMult :: ZVec -> ZVec -> ZVec
hadMult xs ys= vec $ (elems xs) `hadMult'` (elems ys)

-- | Check factor

-- | Scaling vectors
scale :: Int -> ZVec -> ZVec
scale a xs= vec $ scale' a (zvToList xs)

-- | Multiplication on lists
hadMult' :: [Int] -> [Int] -> [Int]
hadMult' = zipWith (*)

-- | Scaling lists
scale' :: Int -> [Int] -> [Int]
scale' a ns= map (*a) ns

----------------------------
-- Miscelaneous Utilities --
----------------------------

-- | Check if a list contains only zeros
isZero' :: [Int] -> Bool
isZero'= \ns -> 0 == sum (map abs ns)


