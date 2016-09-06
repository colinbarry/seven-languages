-- Write a list comprehension to build a childhood multiplication table.

module Main where

timesTables = [(a, b, a * b) | a <- [1..12], b <- [1..12]]