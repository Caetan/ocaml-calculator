

(***********************************************************************


	Developed by Caetán Tojeiro Carpente (caetantojeiro95@gmail.com)


************************************************************************)




exception Funcion_no_implementada of string;;

let listaFun = [
	("abs","Valor Absoluto", abs_float);
	("sqrt", "Raíz Cuadrada", sqrt);
	("exp", "Exponencial", exp);
	("log", "Logaritmo Natural", log);
	("round", "Redondeo", (fun x -> floor (x+.0.5)));
	];;


let funcion var =
	let rec listar var lista = match lista with
		[] -> raise(Funcion_no_implementada var)
		| h::t -> match h with
					(nom,_,func) -> if (var=nom) then func
										else listar var t
	in listar var listaFun;;
	
let descripcion var =
	let rec listar var lista = match lista with
		[] -> raise(Funcion_no_implementada var)
		| h::t -> match h with
					(nom,desc,_) -> if (var=nom) then desc
										else listar var t
	in listar var listaFun;;
	
	
let mostrar_libreria () = 
	let rec aux = function
		[] -> print_endline("")
		| h::t -> match h with
			(nom,desc,func) -> print_endline (nom ^ " : " ^ desc);
								aux t;
	in aux listaFun;;

