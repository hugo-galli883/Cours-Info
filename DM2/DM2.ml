(* Question 1 : Les intervalles en conflit avec I5 sont I4, I6 et I7 *)
(* Question 2 :
    La version 1 est incorrecte, car dans l'hypothèse d'un intervale (a, b) = (0, 0), il n'y a pas de conflit entre (a, b) et (c,           d). De plus, si (c, d) arrive avant (a, b) et d < a, la fonction devrait renvoyer false, or elle renvoie true
    La version 2 est incorrecte, car (8, 10) (10, 12) représente un conflit, or on a (b, c) = (10, 10) donc (b < c) = false donc conflit2 (8, 10) (10, 12) = false et [8, 10] ^ [10, 12] = {10}
    La version 4 est incorrecte, car les couples (8, 10) et (9, 11) sont en conflit , or (d, b) = (11, 10) donc (d <= b) = false et (c, a) = (10, 9) donc (c <= a) = false. Donc la fonction revoie false alors qu'il y a un conflit
    La version correcte est donc la version 3
*)
let conflit (a, b) (c, d) =
  not ((b < c) || (d < a))
(* Question 3 : *)
(* Question 4 : *)
(* Question 5 : *)
let construit_graphe (segments: (int * int) array): int list array =
  let n = Array.length segments in
  let graphe = Array.make n [] in
  for i = 0 to n-2 do
      for j = i+1 to n-1 do
          if (conflit segments.(i) segments.(j)) then (graphe.(i) <- (j::(graphe.(i))))
      done;
  done;
  graphe



(* Exercice 3 *)
let fig2 = [| [0;2] ; [1;4] ; [1;5] ; [3;7] ; [6;9] ; [8;11] ; [8;13] ; [10;14] ; [12;15]|]
(* Question 2 : *)
let coloration (aretes: int list array) : int array =
  let n = Array.length aretes in
  let coloration = Array.make n (-1) in
  let couleurs = Array.make n (-1) in (* Ce tableau va servir à enregistrer à l'emplacement couleurs.(i) la fin du dernier intervalle de couleur i*)
  for i = 0 to n-1 do (* On parcourt les intervalles dans l'ordre croissant *)
    let a::[b] = aretes.(i) in
    let j = ref 0 in
    while(coloration.(i) = -1) do (* Cette boucle sert à parcourir le tableau couleurs dans l'ordre croissant pour déterminer la plus petite couleur non en conflit avec l'intervalle en cours de traitement*)
      if(couleurs.(!j) < a) then (
        couleurs.(!j) <- b; (*On met à jour le tableau couleurs*)
        coloration.(i) <- !j;
      ) else (
        j := !j + 1
      )
    done;
  done;
  coloration

(* Question 3 : *)
let shuffle (a: 'a array): 'a array =
  let n = Array.length a in
  let swap (i: int) (j: int): unit =
    let temp = a.(i) in
    a.(i) <- a.(j);
    a.(j) <- temp;
  in
  for i = 0 to n-1 do
    swap i (Random.int n);
  done;
  a;;

let rec test (i: int) : 'a array * 'a array=
  let n = Random.int 10 in
  let graphe = Array.make n [0;0] in
  let max (a: int array): int =
    let n = Array.length a in
    let max = ref 0 in
    for i = 0 to n-1 do
      if (a.(i) > !max) then max := i
    done;
    !max
  in
  for i = 0 to n-1 do
    let a = Random.int 12 in
    let b = a + Random.int 8 in
    graphe.(i) <- [a;b];
  done;
  let g1 = shuffle graphe in
  let g2 = shuffle graphe in
  if(max (coloration g1) = max (coloration g2)) then(print_int (i) ; print_newline (); test (i+1) )else (g1, g2);;