module Main where

import HaskellSay

import qualified Data.Vector.Unboxed as V

import LAUtils

import Hadamard

v1 :: ZVec
v1= vec [(-1)..2]

v2 :: ZVec
v2= 2 `vScale` v1

v3= V.map (+1) v2

main :: IO ()
main = do
    haskellSay "Hello, Haskell!"
    let satisfies= v3 `hadBndCheck` 5
    putStrLn $ show satisfies
