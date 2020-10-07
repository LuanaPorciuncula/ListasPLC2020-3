module ClassesExercise where

findDifference :: [a] -> [a] -> Maybe String
findDifference [] [] = Nothing
findDifference list1 list2
 | length list1 /= length list2 = Just (show (length list1) ++ " /= " ++ show (length list2))
 | head list1 /= head list2     = Just (show (head list1) ++ " /= " ++ show (head list2))
 | otherwise                    = findDifference (tail list1) (tail list2)
