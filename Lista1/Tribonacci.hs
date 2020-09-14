module Tribonacci where

tribonacci :: Integer -> Integer
tribonacci 1 = 1
tribonacci 2 = 1
tribonacci n = tribonacci' 1 1 2 (n-2)

tribonacci' :: Integer -> Integer -> Integer -> Integer -> Integer
tribonacci' a b c 1 = c
tribonacci' a b c n = tribonacci' b c (a+b+c) (n-1) 