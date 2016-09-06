(defn collection-type [c]
    (if (list? c) :list
     (if (vector? c) :vector
      (if (map? c) :map
       :unknown))))
