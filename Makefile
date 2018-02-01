all: diccionario libreria expr_arit instruccion parser scanner fcalc
	ocamlc -o calc diccionario.cmo libreria.cmo expr_arit.cmo instruccion.cmo parser.cmo scanner.cmo calc.cmo

diccionario: diccionario.mli diccionario.ml
	ocamlc -c diccionario.mli diccionario.ml

libreria: libreria.mli libreria.ml
	ocamlc -c libreria.mli libreria.ml

expr_arit: expr_arit.mli expr_arit.ml
	ocamlc -c expr_arit.mli expr_arit.ml

instruccion: instruccion.mli instruccion.ml
	ocamlc -c instruccion.mli instruccion.ml

parser: parser.mly
	ocamlyacc parser.mly
	ocamlc -c parser.mli parser.ml

scanner: scanner.mll
	ocamllex scanner.mll
	ocamlc -c scanner.ml

fcalc: calc.ml
	ocamlc -c calc.ml

clean:
	rm -f scanner.ml parser.ml parser.mli *.cmi *.cmo *~

