module Main where

-- Break a long string into individual lines at proper word boundaries.
appendWords line words columns =
    case words of [] -> (line, [])
                  (x:xs) -> let line' = case line of "" -> x
                                                     _ -> line ++ " " ++ x
                            in if (length line') < columns || (length line == 0) then
                                appendWords line' xs columns
                            else
                                (line, words)
                            
genLines lines words columns = 
    case words of [] -> lines
                  _ ->  let (line, words') = appendWords "" words columns 
                        in genLines (lines ++ [line]) words' columns
 
breakString str columns = genLines [] (words str) columns


-- Add line numbers to the previous exercise.
enumerateLines str columns = zipWith (\a b -> (show a::String) ++ " " ++ b) [1..] (breakString str columns)

-- To the above exercise, add functions to left, right, and fully justify the text with spaces, (making both margins
-- straight.)
leftJustify str columns = 
    let lines = breakString str columns 
        in map (\s -> s ++ (take (columns - (length s)) (repeat ' '))) lines
     
rightJustify str columns = 
    let lines = breakString str columns 
        in map (\s -> (take (columns - (length s)) (repeat ' ')) ++ s) lines
    
-- How many characters are needed per space in order to distribute the characters evenly across the spaces.
spaces i numSpaces numCharacters =
    let pivot = mod numCharacters numSpaces
    in if i >= numSpaces then 0
       else if i >= pivot then div numCharacters numSpaces
       else (div numCharacters numSpaces) + 1
       
-- Justifies a line of text to be exact 'columns' length.
fullyJustifyLine str columns =
    let wds = words str
        gaps = length wds - 1
        charsToInsert = columns - (sum $ map (length) wds) 
    in if gaps == 0 then str
       else foldl (++) "" (zipWith (\x i -> x ++ (take (spaces i gaps charsToInsert) (repeat ' '))) wds [0..])
    
-- Breaks a string into lines and fully justifies each line.
fullyJustifyLines str columns = 
    map (\x -> fullyJustifyLine x columns) (breakString str columns)
