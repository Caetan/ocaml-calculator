

(***********************************************************************


	Developed by Caetán Tojeiro Carpente (caetantojeiro95@gmail.com)


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
