(*Ex 39*)
let produit (m1 :int array array) (m2 :int array array) :int array array =
  let n = Array.length m1 in
  let m3 = Array.make n (Array.make n 0) in
  for i = 0 to (n-1) do
    m3.(i) <- Array.make n 0;
  done;
  for i = 0 to (n-1) do
    for j = 0 to (n-1) do
      for k = 0 to (n-1) do
        m3.(i).(j) <- m3.(i).(j) + ((m1.(i).(k)) * (m2.(k).(j)));
      done
    done
  done;
  m3;;

let puissance (m1 :int array array) (n :int) :int array array =
  let rec aux (m1 :int array array) (m2 :int array array) (n :int) :int array array =
    if (n = 1) then (m1) else (
      aux (produit m1 m2) (m2) (n-1)
    )
  in
  if (n = 0) then (
    let n1 = Array.length m1;
    let m2 = Array.make n1 0;
    for i = 0 to (n1-1) do
      m2.(i).(i) <- 1;
    done;
    aux m2 m2 1;
  ) else (
    aux m1 m1 n
  );;
      (*Complexite : n appels de la fonction 'aux' soit n appels de 'produit' donc O(n*m*m*m) operations*)

