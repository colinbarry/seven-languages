-- Write a sort that takes a list and a function that compares its two arguments and then
-- returns a sorted list.

module Main where          

sortf [] cmp = []
sortf (pivot:t) cmp = (sortf below cmp) ++ [pivot] ++ (sortf above cmp)
    where below = filter (\x -> cmp x pivot == LT) t
          above = filter (\x -> cmp x pivot /= LT) t


-- Example comparison function for sortf
descending :: (Ord a) => a -> a -> Ordering  
descending a b  
    | a < b     = GT  
    | a == b    = EQ  
    | otherwise = LT  