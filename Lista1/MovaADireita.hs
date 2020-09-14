module MovaADireta where

addEspacos :: Int -> String
addEspacos n
 | n == 0 = ""
 | n == 1 = " "
 | otherwise = " " ++ addEspacos (n-1)

paraDireita :: Int -> String -> String
paraDireita n w = addEspacos n ++ w
