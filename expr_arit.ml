

(***********************************************************************


	Developed by Caetán Tojeiro Carpente (caetantojeiro95@gmail.com)


************************************************************************)



open Diccionario;;
open Libreria;;

type operador_binario = Suma | Resta | Producto | Division;;

type operador_unario = Opuesto | Funcion of string;;
	
type expresion_aritmetica =
	Constante of float
	| Variable of string
	| Operacion_unaria of operador_unario * expresion_aritmetica
	| Operacion_binaria of operador_binario * expresion_aritmetica * expresion_aritmetica;;
	
	
	
let evaluar_expresion dic ex =
	let rec aux = function
		Constante cte -> cte
		| Variable var -> consultar_valor dic var
		| Operacion_unaria (oper, ex1) -> (
											match oper with
												Opuesto -> (aux ex1) *. (-1.)
												| Funcion nom -> (funcion nom) (aux ex1)
										)
		| Operacion_binaria (oper,ex1,ex2) -> (
												match oper with 
													Suma -> (aux ex1) +. (aux ex2)
													| Resta -> (aux ex1) -. (aux ex2)
													| Producto -> (aux ex1) *. (aux ex2)
													| Division -> (aux ex1) /. (aux ex2)
											)
		
	in aux ex;;
