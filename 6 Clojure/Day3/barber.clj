(def num-seats 3)

(def barber (agent 0))
(def seated-customers (ref 0))

(defn cut-hair [num-cuts]
    (dosync (alter seated-customers dec))
    (Thread/sleep 20)  
    (inc num-cuts)
)

(defn customer-enters []
    (dosync (if (< @seated-customers num-seats)
        (do (alter seated-customers inc)))
                
    (dosync (if (> @seated-customers 0)
        (send barber cut-hair))))

(defn shop-loop [length]
    (let [start (System/currentTimeMillis)]
        (loop []
            (if (< (System/currentTimeMillis) (+ start length))
                (do (Thread/sleep (+ (rand 20) 10))
                    (customer-enters)
                    (recur))))))
                    
(defn main []
    (shop-loop 10000)
    @barber
)
