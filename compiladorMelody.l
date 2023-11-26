%option noyywrap
%option yylineno
%{
#include "var.tab.h"
#include <stdlib.h>
#include <stdio.h>

%}

%{
/* se necesita esto para la llamada a atof() mas abajo */
#include <math.h>
%}

DIGITO   [0-9]
ID       [a-zA-Z][a-z0-9]*
COMENTARIO ^#(.*)$
STRING "b_"[^"_"]*"_b"

%%

"COMPAS" { return tk_DELIMITADOR; }
"f" { return tk_if; }
"ff" { return tk_else; }
"p" { return tk_switch; }
"Case" { return tk_case; }
{STRING} { return tk_string; }
-?{DIGITO}+   { return numero; }
""|"-"{DIGITO}+"."{DIGITO}*      { return tk_real; }
"DO"    {return tk_int ;}
"RE"    {return tk_float ;}
"MI"    {return tk_double ;}
"FA"    {return tk_string ;}
"SOL"   {return tk_char ;}
"LA"    {return tk_bool ;}
"SI"    {return tk_object ;}
{ID}       { return id; }
"JUNTAR"        {return tk_JUNTAR; }
"SEPARAR"       {return tk_SEPARAR; }
"AUMENTAR"      {return tk_AUMENTAR; }
"DISMINUIR"     {return tk_DISMINUIR; }
"DISMUNUIR"     {return tk_DISMUNUIR; }
"IGUAL"     {return tk_IGUAL; }
"DIFERENTE"     {return tk_DIFERENTE; }
"CONJUNTO"      {return tk_CONJUNTO; }
"ORQUESTA"      {return tk_ORQUESTA; }
"MAS_ALTO_QUE"      {return tk_MAS_ALTO_QUE; }
"MAS_BAJO_QUE"      {return tk_MAS_BAJO_QUE; }
"ALTO_O_IGUAL_A"        {return tk_ALTO_O_IGUAL_A; }
"BAJO_O_IGUAL_A"        {return tk_BAJO_O_IGUAL_A; }

"ASIGNAR"|","|";" { return yytext[0]; }

{COMENTARIO}   { printf( "Un comentario: %s\n", yytext ); }

[ \t\n]+          /* se come los espacios en blanco  */

.                 {printf("error lexico %s, en la linea %d\n", yytext, yylineno); return yytext[0];}

"main"                                               {return tk_main;}       


"Musica.Escuchar()" { printf("Instrucción de entrada: %s\n", yytext); }

"Musica.Recitar()"|"Musica.Recitar("{STRING}")" { printf("Instrucción de salida: %s\n", yytext); }

%%
