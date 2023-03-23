type point = {x: float; y: float}

let distance (p1: point) (p2: point) :float =
  let dx = p2.x -. p1.x in
  let dy = p2.y -. p1.y in
  sqrt (dx *. dx +. dy *. dy);;

let dmin_naif (pa: point array) :float =
  let n = Array.length pa in
  let min = ref infinity in
  for i = 0 to n do
    for j = i to n do
      if(!min > distance pa.(i) pa.(j)) then min := distance pa.(i) pa.(j)
    done
  done;
  !min;;

(* 0 -> infinity ; 1 -> 0 ; 2 -> distance p1 p2 *)

let separe_moitie (l: 'a list) : 'a list * 'a list =
  let rec len (l1 : 'a list) (n: int) :int =
    match l1 with
    | hd::tl -> len tl (n+1)
    | _ -> n
  in
  let rec aux (l1 :'a list) (l2 :'a list) (n :int) :'a list * 'a list =
    if (n != 0) then (
      match l1 with
      | hd::tl -> aux tl hd::l2 (n-1)
      | _ -> (l1 (List.rev l2))
    ) else (
      l1 (List.rev l2)
    )
  in
  aux l [] (len l)/2;;

let compare_x (a: point) (b: point) :int =
  if (a.x < b.x) then ( -1 )
  else (
    if(b.x < a.x) then (1) else (
      0
    )
  );;

let tri_par_x (l: point list) :point list =
  List.sort compare_x l;;

let dmin_gauche_droite (pl1: point list) (pl2: point list) :float =
  let rec min (x: point) (l2: point list) (m: float) :float =
    match l2 with
    | hd::tl -> if (distance x hd < m) then (min x tl (distance x hd)) else (min x tl m)
    | _ -> m
  in
  let rec iter (l1: point list) (l2: point list) (m: float) :float =
    match l1 with
    | hd::tl -> if(min hd l2 infinity < m) then (iter tl l2 (min hd l2 infinity)) else (iter tl l2 m)
    | _ -> m
  in
  iter pl1 pl2 infinity;;

