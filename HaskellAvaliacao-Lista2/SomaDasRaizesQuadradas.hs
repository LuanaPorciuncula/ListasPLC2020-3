module SomaDasRaizesQuadradas where

somaSqrt :: [Float] -> Float
somaSqrt list = foldr (+) 0 (map sqrt (filter isPositive list))
 where isPositive n = (n > 0)