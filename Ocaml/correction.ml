(*Ex1*)
let rec dernier list =
  match list with
  | [] -> failwith "Liste vide"
  | [x] -> x
  | x :: xs -> dernier xs

let rec avant_dernier list =
  match list with
  | [] -> failwith "Erreur"
  | [x] -> failwith "Erreur"
  | x::y::[] -> x
  | x::t -> avant_dernier t;;

(*Ex2*)
let rec somme list =
  match list with
  | [] -> 0
  | t::q -> t + somme q

(*Ex8*)
let rec double list =
  match list with
  | [] -> []
  | x::xs -> x :: x :: double xs ;;