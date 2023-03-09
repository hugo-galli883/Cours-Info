(*3.1*)
let minliste (l :'a list) :'a =
  let rec aux (l :'a list) (x :'a) :'a =
    match l with
    | [x1] -> if x < x1 then x else x1
    | hd::tl -> if x < hd then (aux tl x) else (aux tl hd)
  in
  match l with
  | hd::tl -> aux tl hd
  | _ -> failwith "liste vide";;

let rec fab_list (n :int) (k :int) :int list =
  if n = 0 then [Random.int k] else
  (Random.int k)::(fab_list (n-1) k);;

let rec find (l :'a list) (n :int) :'a =
  match l with
  | hd::tl -> if n = 0 then hd else find tl (n-1)
  | _ -> failwith "Indice supérieur à la taille de la liste";;

let rec insertion (l :'a list) (x :'a) (n :int) :'a list=
  match l with
  | hd::tl -> if n = 0 then x::(hd::tl) else hd::(insertion tl x (n-1))
  | _ -> if (n = 0) then x::[] else failwith "Indice supérieur à la taille de la liste";;

let rec suppress (l :'a list) (x :'a) :'a list =
  match l with
  | hd::tl -> if hd = x then suppress tl x else hd::(suppress tl x)
  | _ -> [];;

let rec antidoublon (l :'a list) :'a list =
  match l with
  | hd::tl -> hd::(antidoublon (suppress tl hd))
  | _ -> [];;

let rec prefixe (l :'a list) :'a list list =
  let rec aux (l :'a list list) (x :'a) :'a list list =
    match l with
    | hd::tl -> (x::hd)::(aux tl x)
    | _ -> []
  in
  match l with
  | hd::tl -> [hd]::(aux (prefixe tl) hd)
  | _ -> [];;

(*3.2*)
let rec applique (f :'a -> 'b) (l :'a list) :'b list =
  match l with
  | hd::tl -> (f hd)::(applique f tl)
  | _ -> [];;

let rec filtrage (f :'a -> bool) (l :'a list) :'a list =
  match l with
  | hd::tl -> if (f hd) then hd::(filtrage f tl) else filtrage f tl
  | _ -> [];;

let filtre (x :int) :bool =
  if (x mod 2 = 0) then true else false;;