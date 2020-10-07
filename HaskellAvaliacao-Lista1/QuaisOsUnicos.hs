module QuaisOsUnicos where

unicos :: [Int] -> [Int]
unicos [] = []
unicos list 
 | elem (head list) (tail list) = unicos [x|x<-(tail list), x /= (head list)]
 | otherwise                    = (head list):(unicos (tail list))
