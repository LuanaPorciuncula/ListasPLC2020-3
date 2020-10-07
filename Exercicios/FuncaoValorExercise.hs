module FuncaoValorExercise where
import Data.List
import Data.Char

mmax :: (a -> Int) -> a -> a -> a
mmax funct x y
 | max (funct x) (funct y) == (funct x) = x
 | otherwise                = y

countSorted ::  [String] -> Int
countSorted strList = length (filter isSorted (lines ((map toUpper . intercalate "\n") strList)))
    where isSorted strList1 = strList1 == sort strList1 

mStr :: [String] -> String
mStr strList = (map toUpper . intercalate " ") (filter isGreaterThen5 strList)
    where isGreaterThen5 strList1 = length strList1 > 5 

powers :: Integer -> Integer -> [Integer]
powers k m = takeWhile (< m) [k^p | p <- [0,1..m]]

sumOf :: [Integer] -> [Integer]
sumOf [] = []
sumOf [n] = [n]
sumOf list = (head list):(sumOf ((head list + (head . tail) list):(drop 2 list)))

extremesEqual :: String -> Bool
extremesEqual str = head str == str!!(length str - 1)

squares :: Int -> [Integer]
squares n = take n [x*x | x <- [1..], extremesEqual (show (x*x))]