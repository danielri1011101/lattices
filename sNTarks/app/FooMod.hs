module FooMod
    ( fooFun
    , gooFun
    , mooFun
    ) where

fooFun= zipWith (+)
gooFun= zipWith (*)
mooFun= zipWith (\x y -> (x+y)^2)
