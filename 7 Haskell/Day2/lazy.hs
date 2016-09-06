-- Write a function that takes an argument x and returns a lazy sequence that has every third number, starting with
-- x. Then, write a function that includes every fifth number, beginning with y. Combine these functions through
-- composition to return every eighth number, beginning with x + y.

module Main where

third x = x:third (x + 3)
fifth y = y:fifth (y + 5)
eighth x y = zipWith (+) (third x) (fifth y)