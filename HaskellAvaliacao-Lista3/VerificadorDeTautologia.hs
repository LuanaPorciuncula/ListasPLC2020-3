module VerificadorDeTautologia where

--a)
data Prop = Const Bool | Var Char | Not (Prop) | And (Prop) (Prop) | Or (Prop) (Prop) | Implies (Prop) (Prop) | Iff (Prop) (Prop) 
  deriving (Eq,Show,Read)

--b)
type Subst = [(Char, Bool)]
