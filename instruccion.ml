

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


open Diccionario;;
open Expr_arit;;
open Libreria;;


type instruccion =
  Asignacion of string * expresion_aritmetica
| Calculo of expresion_aritmetica
| Comando of string;;

exception Fin_de_ejecucion;;

exception Comando_no_implementado of string;;

let ejecutar_instruccion dic inst = match inst with
	Asignacion (var,valor)-> print_endline (var ^ " = " ^ (string_of_float (evaluar_expresion dic valor)));
							asignar_valor dic var (evaluar_expresion dic valor)
	| Calculo cal -> print_endline (string_of_float (evaluar_expresion dic cal));
						dic
	| Comando c -> match c with
						"fun" -> mostrar_libreria ();
						dic
						| "var" -> mostrar_diccionario dic;
						dic
						| "fin" -> raise(Fin_de_ejecucion)
						| _ -> raise(Comando_no_implementado c);;
