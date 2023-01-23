let rec calc (f : 'a -> 'a) n a =
    if n = 0 then a
    else f (calc (f) (n-1) (a));;

let rec calc (f : 'a -> 'a -> 'a) n a b =
    if n = 0 then a
    else if n = 1 then b
    else f (calc (f) (n-1) a b) (calc (f) (n-2) a b);;