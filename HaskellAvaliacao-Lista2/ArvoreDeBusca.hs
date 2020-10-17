module ArvoreDeBusca where

data Tree t = Node t (Tree t) (Tree t) | Empty
  deriving  (Show, Read) 

-- a)
buildSearchTree :: [Int] -> Tree Int
buildSearchTree list
 | null list        = Empty
 | null (tail list) = Node (head list) Empty Empty
 | otherwise        = Node (head list) (buildSearchTree [x | x <- (tail list), x < (head list)]) (buildSearchTree [x | x <- (tail list), x >= (head list)])


 