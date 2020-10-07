module MaximoDivisorComum where

mdc :: Int -> Int -> Int
mdc a b
 | (b == 0) || (a == b) = a
 | otherwise            = mdc b (mod a b)