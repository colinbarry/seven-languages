-- Write a Haskell function to convert a string to a number.

module Main where

import Data.Char (isDigit)           

toNumber str = read num :: Double
    where num = filter (\x -> isDigit x || x == '.') str
    