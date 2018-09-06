

(***********************************************************************


	Developed by Caetán Tojeiro Carpente (caetantojeiro95@gmail.com)
	
	

Copyleft (C) 2017  Caetán Tojeiro Carpente

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
