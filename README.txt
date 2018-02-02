Developed by Caetán Tojeiro Carpente (caetantojeiro95@gmail.com) with the exception of following files parser.mly, scanner


Basic floating point calculator with variables which calculate basic operations: Addition, subtraction, multiplication and division and extra functions such as absolute value, square root, exponential, natural logarithm and round.
It is possible to assign variables, visualize calculator's internal state and visualize internal function's library.
To run calculator you must execute the command "calc" once you have compile files, with Makefile

Execution example:
$ ./calc
Calculadora de punto flotante con variables...
>> 1 + 3/4
1.75

>> x = 3e­4 / 2
x = 0.00015

>> (x + 3) * 2
6.0003

>> y = 2 * x
y = 0.0003

>> z + 1
Variable z no asignada

>> #var
y = 0.0003
x = 0.00015

>> !round !sqr 34
Función sqr no implementada

>> #func
Comando func no implementado

>> #fun
abs : valor absoluto
sqrt : raíz cuadrada
exp : exponencial
log : logaritmo natural
round : redondeo

>> !round !sqrt 34
6.

>> 3,4
Error lexico

>> 3 4
Error sintactico

>> #fin
... Adiós !!!
