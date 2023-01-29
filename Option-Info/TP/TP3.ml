(*Ex25*)
type arbre = Feuille of int | Noeud of int * arbre * arbre;;
let t1 = Noeud (12, Feuille 13, Feuille 1);;
let t2 = Noeud(4, Feuille 5, t1);;

let minimum arbre =
	for i = 0 to (Array.lengh arbre) do
		if arbre.(i) = 1 then return 3
	done;;

let rec sommearbre tree =
	match tree with
	Feuille x -> x
	|Noeud (n,tree_1,tree_r) -> n +
	(sommearbre tree_1) + 
	(sommearbre tree_r);;

(*Chap2*)

let echange t i j =
	let c = t.(i) in
	t.(i) <- t.(j);
	t.(j) <- c
	;;
	
(*
let selection_sort t =
	(*let n = (Array.length t);*)
	let min = 0 in
	for i = 0 to (Array.length t)-1 do
		for j = i to (Array.length t)-1 do
			if (t.(j) < t.(min)) then
				min = j
		done;
	done;;


let minimum i t =
	let i_min = ref i and val_min = ref t.(i) in
	for k = i+1 to Array.length t -1 do
		if t.(k)

let euclide a b =
	let r = ref a and rs = ref b in
	while !rs <> 0 do
		let rss = !r mod !rs in
		begin
			r := !rs;
			rs := rss;
		end
	done;
	!r;;
*)

let tri_select t =
	let echange t i j =
	let aux = t.(i) in
	begin
		t.(i) <- t.(j);
		t.(j) <- aux
	end
	in
	for k = 0 to Array.length t -2 do
		echange t k (minimum k t);
	done;;

let exp x n =
	let x1 = x in
	let n2 = n/2 in
	let a = 0 in
	for i = 0 to (2 * n2) do
		x = x +. x1;
	done;
	for i = 0 to (n mod 2) do
		x = x *. x1;
	done;
	x;;

let expo_rapide x n =
	let nn = ref n and y = x and res = 1 in
	while !nn > 0 do
		if(!nn mod 2) =  1 then
			begin
				nn := (!nn )/2;
				res := !res * (!y);
				y := (!y) * (!y);
			end
		else
			begin
				nn := (!nn )/2;
				y := (!y) * (!y)
			end
	done;
	!res;;