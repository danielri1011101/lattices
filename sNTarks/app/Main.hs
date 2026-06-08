module Main where

import HaskellSay

import FooMod

main :: IO ()
main = do
    haskellSay "Hello, Haskell!"
    let zs= fooFun [2..5] [3..6]
    putStrLn $ show zs
