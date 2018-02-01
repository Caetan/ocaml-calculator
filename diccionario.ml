

(***********************************************************************


	Developed by Caetán Tojeiro Carpente (caetantojeiro95@gmail.com)


************************************************************************)


type diccionario =
	(string*float) list;;
	
exception Variable_no_asignada of string;;

let diccionario_vacio = [];;

let rec consultar_valor dic var = match dic with
	[] -> raise(Variable_no_asignada var)
	| h::t -> if (var=fst(h)) then snd(h)
				else consultar_valor t var;;
				
let asignar_valor dic var valor =
	let rec aux dic dic_aux var valor = match dic with
		[] -> (var,valor)::dic_aux
		| h::t -> if (var=fst(h)) then (var,valor)::dic_aux @ t 
					else aux t (h::dic_aux) var valor 
	in aux dic [] var valor;;
	
let rec mostrar_diccionario dic = match dic with
	[] -> print_endline("")
	| h::t -> 	print_endline (fst(h) ^ " = " ^ (string_of_float (snd(h))));
				mostrar_diccionario t;;
