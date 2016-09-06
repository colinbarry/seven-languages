(defn credit [ref, amount]
    (dosync (alter ref + amount)))
        
(defn debit [ref, amount]
    (dosync (alter ref - amount)))
        
(def accounts (repeat 10 (ref 0)))
