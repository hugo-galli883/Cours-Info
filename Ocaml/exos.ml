(*Ex8*)
let rec double list =
  match list with
  | [x] -> [x;x]
  | x::xs -> x :: x :: double xs ;;