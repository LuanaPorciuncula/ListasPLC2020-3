module OQuadruplo where

dobro :: Integer -> Integer
dobro n = n * 2

quadruplo :: Integer -> Integer
quadruplo n = dobro(dobro n)