module QuantasDivisoesExatas where

numDiv :: Integral a => a -> a -> a
numDiv x y
 | (mod x y) == 0 = 1 + numDiv (div x y) y
 | otherwise      = 0 