let rec calc (f : 'a -> 'a) n a =
    if n = 0 then a
    else f (calc (f) (n-1) (a));;

let rec calc (f : 'a -> 'a -> 'a) n a b =
    if n = 0 then a
    else if n = 1 then b
    else f (calc (f) (n-1) a b) (calc (f) (n-2) a b);;

(*Ex2*)

let rec ex t =
    let rec aux t (mi,ma) =
        match t with
        | [] -> (mi, ma)
        | [x] -> if x < mi then (x, ma) else if x > ma then (mi, x) else (mi, ma)
        | x :: xs -> if x < mi then (x, ma) else if x > ma then (mi, x) else (mi, ma)
    match t with
    | [] -

(*Ex3*)
let basebversbase10 b tn =
    let n = Array.length tn in
    let somme = 0 in
    for i = 0 th n do
        somme = somme + (b * th.(i))
    done;
    somme;;

let base10versbaseb b n =
    let tn = [||] in
    for i = 0 to (b mod n) do
        tn = tn :: (n / b)
        n = n mod b
    done;
    tn;;

let baseb_to_base10 b n =
  let rec helper acc n =
    if n = 0 then acc
    else
      let d = n mod 10
      and q = n / 10 in
      helper (acc + d * (int_of_float (b ** (float_of_int (List.length acc))))) q
  in
  helper [n mod 10] (n / 10)

let somme_bases ta tb b =
    base10versbaseb b ((basebversbase10 b tb) + (basebversbase10 ta));;

let affiche tp =
    List.iter (fun x -> print_endline (string_of_int x)) tp;;
      
let eval p x =
    let n = Array.length p in
    let s = 0 in
    for i = 0 to n do
        s = s + p.(i)
    done;;

let scalaire lam tp =
    let rec aux l b =
        match l with
        | [] -> []
        | [x] -> [b * l]
        | x :: xs -> [b * x] :: (aux xs b)
    in
    (aux tp lam);;

