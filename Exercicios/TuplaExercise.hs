module TuplaExercise where

maxThree :: Integer -> Integer -> Integer -> Integer
maxThree a b c = max (max a b) c

minThree :: Integer -> Integer -> Integer -> Integer
minThree a b c = min (min a b) c

menorMaior :: Integer -> Integer -> Integer -> (Integer, Integer)
menorMaior a b c = (minThree a b c, maxThree a b c)

ordenaTripla :: (Integer, Integer, Integer) -> (Integer, Integer, Integer)
ordenaTripla (a, b, c)
 | (a >= min b c) && (a <= max b c) = (minThree a b c, a, maxThree a b c)
 | (b >= min a c) && (b <= max a c) = (minThree a b c, b, maxThree a b c)
 | otherwise                        = (minThree a b c, c, maxThree a b c)

type Ponto = ( Float , Float )
type Reta = (Ponto , Ponto )

primeiraCoord :: Ponto -> Float
primeiraCoord (x, y) = x
--fst (x, y)

segundaCoord :: Ponto -> Float
segundaCoord (x, y) = y
--snd (x, y)

ehVertical :: Reta -> Bool
ehVertical (p1, p2) = primeiraCoord p1 == primeiraCoord p2

pontoY :: Float -> Reta -> Float
pontoY x (p1, p2) = segundaCoord p1 + (x - primeiraCoord p1)*(segundaCoord p2 - segundaCoord p1)/(primeiraCoord p2 - primeiraCoord p1)