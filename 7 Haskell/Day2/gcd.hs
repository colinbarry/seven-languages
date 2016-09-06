-- Write a function to determine the greatest common denominator of two integers.

module Main where

gcdi a b
    | a == b = a
    | a > b = gcdi (a - b) b
    | otherwise = gcdi a (b - a)
     