(*Galli Hugo MPSI2*)

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

let rec cn (n: int): arbre =
  let rec is_puissance (x: int) (n: int):float = (*Renvoie 1 si x est une puissance de 2 et 0 sinon*)
    if (n > x) then (0.)
    else if (n = x) then (1.)
    else is_puissance x (2*n)
  in
  let puissance (i: int) :float = (*Renvoie l'expression den exposant de 2 dans la definition de Cn*)
    float_of_int(int_of_float((log (float_of_int i))/.(log 2.))) -. (is_puissance i 1)
  in
  let rec iter_concat (l: arbre list) (a: arbre) :arbre list =
    match l with
    | [] -> []
    | hd::tl -> (concatene hd a) ::(iter_concat tl a)
  in
  let concatene (b1: arbre) (b2: arbre): arbre =
    match b1, b2 with
    | Noeud (x1, l1), Noeud (x2, l2) -> if (x1 = x2 - int_of_float (2. ** (puissance x2))) then Noeud (x1, b2::l1) else (Noeud(x1, iter_concat l1 b2)) (*Si la concatenation a echoue precedemment, alors la racine de b2 est dans un des fils de b1. On cherche donc en utilisant iter_concat*)
  in
  if(n = 1) then (Noeud(1, []))
  else concatene (cn (n-1)) (Noeud(n, []));;

let rec profondeur (t: arbre): int =
  let rec max_l (l: arbre list): int =
    match l with
    | [] -> 0 (* superflu *)
    | hd::tl -> max (profondeur hd) (max_l tl)
  in
  match t with
  | Noeud (x, []) -> 0
  | Noeud (x, l) -> 1 + max_l l

let rec noeud_externe_max (t: arbre): arbre =
  let rec aux (l: arbre list) (n: int) =
    let rec aux2 (t: arbre) (n: int): (int * arbre) = (* renvoie un couple (profondeur, Noeud_externe_max) pour ensuite comparer le plus profond de chaque branche *)
      match t with
      | Noeud(x, []) -> (n, t)
      | Noeud(x, l) -> aux l (n+1)
    in
    match l with
    | [] -> failwith "liste vide"
    | [x] -> aux2 x n
    | hd::tl -> 
      let p1, n1 = aux2 hd n in
      let p2, n2 = aux tl (n+1) in
      if(p1 >= p2) then (p1, n1)
      else (p2, n2)
  in
  match t with
  | Noeud(x, []) -> t
  | Noeud(x, l) ->
    let p, n = aux l 1 in
    n;;

let chemin (t: arbre) (s: int): liste =
  let rec aux (l: arbre list) = (*Prend en entree la liste des noeuds d'un arbre et cherche un chemin valable dans chacun d'eux. Pour cela, la fonction utilise une fonction aux2 qui reproduit le meme schema dans un arbre : les fonctions s'appellent mutuellement. Les appels cessent lorsque 1) Le noeud traite est le noeud s : Dans ce cas la fonction renvoie un couple (true,valeur) permettant de construire recursivement une liste 2) Le noeud traite ne possede pas de fils. Dans ce cas, on renvoie (true,valeur) si le noeud est le noeud s cherche, sinon on renvoie (false, valeur) pour terminer recursivement l'appel en signifiant que la fonction doit continuer car le chemin vers s n'est pas trouve.*)
    let rec aux2 (t: arbre): (bool * liste) =
      match t with
      | Noeud(x, []) -> if(x = s) then (true, [x]) else (false, [x])
      | Noeud(x, l) ->
        if(x = s) then (true, [x])
        else (
          let p,h = aux l in
          if p then (p, x::h) else (p, h)
        )
    in
    match l with
    | [] -> failwith "liste vide"
    | [x] -> aux2 x
    | hd::tl -> 
      let p1,h1 = aux2 hd in
      if(p1) then (p1, h1)
      else let p2,h2 = aux tl in (p2, h2)
  in
  match t with
  | Noeud(x, []) ->[x]
  | Noeud(x, l) -> let p, h = aux l in h;;

let diametre (t: arbre): int =
  let r1 = noeud_externe_max t in
  let tp = pivot t r1 in
  profondeur tp;;