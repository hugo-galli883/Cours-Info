(*Ex 10*)
type ('k, 'v) dict =
  | Vide
  | Noeud of 'k * 'v * ('k, 'v) dict * ('k, 'v) dict

let rec get (key: 'k) (dico: ('k, 'v) dict): 'v option =
  match dico with
  | Noeud (k, v, Vide, Vide) -> if(k = key) then Some v else None
  | Noeud (k, v, g, d) ->
    if(k = key) then Some v
    else if(k < key) then get key d
    else get key g
  | _ -> None

let rec set (key: 'k) (value: 'v) (dico: ('k, 'v) dict): ('k, 'v) dict =
  match dico with
  | Noeud (k, v, g, d) -> if (key < k) then (Noeud (k, v, set k v g, d))else (Noeud (k, v, g, set k v d))
  | Vide -> Noeud(key, value, Vide, Vide) 

(*Arbress rouge/noir*)
type color = R | B

type 'a rbt =
  | E
  | N of color * 'a * 'a rbt * 'a rbt

let rbt_isRbt (t: 'a rbt): bool =
  let rec color (t: 'a rbt): bool =
    match t with
    | N(c, x, tg, td) ->
      if(c = B) then (color tg && color td)
      else (
        match tg, td with
        | N(c1, x1, tg1, td1) , N(c2, x2, tg2, td2) -> ((c1 != R) || (c2 != R)) && (color tg && color td)
        | N(c1, x1, tg1, td1), E -> (c1 != R) && (color tg)
        | E, N(c2, x2, tg2, td2) -> (c2 != R) && (color td)
        | E, E -> true
      )
    | E -> true
  in
  let rec count (t: 'a rbt) (x: int): (bool * int) =
    match t with
    | N(c, x, tg, td) ->
      if(c = B) then (
        let b1, p1 = count tg (x+1) in
        let b2, p2 = count td (x+1) in
        if(b1 && b2 && (p1 = p2)) then (true, p1 + 1)
        else (false, 0)
      ) else (
        let b1, p1 = count tg x in
        let b2, p2 = count td x in
        if(b1 && b2 && (p1 = p2)) then (true, p1)
        else (false, 0)
      )
    | E -> (true, 0)
  in
  let b, p = count t 0 in
  (color t) && b;;
