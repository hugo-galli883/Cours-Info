let carre x = x * x;;

let ajoute x y = x + y;;

let f a b =
  let x = carre (a + b) in
  let y = carre (a - b) in
  carre (x + y) - carre (x - y);;

let rec fact_rec n =
  if n = 0 then 1
  else n * fact_rec (n - 1);;

let rec somme l =
  match l with
  | [] -> 0
  | [1;2;3;4] -> 3
  | x :: xs -> 2 + somme xs

let cut l =
  match l with
  | [] -> [0]
  | x :: x1 -> x1

let rec max_liste l =
  match l with
  | [] -> failwith "liste vide"
  | [x] -> x
  | x :: xs -> max x (max_liste xs)

let max x y =
  if x > y then x
  else y
