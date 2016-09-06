(defprotocol Point
    (translate [c, x, y]),
    (x [c])
    (y [c])
)

(defrecord PointImpl [x, y]
    Point
    (translate [_, tx, ty] (PointImpl. (+ tx x) (+ ty y)))
    (x [_] x)
    (y [_] y)
    Object (toString [_] (str "(" x ", " y ")"))
)
