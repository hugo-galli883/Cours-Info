type arbre = Noeud of int * arbre list;;
type liste = int list;;

let rec copie (n: int) (t: arbre) : arbre =
  let rec generate_fils (k :int) :arbre list =
    let rec generate_bk (k :int) :arbre =
      if(k = 0) then (Noeud (0,[]))
      else (Noeud (k-1, generate_fils (k-1)))
    in
    if(k > 0) then ((generate_bk k) :: (generate_fils (k-1)))
    else ([])
  in
  let rec iterate (l: arbre list) : 'a list =
    match l with
    | [] -> []
    | hd::tl -> (copie n hd)::(iterate tl)
  in
  match t with
  | Noeud (x, []) -> Noeud (x+1, generate_fils n)
  | Noeud (x , t2) -> Noeud (x+1, iterate t2);;

let rec bin (n: int) :arbre =
  let rec generate_fils (k :int) :arbre list =
    let rec generate_bk (k :int) :arbre =
      if(k = 0) then (Noeud (0,[]))
      else (Noeud (k-1, generate_fils (k-1)))
    in
    if(k > 0) then ((generate_bk k) :: (generate_fils (k-1)))
    else ([])
  in
  Noeud(n, generate_fils(n));