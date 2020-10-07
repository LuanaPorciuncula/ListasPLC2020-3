module FuncaoDeExponenciacao where

expNE :: Float -> Int -> Float
expNE x 0 = 1
expNE x y = x*(expNE x (y-1))