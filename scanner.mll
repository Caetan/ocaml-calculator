{
  open Parser;; (* El tipo token esta definido en parser.mli *)
  exception Error_lexico;; 
}
rule token = parse
    [' ' '\t']                   { token lexbuf }          (* ignorar blancos *)
  | '+'                          { MAS }
  | '-'                          { MENOS }
  | '*'                          { POR }
  | '/'                          { DIVIDIDO }
  | '='                          { IGUAL }
  | '('                          { PARENTIZQ }
  | ')'                          { PARENTDCH }
  | ['0'-'9']+('.'['0'-'9']*)?(['e' 'E'](['+' '-'])?['0'-'9']+)?
                                 { CONSTANTE (float_of_string (Lexing.lexeme lexbuf)) }
  | '!'['a'-'z']+                { let s = Lexing.lexeme lexbuf in FUNCION (String.sub s 1 (String.length s - 1)) }
  | '#'['a'-'z']+                { let s = Lexing.lexeme lexbuf in COMANDO (String.sub s 1 (String.length s - 1)) }
  | ['A'-'Z' 'a'-'z'] (['A'-'Z' 'a'-'z' '0'-'9' '_' '\''])*
                                 { VARIABLE (Lexing.lexeme lexbuf) }
  | eof                          { EOF }
  | _                            { raise Error_lexico } 

