module SomeAte where

sumTo :: Integer -> Integer
sumTo n
 | n == 1 = 1
 | otherwise = n + sumTo(n-1)