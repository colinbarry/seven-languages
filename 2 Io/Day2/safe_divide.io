# How would you change / to return 0 if the denominator is 0.

standardNumberDiv := Number getSlot("/")
Number / := method(rhs, if(rhs == 0, 0, self standardNumberDiv(rhs)))

(8 / 2) println
(8 / 0) println