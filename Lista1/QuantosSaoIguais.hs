module QuantosSaoIguais where

howManyEqual :: Integer -> Integer -> Integer -> Integer
howManyEqual m n p
 | (m==n)&&(n==p) = 3
 | (m==n)||(n==p)||(m==p) = 2
 | otherwise = 0