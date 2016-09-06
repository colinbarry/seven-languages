-- Write a function that takes a list and returns the same list in reverse.

module Main where

rev :: [a] -> [a]
rev [] = []
rev [x] = [x]
rev (h:t) = rev t ++ [h]