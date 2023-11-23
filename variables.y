%{
#include <stdlib.h>
#include <stdio.h>
extern int yylex(void);
extern char *yytext;
yyerror (char *s);
%}

/* Declaraciones de BISON %token tipo*/
%token tk_DELIMITADOR
%token tk_if
%token tk_else
%token tk_switch
%token tk_case
%token tk_string
%token numero
%token tk_real
%token tk_int
%token tk_float
%token tk_double
%token tk_string
%token tk_char
%token tk_bool
%token tk_object
%token id
%token tk_JUNTAR
%token tk_SEPARAR
%token tk_AUMENTAR
%token tk_DISMINUIR
%token tk_DISMUNUIR
%token tk_IGUAL
%token tk_DIFERENTE
%token tk_CONJUNTO
%token tk_ORQUESTA
%token tk_MAS_ALTO_QUE
%token tk_MAS_BAJO_QUE
%token tk_ALTO_O_IGUAL_A
%token tk_BAJO_O_IGUAL_A
%token tk_main

%%
/* Gramática */

CONJUNTO: /*  cadena vacía  */
	| DECLARA CONJUNTO
;

DECLARA : TIPO LISTA ';' {printf("-> Declaracion correcta\n");}
              | error ';' { yyerrok;}  /* Para el manejo de errores */
              ;
TIPO : tk_int
        | tk_float
        | tk_char
        ;
LISTA : id
         | LISTA ',' id
         ;

%%
/* Funciones que necesitan el analizador sintáctico*/
int main() {
   printf("Ingrese declaraciones de variables \n");
   yyparse();
   printf("digite una tecla para terminar...");
   getchar();
}

yyerror (char *s) {
   printf ("%s, en: %s \n", s, yytext);
}

int yywrap() {
   return 1;
}