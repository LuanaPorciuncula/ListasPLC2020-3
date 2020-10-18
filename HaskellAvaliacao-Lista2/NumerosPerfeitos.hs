module NumerosPerfeitos where

perfeitos :: Integer -> [Integer]
perfeitos n = [x | x <- (fatores n), (isPerfect . fromIntegral) x]

fatores :: Integer -> [Integer]
fatores n
 | n <= 0    = []
 | otherwise = reverse [d | d <- [1..n], mod n d == 0]

isPerfect :: Double -> Bool
isPerfect n = floor (sqrt n) == ceiling (sqrt n)