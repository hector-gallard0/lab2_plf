%{
    int caracteres = 0;
    int reconocedor = 0;
%}

%option noyywrap
IDENTIFICADOR [a-zA-Z]([a-zA-z]*[0-9]*)*
ENTERO [0-9]+
DECIMAL [0-9]+,[0-9]+
EXPONENCIAL [0-9]+(,[0-9]+){0,1}E[-+]{0,1}[0-9]+
SIMBOLO "+"|"-"|"x"|":"|"/"|"^"|"|"|"!"|"("|")"|"="
PALABRARESERVADA PI|MOD|SQR|CUR|EXP|LN|LOG|SGN|INT|FIX|FRAC|ROUND

%%
{PALABRARESERVADA} {
    printf("\n%s = PALABRA RESERVADA\n", yytext);
    fprintf(yyout, "%s\n", yytext);
}

{SIMBOLO} {
    printf("\n%s = SIMBOLO\n", yytext);
}

{IDENTIFICADOR} {
    printf("\n%s = IDENTIFICADOR\n", yytext);    
}

{ENTERO} {
    printf("\n%s = ENTERO\n", yytext);
}

{DECIMAL} {
    printf("\n%s = DECIMAL\n", yytext);
}

%%

void main(int argc, char **argv){
    ++argv, --argc; /* se salta el nombre del programa */
    if ( argc > 0 ){
        yyin = fopen( argv[0], "r" );
        yyout = fopen( argv[1], "w" );
    }
    else yyin = stdin;
    yylex();
}
