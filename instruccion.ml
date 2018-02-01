

(***********************************************************************


	Developed by Caetán Tojeiro Carpente (caetantojeiro95@gmail.com)


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
