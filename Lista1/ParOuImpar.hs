module ParOuImpar where

ehPar :: Integer -> Bool
ehPar n
 | mod n 2 == 0 = True
 | otherwise = False

parImpar :: Integer -> String
parImpar n
 | ehPar n == True = "par"
 | otherwise = "impar"
