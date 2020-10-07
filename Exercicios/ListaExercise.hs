module ListaExercise where

import Data.Char

paraMaiuscula :: String -> String
paraMaiuscula str = [toUpper char | char <- str]

paraMaiusculaAlpha :: String -> String
paraMaiusculaAlpha str = [toUpper char | char <- str, isAlpha char]

divisores :: Integer -> [Integer]
divisores n
 | n <= 0    = []
 | otherwise = [d | d <- [1..n], mod n d == 0]

ehPrimo :: Integer -> Bool
ehPrimo n = length(divisores n) == 2

menorLista :: [Integer] -> Integer
menorLista [l] = l
menorLista (l:ista)
 | l < menorLista ista = l
 | otherwise           = menorLista ista

measure :: [a] -> Int
measure []    = -1
measure lista = length(lista) + 0

takeFinal :: Int -> [a] -> [a]
takeFinal n lista = drop (length lista - n) lista
{-takeFinal 0 _ = []
takeFinal n (l:ista)
 | length(l:ista) == n = (l:ista)
 | otherwise           = takeFinal n ista-}

removeN :: Integer -> [a] -> [a]
removeN 0 (l:ista) = ista
removeN n (l:ista) = (l:removeN (n-1) ista)

primeiroMaisUm :: [Integer] -> Integer
primeiroMaisUm [] = 0
primeiroMaisUm (l:ista) = l+1

primeiroMaisUm' :: [Integer] -> Integer
primeiroMaisUm' lista 
 | null lista = 0
 | otherwise = head lista + 1

somaDoisPrimeiros :: [Integer] -> Integer
somaDoisPrimeiros [] = 0
somaDoisPrimeiros [n] = n
somaDoisPrimeiros (l:(i:sta)) = l + i

somaDoisPrimeiros' :: [Integer] -> Integer
somaDoisPrimeiros' lista
 | null lista         = 0
 | length(lista) == 1 = head lista
 | otherwise          = head lista + head (tail lista)

produto :: [Integer] -> Integer
produto []       = 0
produto [n]      = n
produto (l:ista) = l * produto ista

unique :: [Integer] -> [Integer]
unique [] = []
unique (l:ista) 
 | elem l ista = unique [n | n <- (l:ista), not (n==l)]
 | otherwise = (l:unique ista)

ehCrescente :: [Integer] -> Bool
ehCrescente [n] = True
ehCrescente (l:(i:sta))
 | l <= i             = ehCrescente (i:sta)
 | otherwise          = False 
