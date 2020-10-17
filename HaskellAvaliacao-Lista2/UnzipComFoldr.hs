module UnzipComFoldr where

unzip' :: [(a,b)] -> ([a],[b])
unzip' list = foldr addFstSnd ([],[]) list

addFstSnd :: (a,b) -> ([a],[b]) -> ([a],[b])
addFstSnd pair (listFst, listSnd) = ((fst pair):listFst,(snd pair):listSnd)