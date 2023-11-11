%option noyywrap
/* Analizador para un lenguaje al estilo de Melody */

%{
/* se necesita esto para la llamada a atof() mas abajo */
#include <math.h>
%}

LETRA [A-Za-z0-9]
PALABRA {LETRA}+
ORACION ({PALABRA}[ ])*{PALABRA}\.

DIGITO   [0-9]
ID       [a-zA-Z][a-z0-9]*
COMENTARIO ^#([A-Za-z])\w* 

%%


"b_"|"_b" { printf( "Esto es una cadena de caracteres: %s\n", yytext );}     

-?{DIGITO}+   { printf( "Un entero: %s (%d)\n", yytext, atoi( yytext ) ); }

""|"-"{DIGITO}+"."{DIGITO}*      {  printf( "Un real: %s (%g)\n", yytext, atof( yytext ) ); }

"DO"|"RE"|"MI"|"FA"|"SOL"|"LA"|"SI" { printf( "Una palabra clave: %s\n", yytext ); }

{ID}       { printf( "Un identificador: %s\n", yytext ); }

"JUNTAR"|"SEPARAR"|"AUMENTAR"|"DISMINUIR"|"DISMUNUIR"|"IGUAL"|"DIFERENTE"|"CONJUNTO"|"ORQUESTA"|"MAS_ALTO_QUE"|"MAS_BAJO_QUE"|"ALTO_O_IGUAL_A"|"BAJO_O_IGUAL_A"   { printf( "Un operador: %s\n", yytext ); }

"ASIGNAR" { printf( "Una asignacion: %s\n", yytext ); }

","|";" { printf( "Un separador: %s\n", yytext ); }

{COMENTARIO}   { printf( "Un comentario: %s\n", yytext ); }

[ \t\n]+          /* se come los espacios en blanco */

.                 { printf( "Error lexico: %s\n", yytext ); }

%%

main( )
    {
    printf(" Analizador para algunos elementos de un lenguaje al estilo de Melody 1.0\n");
    yyin = fopen( "prog.pas", "r" );
    yylex();
    printf("Presiones una tecla para terminar...");
    getchar();
 }
