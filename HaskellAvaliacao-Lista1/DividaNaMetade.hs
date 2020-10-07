module DividaNaMetade where

halve :: [a] -> ([a],[a])
halve list = (oddEvenIndex 0 list, oddEvenIndex 1 list)

oddEvenIndex :: Int -> [a] -> [a]
oddEvenIndex _ []   = []
oddEvenIndex 0 list = (head list):oddEvenIndex 0 (drop 2 list)
oddEvenIndex 1 list = oddEvenIndex 0 (tail list)