(*6.4.5 - Exemple 3*)

let minimal_l (a: int array array): int =
  let n = Array.length a in
  let p = Array.length a.(0) in
  let rec loop (x: int) (y: int) :int =
    if(x = n-1 || y = p-1) then (a.(x).(y))
    else (a.(x).(y) + (if (loop (x+1) y) < loop x (y+1) then (loop (x+1) y) else (loop x (y+1))))
  in
  loop 1 1;;

let minimal_l_c (a: int array array): (int*int) array * int =
  let n = Array.length a in
  let p = Array.length a.(0) in
  let chemin = Array.make (2*(max n p) + 1) (0,0) in
  let rec loop (x: int) (y: int) (k: int) :int =
    if(*(x = n-2 && y = p-1) || (x = n-1 && y = p-2)*)(x = n - 1 && y = p - 1) then (a.(x).(y))
    else if(x = n-1) then ((chemin.(k) <- (x,y+1)); loop x (y+1) (k+1))
    else if(y = p-1) then ((chemin.(k) <- (x+1,y)); loop (x+1) y (k+1))
    else (a.(x).(y) + (if (loop (x+1) y (k+1)) < loop x (y+1) (k+1) then ((chemin.(k) <- (x+1,y)); loop (x+1) y (k+1)) else ((chemin.(k) <- (x,y+1)); loop x (y+1) (k+1))))
  in
  (chemin,loop 0 0 1);;

