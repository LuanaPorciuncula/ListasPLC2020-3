module NumerosPerfeitos where

perfeitos :: Integer -> [Integer]
perfeitos n = filter ePerfeito (reverse [1..n])

fatores :: Integer -> Integer -> [Integer]
fatores n d
 | n == 1       = []
 | mod n d == 0 = d:(fatores (div n d) (d))
 | otherwise    = fatores n (d+1)

removeDuplicado :: [Integer] -> [Integer]
removeDuplicado [] = []
removeDuplicado list = (head list): removeDuplicado (filter (/= (head list)) (tail list))

ePerfeito :: Integer -> Bool
ePerfeito 1 = True
ePerfeito n = (sum . removeDuplicado) (map (^2) (fatores n 2)) == n