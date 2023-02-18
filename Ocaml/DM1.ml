let rec ajoute (x :'a) (li :'a list list) :'a list list =
  match li with
  | hd::tl -> (x::hd)::(ajoute x tl)
  | _ -> [];;

let parties1 (n :int) :int list list =
  let rec aux (l :'a list list) (i :int) (j :int) :'a list list =
    if j = 0 then l
    else aux ((ajoute i l)@l) (i+1) (j-1)
  in
  aux [[]] 1 n;;

let suivant (l :int list) :int list =
  match l with
  | [] -> []
  | [x] -> if x = 1 then [] else [x-1;x]
  | hd1::hd2::tl -> if hd1 = 1 then (hd2 - 1)::tl else (hd1 - 1)::(hd1::(hd2::tl));;

let parties2 (n :int) :int list list =
  let rec aux (l1 :int list) (l2 :int list list ) =
    let l3 = suivant l1 in
    match l3 with
    | [] -> l1::l2
    | _ -> aux (l3) (l1::l2)
  in
  aux [n] [[]];;

let rec ci (l :int list) (s :int) (i :int) (j :int) (n :int):int =
  let comp (si :int) (sj :int) :int =
    if(sj < si) then 1 else 0
  in
  let rec recup_indice (l :int list) (i :int) (x :int) :int =
    match l with
    | hd::tl -> if hd = x then (i) else (recup_indice tl (i+1) x)
    | _ -> failwith "Aucun indice ne correpond au nombre recherche"
  in
  if(j <= i) then (ci l s i (i+1) n)
  else (
    if(j <= n) then (
    ci l (s + (comp (recup_indice l 1 i) (recup_indice l 1 j))) i (j+1) n
    ) else (s)
  );;

let code (l :int list) (n :int) :int list =
  let rec aux (i :int) (l2 :int list) (l: int list) (n :int) :int list=
    if(i > 0) then (
      aux (i-1) ((ci l 0 i (i+1) n)::l2) l n
    ) else l2
  in
  aux n [] l n;;

let insere (a :'a) (j :int) (l :'a list) :'a list =
  let rec aux (a :'a) (i :int) (j :int) (l :'a list) :'a list=
    match l with
    | [] -> failwith "insere"
    | hd::tl -> 
      if i = j then (hd::(a::tl))
      else (hd::(aux a (i+1) j tl))
  in
  aux a 1 j l;;

let genere (c :int array) :int list =
  let rec gen_l (l :int list) (n :int) (c :int array) :int list=
    if n > 1 then (gen_l (insere n (c.(n-1)) l) (n-1) c)
    else (insere n c.(n-1) l)
  in
  (gen_l [(Array.length c)] ((Array.length c)-1) c);;

let rec factorielle (x :int) :int =
  if x = 0 then 1
  else x * (factorielle (x-1));;

let lehmer (n :int) (p :int) :int array =
  let rec aux (i :int) (l :int array) (p :int) :int array =
    if i = 0 then l
    else (
        if(p / (factorielle i)) < i then (
        l.(i) <- p / (factorielle i);
        (aux (i - 1) l (p - (l.(i) * (factorielle i))));
        ) else (failwith "You should choose a bigger 'n'")
      )
  in
  let l = (Array.make (n+1) 0) in
  (aux n l p);;

let permutations (n :int) :int list list =
  