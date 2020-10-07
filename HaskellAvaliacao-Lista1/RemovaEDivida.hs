module RemovaEDivida where

remDiv :: Int -> [a] -> ([a],[a])
remDiv x list = (take (x-1) list, drop x list)