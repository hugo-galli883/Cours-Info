type 'a abr =
  | V
  | N of 'a abr * 'a * 'a abr

(* Fonctions élémentaires *)

let rec insere (t: 'a abr) (x: 'a): 'a abr =
  match t with
  | N (l,y,r) -> if (x > y) then (N(l,y,insere r x)) else (N(insere l x,y,r))
  | V -> N(V,x,V)

let rec appartient (t: 'a abr) (x: 'a): bool =
  match t with
  | V -> false
  | N(l,y,r) -> (x = y) || (appartient (if x < y then l else r) x)

let rec cardinal (t: 'a abr): int =
  match t with
  | V -> 0
  | N (l, x, r) -> 1 + (cardinal l) + (cardinal r)

let rec construit (l: 'a list): 'a abr =
  match l with
  | [] -> V
  | hd::tl -> insere (construit tl) hd

let rec elements (t: 'a abr): 'a list =
  match t with
  | V -> []
  | N(l, x, r) -> (elements l) @ [x] @ (elements r)

let rec extrait_min (t: 'a abr): 'a * 'a abr =
  match t with
  | V -> failwith "extrait_min : arbre vide"
  | N(V, x, r) -> (x,r)
  | N(l, x, r) -> let y, tp = (extrait_min l) in (y,N(tp,x,r))

let rec supprime (t: 'a abr) (x: 'a): 'a abr =
  match t with
  | V -> V
  | N(l, y, r) ->
    if x = y then (construit ((elements l) @ (elements r)))
    else if x < y then (N(supprime l x, y, r))
    else (N(l, y, supprime r x))

(* Fonctions supplémentaires *)

let separe (t: 'a abr) (x: 'a): ('a abr * 'a abr) =
  let rec gauche (t: 'a abr) (x: 'a): 'a abr =
    match t with
    | V -> V
    | N(l, y, r) -> 
      if(y > x) then (gauche l x) else (N(l, y, gauche r x))
  in
  let rec droit (t: 'a abr) (x: 'a): 'a abr =
    match t with
    | V -> V
    | N(l, y, r) ->
      if(y <= x) then (droit r x) else (N(droit l x, y, r))
  in
  (gauche t x, droit t x)

let rec verifie_abr (t: 'a abr): bool =
  match t with
  | N(N(ll, lx, lr),x,N(rl, rx, rr)) -> (lx <= x) && (x <= rx) && (verifie_abr (N(ll, lx, lr))) && (verifie_abr (N(rl, rx, rr)))
  | N(V,x,N(rl, rx, rr)) -> (x < rx) && (verifie_abr (N(rl, rx, rr)))
  | N(N(ll, lx, lr),x,V) -> (lx < x) && (verifie_abr (N(ll, lx, lr)))
  | _ -> true

let tab_elements (t: 'a abr): 'a array =
  let n = cardinal t in
  let p, tp = extrait_min t in
  let a = Array.make n p in
  let rec aux (t: 'a abr) (i: int): 'a array =
    if(t = V) then (a) else (
      let p, tp = extrait_min t in
      a.(i) <- p;
      aux tp (i+1);
    )
  in
  aux t 0

(* Faire 3*)

(* Structure de multi-ensemble ordonné *)

type ('k, 'v) dict =
  | Empty
  | Node of ('k, 'v) dict * 'k * 'v * ('k, 'v) dict

let rec get (d: ('k, 'v) dict) (k: 'k): 'v option =
  match d with
  | Node (dl, key, value, dr) -> 
    if (k = key) then (Some value)
    else if (k < key) then (get dl k)
    else (get dr k)
  | _ -> None

let rec set (d: ('k, 'v) dict) (k: 'k) (v: 'v): ('k, 'v) dict =
  match d with
  | Empty -> Node (Empty, k, v, Empty)
  | Node (dl, key, value, dr) ->
    if(k = key) then (Node (dl, key, v, dr))
    else if (k < key) then (Node(set dl k v, key, value, dr))
    else (Node(dl, key, value, set dr k v))

let rec remove (d: ('k, 'v) dict) (k: 'k): ('k, 'v) dict =
  let rec extrait_min (t: ('k, 'v) dict) =
    match t with
    | Empty -> failwith "extrait_min : arbre vide"
    | Node (Empty, k, v, r) -> ((k,v),r)
    | Node (l, k, v, r) -> let y, tp = (extrait_min l) in (y,Node (tp,k,v,r))
  in
  match d with
  | Empty -> Empty
  | Node (dl, key, value, Empty) ->
    if(k = key) then (dl)
    else if (k > key) then (d)
    else (Node(remove dl k, key, value, Empty))
  | Node (dl, key, value, dr) ->
    if (k = key) then (let (k2, v2), d2 = extrait_min dr in Node(dl, k2, v2, d2))
    else if (k < key) then (Node (remove dl k, key, value, dr))
    else (Node(dl, key, value, remove dr k))

let get_occurences (d: ('a, int) dict) (k: 'a): int =
    match (get d k) with
    | None -> 0
    | Some x -> x

let add_occurence (d: ('a, int) dict) (k: 'a): ('a, int) dict =
  let x = get_occurences d k in
  set d k (x+1)

let rem_occurence (d: ('a, int) dict) (k: 'a): ('a, int) dict =
  let x = get_occurences d k in
  set d k (x-1)

let rec size (d: ('a, int) dict): int = (* Complexite : O(n)*)
  match d with
  | Empty -> 0
  | Node (l, k, v, r) -> v + (size l) + (size r)

(*
  Nous pouvons imaginer une fonction qui parcourerait récursivement l'arbre en alimentant un tableau, et en supprimant au fur et à mesure les éléments trouvés ayant la multiplicité souhaitée. Les éléments seraient trouvées par une technique de "brute-force"

Complexité : O(n³)
*)


type 'a multiset =
  | Empty
  | Node of int * 'a multiset * 'a * int * 'a multiset

let get_occurences (m: 'a multiset) (k: 'a): int =
  