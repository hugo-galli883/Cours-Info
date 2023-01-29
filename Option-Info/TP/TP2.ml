(* Ex 19 *)
type complexe = {mutable reel: float; mutable imaginaire: float};;

let z1 = {reel = 2. ; imaginaire = 3.};;
let z2 = {reel = 5. ; imaginaire = 7.};;

z1.reel <- 5.;;

let add u v = {reel = u.reel +. v.reel ; imaginaire = u.imaginaire +. v.imaginaire};;

let mult u v = {reel = (u.reel *. v.reel) -. (u.imaginaire *. v.imaginaire) ; imaginaire = (u.reel *. v.imaginaire) +. (u.imaginaire *. v.reel)};;

let conjugue u = {reel = u.reel ; imaginaire = 0. -. u.imaginaire};;

let moduule u = sqrt((u.reel *. u.reel) +. (u.imaginaire *. u.imaginaire));;

(*let inverse u = {reel = u.reel /. ((u.reel *. u.reel) +. (u.imaginaire *. u.imaginaire)) ; imaginaire = 0. -. u.imaginaire /. ((u.reel *. u.reel) +. (u.imaginaire *. u.imaginaire))};;
*)
let inverse u =
  let den = ((u.reel *. u.reel) +. (u.imaginaire *. u.imaginaire)) in
  {reel = u.reel /. den ; imaginaire = 0. -. u.imaginaire /. den};;

let divise u v =
  let den = (u.reel *. u.reel) +. (v.imaginaire *. v.imaginaire) in
  {reel = ((u.reel *. v.reel) +. (u.imaginaire *. v.imaginaire)) /. den ; imaginaire = 0. -. ((u.reel *. v.imaginaire) -. (u.imaginaire *. v.reel)) /. den};;

(* Ex 20 *)
type genre = M | F ;;
type personne = {nom: string ; prenom: string; age: int; sexe: genre};;
let personne1 = {nom = "machin"; prenom = "bidule" ; age = 20 ; sexe = M};;
let personne2 = {nom = "Galli" ; prenom = "Hugo" ; age = 18 ; sexe = M};;

type personne_bis = {mutable nom: string ; mutable prenom: string; mutable age: int; mutable sexe: genre};;
let personne1_bis = {nom = "machin"; prenom = "bidule" ; age = 20 ; sexe = M};;
personne1_bis.age <- 30;;

let majeur p =
  if p.age >= 18 then true
  else false;;
