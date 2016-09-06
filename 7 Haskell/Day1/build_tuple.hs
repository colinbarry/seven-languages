-- Write a function that builds two-tuples with all possible combinations of two of the colours black,
-- white, blue, yellow, and red.

module Main where

buildTuple = [(x, y) | x <- colours, y <- colours, x < y]
    where colours = ["black", "white", "blue", "yellow", "red"]