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

-- c)
soma :: Nat -> Nat -> Nat
soma nat1 nat2 = int2Nat (nat2Int nat1 + nat2Int nat2)