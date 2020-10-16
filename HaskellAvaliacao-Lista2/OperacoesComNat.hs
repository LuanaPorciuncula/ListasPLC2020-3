module OperacoesComNat where

data Nat = Zero | Succ Nat deriving (Eq,Show,Read)

-- a)
int2Nat :: Int -> Nat
int2Nat 0 = Zero
int2Nat n = Succ (int2Nat (n-1))

-- b)
nat2Int :: Nat -> Int
nat2Int Zero = 0
nat2Int (Succ n) = 1 + nat2Int n