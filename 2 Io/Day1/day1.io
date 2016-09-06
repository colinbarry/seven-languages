# Evaluate 1 + 1 and then 1 + "one". Is Io strongly typed or weakly typed?
(1 + 1) println

e := try(1 + "one")
e catch(Exception,
    "Strings are not automatically coerced into numbers" println
)


# Is 0 true or false?
(0 and true) println # = true, so 0 is truthy

# What about the empty string
("" and true) println # = true, so "" is truthy

# Is nil true or false?
(nil and true) println # = false, so nil is falsy

# How can you tell what slots a prototype supports?
Animal := Object clone
Animal slotNames println

# What is the difference between =, :=, and ::=

# := Creates a slot and assigns its value
a := 1
a println

# = Assigns a value to an already existing slot and will raise an exception if the slot is absent
a = 2
a println

# ::= Creates a slot, assigns the value, and creates a setter method.
Dog := Animal clone do (
    name ::= nil
)

dog := Dog clone
dog setName("Rover")
dog println

# Run an io program from a file with: io day1.io

# Execute the code in a slot given its name.
func := method("Hello, world" println)

callByName := method(name, self getSlot(name) call)
callByName("func")
