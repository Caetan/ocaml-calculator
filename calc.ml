

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
open Libreria;;
open Instruccion;;
open Parser;;
open Scanner;;
open Parsing;;

let d = ref diccionario_vacio;;
let seguir = ref true;;

print_char('\n');
print_endline("Calculadora de punto flotante con variables...");;
print_char('\n');


while (!seguir) do

	print_string(">> ");

	try
		d := ejecutar_instruccion (!d) (Parser.s Scanner.token (Lexing.from_string (read_line())));
		print_char('\n');
	
	with
		Error_lexico -> print_endline ("Error léxico"); print_char('\n')
		| Parse_error -> print_endline ("Error sintáctico"); print_char('\n')
		| Variable_no_asignada var -> print_endline("Variable " ^ var ^ " no asignada"); print_char('\n')
		| Funcion_no_implementada func -> print_endline("Función " ^ func ^ " no implementada"); print_char('\n')
		| Comando_no_implementado c -> print_endline("Comando " ^ c ^ " no implementado"); print_char('\n')
		| Fin_de_ejecucion -> print_endline("... Adiós !!!");
							seguir := false;

done;

print_endline("");;
