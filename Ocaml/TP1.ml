type 'a file_fonct = 'a list * 'a list
(*1*) 
(*1.1*)
let miroir (l :'a list) :'a list =
  let rec reverse (l1 :'a list) (l2 :'a list) :'a list=
    match l2 with
    | [] -> l1
    | hd :: tl -> reverse (hd :: l1) tl
  in
  reverse [] l;;

let ajoute (a :'a) (file :'a file_fonct) :'a file_fonct =
  match file with
  | (l1 , l2) -> (a::l1 , l2);;

let enleve (file :'a file_fonct) :('a * 'a file_fonct) =
  match file with
  | ([],[]) -> failwith "file vide"
  | (l1 , []) ->
    begin
      let r_file = miroir l1 in
      match r_file with
      | hd::tl -> (hd,([],tl))
    end
  | (l1 , hd::tl) -> (hd,(l1,tl));;

(*1.2*)
let somme (f1 :int file_fonct) :int =
  let rec add (f :int file_fonct) (s :int) :int =
    match f with
    | ([], []) -> s
    | _ -> 
      begin
        let a,b = enleve f in
        add b s+a
      end
  in
  add f1 0;;

let file_fonct_of_list (l :'a list) :'a file_fonct =
  let file_vide = ([],[]) in
  let rec aux f1 l =
    match l with
    | [] -> f1
    | hd::tl -> aux (ajoute hd f1) tl
  in
  aux file_vide l;;

let file_fonct_of_list2 (l :'a list) :'a file_fonct =
  ([], miroir l);;

let afficher f =
  let rec aux f =
    let a,b = enleve f in
    print_int a;
    print_newline ();
    aux b
  in
  aux f;;

(*Ex1.3*)

(*2*)
(*2.1*)
type 'a pile = {donnees : 'a option array ; mutable courant : int}
let capacite p = Array.length p.donnees

let nouvelle_pile (n :int) :'a pile =
  let a = Array.make n None in
  {donnees = a ; courant = -1};;

let pop (pile :'a pile) :'a option =
  if pile.courant = -1 then
    None
  else 
    begin
    pile.courant <- pile.courant - 1;
    pile.donnees.(pile.courant +1)
    end;;

let push a pile =
  pile.donnees.(pile.courant + 1) <- Some a;
  pile.courant <- pile.courant + 1;;

(*2.2*)
type 'a file_i = {
  donnees : 'a option array;
  mutable entree :int;
  mutable sortie :int;
  mutable cardinal :int
  }

(*2) On a f.sortie = f.entree + f.cardinal *)

(*3) Cela n'est pas possible car on ne sait pas si le tableau a dépassé sa capacité ou non. On peut pour cela systématiquement laisser au moins une case vide*)
let file_vide_i (i :int) :'a file_i =
  let donnees = Array.make i None in
  {
  donnees = donnees;
  entree = 0;
  sortie = 0;
  cardinal = i
  };;

let capacite_i (f :'a file_i) :int =
  f.cardinal;;

let ajoute_i (x :'a) (f :'a file_i) :unit = (*probleme de syntaxe*)
  f.donnees(f.entree) <- x;
  f.entree := f.entree + 1;;

let enleve_i (f :'a file_i) :'a option = (*probleme de syntaxe*)
  if f.sortie = 0 then None
  else
    begin
    f.sortie <- (f.sortie - 1);
    f.donnees(f.sortie + 1);
    end;;

let de_liste_i (l :'a list) (n :int) :'a file_i =
  let rec add (l1 :'a list) (f1 :'a file_i) :unit =
    match l1 with
    | x::xs -> begin
      (*ajoute_i x f1; *)
      add xs f1;
    end
    | _ -> ()
  in
  let f1 = file_vide_i n in
  add l f1;
  f1;;

(*2.3*)
(*2.3.1*)
let peek_1 (p :'a pile) :'a option =
  let a = (pop p) in
  if a = None then None
  else 
    begin
      (p.courant <- (p.courant + 1)); 
      a;
    end;;

let est_vide_1 (p :'a pile) :bool =
  let a = peek_1 p in
  if a = None then true
  else false ;;

(* La fonction modifie et vide les pile données. De plus, en sortie de boucle on ne sait pas si une pile est vide ou si une inégalité a été trouvée (potentiellement utile pour la recherche de sous-pile)*)

let iter_destructif (f :'a -> unit) (s: 'a pile) :unit =
  let rec aux (f1 :'a -> unit) (p: 'a pile) :unit =
    match pop p with
    | None -> ()
    | Some a -> f1 a;
    aux f1 p;
  in
  aux f s;;

let copie (s :'a pile) =
  let s_copie = nouvelle_pile (capacite s) in
  let miroir = nouvelle_pile (capacite s) in
  iter_destructif (fun x -> (push x miroir)) s;
  iter_destructif (fun x -> (push x s_copie; push x s) ) miroir;
  s_copie;;

let egal (s :'a pile) (t :'a pile) :bool =
  let s2 = copie s in
  let t2 = copie t in
  while not (est_vide_1 s2) && not (est_vide_1 t2) && pop s2 = pop t2 do
    ()
  done;
  est_vide_1 s2 && est_vide_1 t2;;

(*2.3.2*)
let est_vide (p :'a pile) :bool =
  if(p.courant = -1) then true
  else false;;

let flush (p :'a pile) :unit =
  p.courant <- 0;;