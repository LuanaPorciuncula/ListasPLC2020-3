module VerificadorDeTautologia where

--a)
data Prop = Const Bool | Var Char | Not (Prop) | And (Prop) (Prop) | Or (Prop) (Prop) | Implies (Prop) (Prop) | Iff (Prop) (Prop) 
  deriving (Eq,Show,Read)

--b)
type Subst = [(Char, Bool)]

--c)
eval :: Subst -> Prop -> Bool
eval sub (Const value)         = value
eval sub (Var x)               = getSubst x sub
eval sub (Not prop)            = not (eval sub prop)
eval sub (And prop1 prop2)     = (eval sub prop1) && (eval sub prop2)
eval sub (Or prop1 prop2)      = (eval sub prop1) || (eval sub prop2)
eval sub (Implies prop1 prop2) = ((eval sub prop1) == False) || ((eval sub prop2) == True)
eval sub (Iff prop1 prop2)     = ((eval sub prop1) == (eval sub prop2))

getSubst :: Char -> Subst -> Bool
getSubst x sub = snd ((filter correctVar sub)!!0)
  where correctVar s = (fst s == x)

--d)
vars :: Prop -> [Char]
vars (Var x)               = [x]
vars (Const _ )            = []
vars (Not prop)            = vars prop
vars (And prop1 prop2)     = vars prop1 ++ vars prop2
vars (Or prop1 prop2)      = vars prop1 ++ vars prop2
vars (Implies prop1 prop2) = vars prop1 ++ vars prop2
vars (Iff prop1 prop2)     = vars prop1 ++ vars prop2

--e)
bools :: Int -> [[Bool]]
bools n = bools' (2^n -1) n

bools' :: Int -> Int -> [[Bool]]
bools' 0 n = [(toBinary 0 n)]
bools' i n = (toBinary i n):(bools' (i-1) n)

toBinary :: Int -> Int -> [Bool]
toBinary n bsize 
 | (bsize == 1) && (mod n 2 == 1) = [True]
 | (bsize == 1) && (mod n 2 == 0) = [False]
 | mod n 2 == 1                   = True:(toBinary (div n 2) (bsize - 1))
 | otherwise                      = False:(toBinary (div n 2) (bsize - 1))