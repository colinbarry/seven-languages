-- Write a function that looks up a hash table value that uses the Maybe monad. Write a hash that stores other hashes,
-- several levels deep.

module Main where

locate key [] = Nothing
locate key ((k, v):xs)
    | key == k = Just v
    | otherwise = lookup key xs
    
-- Some text data.
table = [(1, [(2, [(3, "Alfa")])])]

-- locate 1 table >>= locate 2 >>= locate 3  
-- Just "Alfa" 

-- locate 4 table >>= locate 2 >>= locate 3 
-- Nothing 