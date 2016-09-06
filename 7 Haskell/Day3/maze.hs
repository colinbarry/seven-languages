-- Represent a maze in Haskell.

module Main where

import Data.List ((\\))
import Control.Monad (guard)

-- A node is a list of neighbouring co-ordinates.
data Node = Exits [(Int, Int)] deriving (Show)

-- A maze is an array of array of nodes.
type Maze = [[Node]]

-- Builds a traversable example maze, solvable with: solve maze (0, 0) (3, 3)
buildMaze :: Maze
buildMaze = 
    [[Exits[(1, 0)], Exits[(0, 0), (1, 1)], Exits[(2, 1), (3, 0)], Exits[(2, 0), (3, 1)]],
     [Exits[(1, 1), (0, 2)], Exits[(1, 0), (0, 1), (2,1)], Exits[(2, 0), (2, 2), (1, 1)], Exits[(3, 0)]],
     [Exits[(0, 1), (0, 3)], Exits[(2, 2)], Exits[(2, 1), (1, 2), (3, 2)], Exits[(2, 2), (3, 3)]],
     [Exits[(0, 2), (1, 3)], Exits[(0, 3), (2, 3)], Exits[(1, 3)], Exits[(3, 2)]]
    ]
    
-- Returns the node at (x, y)
getNode :: Maze -> (Int, Int) -> Node
getNode maze (x, y) = maze !! y !! x

-- Solves a maze, outputting a list of node co-ords, or Nothing is no solution is discovered.
-- Wouldn't have known how to do this without http://blog.wakatta.jp/downloads/code/7l7w/haskell/maze.hs
solve :: Maze -> (Int, Int) -> (Int, Int) -> Maybe [(Int, Int)]
solve maze (x, y) (xt, yt) =
    case nextStep [(x, y)] of
         [] -> Nothing
         (node:_) -> Just node
    where nextStep route = let ((x, y):_) = route in
                                if x == xt && y == yt
                                      then return (reverse route)
                                      else let (Exits exits) = getNode maze (x, y)
                                               moves = exits \\ route -- exclude node already traversed
                                           in do guard (length moves > 0)
                                                 move <- moves
                                                 nextStep (move:route)
