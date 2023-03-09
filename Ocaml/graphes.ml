let decoupeoptimale (n :int) :int =
  let rec recupLength (l :int list) (s :int) :int * int list =
    match l with
    | [] -> (s, [])
    | 0::tl -> recupLength tl (s+1)
    | 1::tl -> ((s+1),tl)
  in
  let rec value (l :int list) (s :int) (t :int array) :int =
    match l with
    | [] -> s
    | _ -> (
      let v, l2 =recupLength l 1 in
      value l2 (1 + t.(v)) t
    )
  in
  let rec binaire (n :int) :int list =
    if ((int_of_float ((log (float_of_int n)) /. (log 2.)))+1) = 1 then (
      if n = 0 then [0]
      else [1]
    ) else (
      if (n mod 2) = 0 then ((binaire ((n-(n mod 2))/2))@[0])
      else ((binaire ((n-(n mod 2))/2))@[1])
    )
  in
  let rec getList (n :int) (l :int list list) :int list list =
    if n = 0 then l
    else (getList (n-1) ((binaire n)::l))
  in
  let rec compare (l :int list list) (max :int) (t :int array) :int =
    match l with
    | [] -> max
    | hd::tl -> ( if (value hd 0 t) > max then (compare tl (value hd 0 t) t)
                else compare tl max t )
  in
  compare (getList n []) 0 [|1;5;8;9;10;17;17;20;24;26|];;
