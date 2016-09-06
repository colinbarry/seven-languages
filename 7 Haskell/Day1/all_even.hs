-- How many different way can you find to write allEven.

module Main where

allEven :: (Integral a) => [a] -> Bool
allEven [] = True
allEven (h:t) = if even h then allEven t else False

allEven2 :: (Integral a) => [a] -> Bool
allEven2 a = length (filter odd a) == 0