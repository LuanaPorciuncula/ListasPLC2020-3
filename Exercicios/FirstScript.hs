{- #########################################################

        FirstScript.hs
        Simon Thompson, August 2010.

######################################################### -}

module FirstScript where

--      The value size is an integer (Integer), defined to be 
--      the sum of twelve and thirteen.

size :: Integer
size = 12+13

--      The function to square an integer.

square :: Integer -> Integer
square n = n*n

--      The function to double an integer.
        
double :: Integer -> Integer
double n = 2*n

-- a funcao deve dobrar o valor da entrada e calcular o quadrado deste

doubleSquared :: Integer -> Integer
doubleSquared n = square(double n)

-- a funcao deve calcular o quadrado do valore da entrada e dobrar este valor

squareDoubled :: Integer -> Integer
squareDoubled n = double(square n)

--      An example using double, square and size.
         
example :: Integer
example = double (size - square (2+2))


