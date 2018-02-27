

(***********************************************************************


	Developed by Caetán Tojeiro Carpente (caetantojeiro95@gmail.com)
	

Copyright (C) 2017  Caetán Tojeiro Carpente

This program is free software: you can redistribute it and/or modify
it under the terms of the GNU Affero General Public License as published by
the Free Software Foundation, either version 3 of the License, or
any later version.

This program is distributed in the hope that it will be useful,
but WITHOUT ANY WARRANTY; without even the implied warranty of
MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
GNU General Public License for more details.

You should have received a copy of the GNU General Public License
along with this program.  If not, see <https://www.gnu.org/licenses/agpl-3.0.html>



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

