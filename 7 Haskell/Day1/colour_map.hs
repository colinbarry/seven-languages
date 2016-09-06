-- Solve the map-colouring problem.

module Main where

colourMap = [(alabama, mississippi, georgia, tennessee, florida) | 
             alabama <- colours, 
             mississippi <- colours,
             georgia <- colours,
             tennessee <- colours,
             florida <- colours,
             mississippi /= tennessee,
             mississippi /= alabama,
             alabama /= tennessee,
             alabama /= georgia,
             alabama /= florida,
             georgia /= florida,
             georgia /= tennessee]
    where colours = ["red", "green", "blue"]