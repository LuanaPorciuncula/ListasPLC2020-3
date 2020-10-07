module FirstExercise where
{- threeDifferent :: Integer -> Integer -> Integer -> Bool
O resultado é verdadeiro apenas se os todos os tres valores
forem diferentes
Qual é a resposta para "threeDifferent 3 4 3" ?-}

 threeDifferent :: Integer -> Integer -> Integer -> Bool 
 threeDifferent m n p = not (m==n) && not (n==p) && not (m==p)

{- 3.10 Sobre a função

fourEqual :: Integer -> Integer -> Integer -> Integer -> Bool

que retorna o valor True apenas se todos os quatro argumentos
forem iguais

Dê uma definição de "fourEqual" modelada sobre a definição
de "threeDifferent". Agora, dê uma definição de "fourEqual"
que usa a função "threeDifferent" na sua definição. -}

 fourEqual :: Integer -> Integer -> Integer -> Integer -> Bool 
 fourEqual m n p q = (m==n) && (n==p) && (p==q)

 fourEqualD :: Integer -> Integer -> Integer -> Integer -> Bool 
 fourEqualD m n p q =  not (threeDifferent m n p) && (m==n) && (n==p) && (p==q)

 threeEqual :: Int -> Int -> Int -> Bool 
 threeEqual m n p = (m==n) && (n==p)

 mystery :: Int -> Int -> Int -> Bool
 mystery m n p = not ((m==n) && (n==p)) 





 maxThree :: Int -> Int -> Int -> Int
 maxThree m n p = max (max m n) p

 minThree :: Int -> Int -> Int -> Int
 minThree m n p = min (min m n) p
 
 charToNum :: Char -> Int
 charToNum n
  | fromEnum n >= 48 && fromEnum n <= 57 = fromEnum n - 48
  | otherwise = 0

 averageThree :: Int -> Int -> Int -> Float
 averageThree m n p = ((fromIntegral m) + (fromIntegral n) + (fromIntegral p))/3

 {- howManyAboveAverage :: Int -> Int -> Int -> Int
 howManyAboveAverage m n p 
  let av = averageThree m n p
  let count = 0
  if av < m then count = count + 1 else count = count
  if av < n then count = count + 1 else count = count
  if av < p then count = count + 1 else count = count
  = count

 howManyAboveAverage :: Int -> Int -> Int -> Int
 howManyAboveAverage m n p 
  let av = averageThree m n p
  let count = 0
  | av < m = count : count + 1
  | otherwise = count: count -}