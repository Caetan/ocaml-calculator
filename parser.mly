%{
    open Instruccion;;
    open Expr_arit;;
%}

%token EOF
%token MAS MENOS POR DIVIDIDO IGUAL
%token PARENTIZQ PARENTDCH
%token <float> CONSTANTE
%token <string> COMANDO
%token <string> COMANDO
%token <string> VARIABLE
%token <string> FUNCION

%left MENOS MAS         /* precedencia minima */
%left POR DIVIDIDO      /* precedencia  media */
%nonassoc MENOSUNARIO   /* precedencia maxima: en este caso, no es necesaria; se ha puesto solo */
                        /*         con el fin de ilustrar el uso de %prec (en la ultima regla). */
%nonassoc FUNCION       /* precedencia maxima: en este caso, no es necesaria; se ha puesto solo */
                        /*         con el fin de ilustrar el uso de %prec (en la ultima regla). */

%start s                /* el simbolo inicial */
%type <Instruccion.instruccion> s

%%

s:
    VARIABLE IGUAL expr EOF    { Asignacion ($1,$3) }
  | expr EOF                   { Calculo $1 }
  | COMANDO EOF                { Comando $1 }
;

expr:
    CONSTANTE                            { Constante $1}
  | VARIABLE                             { Variable $1}
  | PARENTIZQ expr PARENTDCH             { $2 }
  | expr MAS expr                        { Operacion_binaria (Suma,$1,$3) }
  | expr MENOS expr                      { Operacion_binaria (Resta,$1,$3) }
  | expr POR expr                        { Operacion_binaria (Producto,$1,$3) }
  | expr DIVIDIDO expr                   { Operacion_binaria (Division,$1,$3) }
  | MENOS expr         %prec MENOSUNARIO { Operacion_unaria (Opuesto,$2) }
  | FUNCION expr       %prec FUNCION     { Operacion_unaria (Funcion $1,$2) }
;

