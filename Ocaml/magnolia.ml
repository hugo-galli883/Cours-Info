(* Functional Stack : use a list *)

(* Imperative Stack *)

type 'a istack = 'a list ref

let is_create () : 'a istack = ref []
let is_isEmpty (st : 'a istack) : bool = !st = []
let is_push (st : 'a istack) (x : 'a) : unit = st := x :: !st

let is_top (st : 'a istack) : 'a =
  match !st with
  | [] -> invalid_arg "s_top"
  | x :: _ -> x

let is_pop (st : 'a istack) : 'a =
  match !st with
  | [] -> invalid_arg "pop"
  | x :: xs ->
      st := xs;
      x

(* Functional Queue *)

type 'a fqueue = {
  front : 'a list;
  rear : 'a list;
}

let fq_empty : 'a fqueue = { rear = []; front = [] }
let fq_isEmpty (q : 'a fqueue) : bool = q.front = [] && q.rear = []

let fq_push (q : 'a fqueue) (x : 'a) : 'a fqueue =
  { rear = x :: q.rear; front = q.front }

let fq_pop (q : 'a fqueue) (x : 'a) : 'a * 'a fqueue =
  match q.front with
  | x :: f -> (x, { rear = q.rear; front = f })
  | [] -> (
      match List.rev q.rear with
      | [] -> invalid_arg "fq_pop"
      | x :: f -> (x, { rear = []; front = f }))

(* Imperative Queue *)

type 'a iqueue = {
  mutable data : 'a option array;
  mutable next : int;
  mutable size : int;
}

let iq_create () : 'a iqueue = { data = [||]; next = 0; size = 0 }
let iq_isEmpty (q : 'a iqueue) : bool = q.size = 0

let iq_push (q : 'a iqueue) (x : 'a) : unit =
  let n = Array.length q.data in
  if n = q.size then (
    let new_n = if n = 0 then 1 else 2 * n in
    let new_data = Array.make new_n None in
    let j = q.next in
    for i = 0 to n - 1 do
      new_data.(i) <- q.data.((j + i) mod n)
    done;
    q.data <- new_data;
    q.next <- 0;
    q.size <- n);
  let j = (q.next + q.size) mod Array.length q.data in
  q.data.(j) <- Some x;
  q.size <- q.size + 1

let iq_pop (q : 'a iqueue) : 'a =
  let v =
    match q.data.(q.next) with
    | None -> invalid_arg "iq_pop"
    | Some x -> x
  in
  (* Non indispensable mais rend le debugage plus simple *)
  q.data.(q.next) <- None;
  q.next <- (q.next + 1) mod Array.length q.data;
  q.size <- q.size - 1;
  v

let profondeur (g :int list array) (s :int) :unit =
  let rec add_pile (pile) (l :int list) =
    match l with
    | hd::tl ->((is_push pile hd);(add_pile pile tl))
    | _ -> ()
  in
  let n = Array.length g in
  let visite = Array.make n false in
  let pile = is_create () in
  let rec aux (visite :bool array) (pile :int istack) (g :int list array) :unit =
    let x = (is_pop pile) in
    if (visite.(x) = false ) then begin
        visite.(x) <- true;
        add_pile pile g.(x);
      end
    else ()
  in
  (aux visite pile g);;

let rec profondeur_rec (g :int list array) (visite :bool array) (x :int) :unit =
  let rec aux (g :int list array) (visite :bool array) (l :int list) =
    match l with
    | hd::tl -> ((profondeur_rec g visite hd);(aux g visite tl))
    | _ -> (profondeur_rec g visite 0)
  in
  if (visite.(x) = false) then(
    visite.(x) <- true;
    aux g visite g.(x);
  ) else ();;

let profondeur (g :int list array) (s :int) :unit =
  let n = Array.length g in
  let visite = Array.make n false in
  profondeur_rec g visite s;;

let existe_chemin (g :int list array) (x :int) (y :int) :bool =
  let n = Array.length g in
  let visite = Array.make n false in
  profondeur_rec g visite x;
  visite.(y);;

let rec tous_vrai(t :bool array) :bool =
  match t with
  | [x] -> x
  | hd::tl -> if hd then (tous_vrai tl) else false
  | [] -> false;;

let rec est_connexe (g :int list array) :bool =
  let n = Array.length g in
  let visite = Array.make n false in
  profondeur_rec g visite 0;
  tous_vrai visite;;

let rec possede_cycle_rec (g :int list array) (etat :int array) (x :int) :bool =
  let rec aux1 (g :int list array) (gx :int list) (etat :int array) =
    match gx with
    | hd::tl -> (
      let cycle = (possede_cycle_rec g etat hd) in
      aux1 g tl etat;
      if (cycle = true) then (true) else (
        etat.(x) <- 2;
        false;
      )
    )
    | _ -> (true)
  in
  if(etat.(x) = 0) then (
    etat.(x) <- 1;
    aux1 g g.(x) etat;
  ) else (
    if(etat.(x) = 1) then (true) else (false)
  );;

let possede_cycle (g :int list array) :bool =
  let rec aux (g :int list array) (etat :int array) (x :int) :bool =
    if x = 0 then (false) else (
      let cycle = possede_cycle_rec g etat x in
      (not cycle) && (aux g etat (x-1))
    )
  in
  let n = Array.length g in
  let etat = Array.make n 1 in
  not (aux g etat n);;

let largeur (g :int list array) (s :int) :unit =
  let append (l :'a list) (x :'a) :'a list =
    let rec turn (l1 :'a list) (l2 :'a list) :'a list =
      match l1 with
      | hd::tl -> turn tl (hd::l2)
      | _ -> l2
    in
    turn (x::(turn l [])) []
  in
  let rec aux (file :int list) (visite :bool array) (g :int list array) =
    match file with
    | hd::tl -> (
      if (visite.(hd) = false) then (
        visite.(hd) <- true;
        let rec aux2 (gx :int list) (file :int list) :int list =
          match gx with
          | hd::tl -> aux2 tl (append file hd)
          | _ -> file
        in
        aux (aux2 g.(hd) file) visite g
      ) else ()
    )
    | _ -> ()
  in
  let n = Array.length g in
  let visite = Array.make n false in
  let file = [s] in
  aux file visite g;;

let largeur (g :int list array) (s :int) :unit =
  let n  = Array.length g in
  let decouvert = Array.make n false in
  let courant = is_create () in
  let suivant = is_create () in
  let rec loop1 (courant) (g :int list array) (suivant) (decouvert) =
    if (not (is_isEmpty courant)) then (
      let x = is_pop courant;
      loop2 g.(x) decouvert suivant;
      if (is_isEmpty courant) then (
        loop1 suivant g (is_create ()) decouvert;
      ) else (loop1 courant g suivant decouvert;)
    )
    else ()
  in
  let rec loop2 (gx :int list) (decouvert :bool array) (suivant) :unit =
    match gx with
    | hd::tl -> (
      if (decouvert.(hd) = false) then (
        decouvert.(hd) <- true;
        is_push suivant hd;
        loop2 tl decouvert suivant;
      ) else ()
    )
    | _ -> ()
  in
  decouvert.(s) <- true;
  is_push courant s;
  loop1 courant g suivant decouvert;;