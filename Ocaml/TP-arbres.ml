type ('a, 'b) arbre =
  | Feuille of 'b
  | Interne of 'a * ('a, 'b) arbre * ('a, 'b) arbre

(* I) Fonctions elementaires sur les arbres*)
(* 1) Exercice *)

(* 1) *)
let exemple1 =
  Interne (12,
    Interne (4,
      Interne (7, Feuille 20, Feuille 30),
      Interne (14, Feuille 1, Feuille 2)),
    Feuille 20);;

(* 2) *)
let exemple2 = 
  Interne(20, 
    Feuille 0.3,
    Interne(1, 
      Interne(8,
        Interne(2,
          Feuille 2.5,
          Feuille 3.1),
        Feuille 4.1),
      Feuille 0.2));;

(* 2) Exercice *)
(* 1) *)
let rec hauteur (t: ('a,'b) arbre) :int =
  let max (a: int) (b: int) =
    if(a>b) then a else b
  in
  match t with
  | Feuille x -> 0
  | Interne (x, g, d) -> 1 + (max (hauteur g) (hauteur d));;

(* 2) *)
let rec taille (t: ('a,'b) arbre) :int =
  match t with
  | Feuille x -> 1
  | Interne(x, g, d) -> 1 + (taille g) + (taille d);;

(* 3) *)
let rec dernier (t: ('a,'b) arbre) :'b =
  match t with
  | Feuille x -> x
  | Interne (x, g, d) -> dernier d;;


(* II) Parcours d'arbres *)
(* 1) A la main *)

(*
  Largeur : 4 , 0.3 , 1 , 8 , 0.2 , 2 , 4.1 , 2.5 , 3.1
  Prefixe : 4 , 0.3 , 1 , 8 , 2 , 2.5 , 3.1 , 4.1 , 0.2
  Infixe : 0.3 , 4 , 2.5 , 2 , 3.1 , 8 , 4.1 , 1 , 0.2
  Postfixe : 0.3 , 2.5 , 3.1 , 2 , 4.1 , 8 , 0.2 , 1 , 4
*)

(* 2) Parcours en profondeur *)

let rec affiche_prefixe (t: (int, int) arbre) :unit =
  match t with
  | Feuille x -> print_int(x); print_newline();
  | Interne (x, g, d) -> print_int(x); print_newline(); affiche_prefixe(g); affiche_prefixe(d);

let rec affiche_infixe (t: (int, int) arbre) :unit =
  match t with
  | Feuille x -> print_int(x); print_newline();
  | Interne (x, g, d) -> affiche_infixe(g); print_int(x); print_newline(); affiche_infixe(d);;

let rec affiche_postfix (t: (int, int) arbre) :unit =
  let rec aux (t: (int, int) arbre) (s: int list) : unit =
    match t with

(* Liste des etiquettes *)
type ('a, 'b) token = N of 'a | F of 'b;;

let rec postfix_naif (t: ('a, 'b) arbre) : ('a, 'b) token list =
  match t with
  | Feuille x -> [F x]
  | Interne (x, g, d) -> (N x)::((postfix_naif g) @ (postfix_naif d));;