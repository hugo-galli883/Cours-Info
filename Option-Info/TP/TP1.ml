2+2;;
(String.length "abcde");;
(String.sub "abcdefgh" 2 3);;
print_int(4);;
print_float(4.);;
print_int(4.1);;
print_float(5.2);print_int(10);;
print_float(5.2);print_newline();print_int(10);;
print_char(`c`);;
print_string("abcd");;
print_char(String.get "abcdef" 4);;
print_char(String.sub "abcdef" 4 1);;
(Char.escaped `d`);;
(int_of_float 2.3);;
(int_of_float 2);;
(int_of_float (-.2.3));;
(float_of_int 2);;
(int_of_char `b`);;
(char_of_int 99);;
(Char.escaped (String.get "abcdef" 2));;
(String.get "a" 0);;
let a = 4;; 3*a+1;;
let a = 4 in if a = 3 then 3*a else 4*a;;
let a = ref 2 in
	if (!a) = 1 then print_string("a est égal à 1")
	else print_string("a n est pas égal à 1");;
let a = 4 in
	if a = 3 then print_string("erreur")
	else a*a/(a-3);;
let a = 4 in 
	if a = 3 then failwith "erreur"
	else a*a/(a-3);;
let pair = ref true and x = 3 in
	begin
		if (x mod 2) = 0 then pair := true
		else pair := false;
		if !pair then print_string("x est pair")
		else print_string("x est impair");
	end;;
let mot = "coucou" and sous_mot = ref "" in
	if mot <> "" then 
		begin
			sous_mot := (String.sub mot 0 3);
			sous_mot
		end
	else "";;
let mot = "coucou" and sous_mot = ref "" in
	if mot <> "" then
		begin
			sous_mot := (String.sub mot 0 3);
			!sous_mot
		end
	else "";;
let a = 5 and b = 5 in
	if a = b/2 then print_string("a = b/2")
	else print_string("a ? b/2");;
let a = 5 and b = 5 in
	if a = b then print_string("a = b")
	else a <>b;;
let a = 5 and b = 5 in
	if a = b then print_string("a = b")
	else print_string("a ? b");;
let rep = ref 1 in
	begin
		for i = 1 to 5 do rep := !rep * i done;
		!rep;
	end;;
let alphabet = ref "" in
	begin
		for i = 97 to (97 + 25) do
		alphabet := ! alphabet ^ (Char.escaped (char_of_int i))
		done;
		!alphabet;
	end;;
let i = ref 1 and n = 10 in
	while !i <= n do
		print_string(" i est égal à "); print_int(!i); print_newline();
		i := !i + 1;
	done;;
let mot = "bonjour encore" and i = ref 0 in
	while !i < (string_length mot) do
		print_char((String.get mot !i));
		print_char(` `);
	done;;
let mystere (a,b) = let q = a/b in a - b*q;;
let est_pair a = 
	if (mystere a 2) = 0 then true 
	else false;; est_pair 3;;