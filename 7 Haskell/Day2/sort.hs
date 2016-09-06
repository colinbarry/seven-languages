-- Write a function that takes a list and returns a sorted list.

module Main where

sort [] = []
sort (pivot:t) = (sort below) ++ [pivot] ++ (sort above)
    where below = filter (< pivot) t
          above = filter (>= pivot) t