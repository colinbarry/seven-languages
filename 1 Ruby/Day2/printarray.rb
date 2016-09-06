# Print the contents of an array of sixteen number, four numbers at a time, using just each. 
a = (1..16).to_a

b = []
a.each do |x|
    b.push x 
    if b.length == 4 
        p b
        b = [] 
    end
end

# Now do the same with each_slice in Enumerable.
a.each_slice(4) {|x| p x}