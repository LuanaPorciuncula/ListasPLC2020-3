module MaximoEntreOs4 where

maxFour :: Integer -> Integer -> Integer -> Integer -> Integer
maxFour m n p q = maxThree (maxThree m n p) p q

maxFour' :: Integer -> Integer -> Integer -> Integer -> Integer
maxFour' m n p q = max (max m n) (max p q)

maxFour'' :: Integer -> Integer -> Integer -> Integer -> Integer
maxFour'' m n p q = max m (maxThree n p q)

maxThree :: Integer -> Integer -> Integer -> Integer
maxThree m n p = max (max m n) p
