module ElevadoA where

potencia :: Integer -> Integer -> Integer
potencia n k 
 | k == 1 = n
 | otherwise = n * potencia n (k-1)