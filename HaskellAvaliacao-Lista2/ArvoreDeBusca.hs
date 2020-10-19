module ArvoreDeBusca where

data Tree t = Node t (Tree t) (Tree t) | Empty
  deriving  (Show, Read) 

-- a)
buildSearchTree :: [Int] -> Tree Int
buildSearchTree list
 | null list        = Empty
 | null (tail list) = Node (head list) Empty Empty
 | otherwise        = Node (head list) (buildSearchTree [x | x <- (tail list), x < (head list)]) (buildSearchTree [x | x <- (tail list), x >= (head list)])

-- b)
searchTreeSort :: [Int] -> [Int]
searchTreeSort list = (treeSort . buildSearchTree) list

treeSort :: Tree Int -> [Int]
treeSort Empty = []
treeSort (Node n Empty Empty) = [n]
treeSort (Node n tree1 tree2) = treeSort tree1 ++ [n] ++ treeSort tree2

 