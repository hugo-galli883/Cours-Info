type dict =
  | V
  | N of char * dict * dict
type mot = char list

let rec est_bien_forme (d: dict): bool =
  match d with
  | V -> true
  | N ('$',V,d) -> est_bien_forme d
  | N ('$',_,_) -> false
  | N (_, V, _) -> false
  | N (_, g, d) -> (est_bien_forme g) && (est_bien_forme d)

(*
phi(V) = {}
phi(x,g,d) = {x} u phi(g) u phi(d)
*)

let rec mot_of_string (s: string): mot =
  let n = String.length s in
  let mot = ref [] in
  for i = 0 to n-1 do
    mot := s.[i]::(!mot)
  done;
  mot := ('$')::(!mot);
  List.rev !mot;;

let afficher (s: string): unit =
  let mot_li = mot_of_string s in
  let rec affiche (l: 'a list): unit =
    match l with
    | ['$'] -> print_char '\n'
    | hd::tl -> print_char hd; affiche tl
    | _ -> ()
  in
  affiche mot_li;;

let rec cardinal (d: dict): int =
  match d with
  | V -> 0
  | N(x,g,d) -> (if x = '$' then 1 else 0) + cardinal g + cardinal d

let rec appartient (d: dict) (m: mot): bool =
  match d, m with
  | V, l -> l = []
  | N(x, g, d), hd::tl -> if (hd = x) then (appartient g tl) else (appartient d m)
  | _ -> true;;

let rec ajouter (d: dict) (m: mot): dict =
  match d, m with
  | V, hd::tl -> N(hd, (ajouter V tl), V)
  | N(x, g, d), hd::tl -> if(x = hd) then (N(x, (ajouter g tl), d)) else N(x, g, (ajouter d m))
  | t, [] -> t;;

let rec dict_of_list (l: string list): dict =
  match l with
  | [] -> V
  | hd::tl -> ajouter (dict_of_list tl) (mot_of_string hd);;

let afficher_mots (d: dict): unit =
  let rec affiche (l: char list): unit =
    match l with
    | ['$'] -> print_char '\n'
    | hd::tl -> print_char hd; affiche tl
    | _ -> ()
  in
  let rec aux (di: dict) (l: mot): unit =
    match di with
    | V -> ()
    | N('$', _, d) -> affiche (List.rev (('$')::l)); aux d l
    | N(x, g, d) -> aux g (x::l) ; aux d l;
  in
  aux d [];;

let rec longueur_maximale (di: dict): int =
  match di with
  | V -> 0
  | N('$',_,d) -> longueur_maximale d
  | N(x, g, d) ->1 + (max (longueur_maximale g) (longueur_maximale d));;

let afficher_mots_longs (di: dict) (k: int): unit =
  let rec affiche (l: char list): unit =
    match l with
    | [] -> print_char '\n'
    | hd::tl -> print_char hd; affiche tl
  in
  let rec aux (di: dict) (l: mot) (i: int): unit =
    match di with
    | V -> ()
    | N('$', _, d) -> if(i <= 0) then (affiche (List.rev l); aux d l i)
    | N(x, g, d) -> aux g (x::l) (i-1); aux d l i;
  in
  aux di [] k;;

let list_of_file filename =
  let file = open_in filename in
  let rec read_lines lines =
    try
      let line = input_line file in
      read_lines (line :: lines)
    with
      End_of_file ->
        close_in file;
        List.rev lines
  in
  read_lines [];;

let dict_of_file (filename: string): dict =
  dict_of_list (list_of_file filename);;

let calculer_occurences (s: string): int array =
  let occ = Array.make 256 0 in
  let n = String.length s in
  for i = 0 to n-1 do
    occ.(int_of_char s.[i]) <- occ.(int_of_char s.[i]) +1
  done;
  occ;;

N('d',
  N('i',
    N('a',
      N('n',
        N('e',
          N('$',
            V,
            V),
          V),
        V),
      N('r',
        N('e',
          N('$',
            V,
            V),
          V),
        V)),
    N('o',
      N('n',
        N('$',V,V),
        V),
      V)),
    V);;