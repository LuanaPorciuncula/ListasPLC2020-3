module TiposAlgebricosExercise where

import Data.Either

divisaoSegura :: Integer -> Integer -> Maybe Integer
divisaoSegura x 0 = Nothing
divisaoSegura x y = Just (div x y)

eitherDiv :: Integer -> Integer -> Either String Integer
eitherDiv x 0 = Left $ (show x) ++ "/0"
eitherDiv x y = Right $ div x y

mapMaybe :: (a -> Maybe b) -> [a] -> [b]
mapMaybe _ [] = []
mapMaybe funct list = case (funct (head list)) of
    Nothing -> mapMaybe funct (tail list)
    Just x  -> x:mapMaybe funct (tail list)

classifica :: [Either a b] -> ([a], [b])
--classifica list = partitionEithers list
--classifica list = (lefts list, rights list)
classifica list = (map (\(Left x) -> x) (filter isLeft list), map (\(Right x) -> x) (filter isRight list))

data Tree a = Leaf | Node a (Tree a) (Tree a)
    deriving (Show , Eq)

valAtRoot :: Tree a -> Maybe a 
valAtRoot Leaf = Nothing
valAtRoot (Node root _ _) = Just root

sizeTree :: Tree a -> Integer
sizeTree Leaf = 0
sizeTree (Node root tree1 tree2) = 1 + sizeTree tree1 + sizeTree tree2

leftest :: Tree a -> Maybe a
leftest Leaf = Nothing
leftest (Node root Leaf _) = Just root
leftest (Node root tree1 _) = leftest tree1

mapTree :: (a -> b) -> Tree a -> Tree b
mapTree _ Leaf = Leaf
mapTree funct (Node root tree1 tree2) = (Node (funct root) (mapTree funct tree1) (mapTree funct tree2))

insertL :: a -> Tree a -> Tree a
insertL x Leaf = (Node x Leaf Leaf)
insertL x (Node root tree1 tree2) = (Node root (insertL x tree1) tree2)

medida :: Tree a -> Tree Integer
medida Leaf = Leaf
medida (Node root tree1 tree2) = (Node (sizeTree (Node root tree1 tree2)) (medida tree1) (medida tree2))

foldTree :: (a -> b -> b -> b) -> b -> Tree a -> b
foldTree funct v Leaf = v
foldTree funct v (Node root tree1 tree2) = funct root (foldTree funct v tree1) (foldTree funct v tree2)

sumt :: Int -> Int -> Int -> Int
sumt x y z = x + y + z

treeSum :: Tree Int -> Int
treeSum tree = foldTree sumt 0 tree
