%{
#include <stdio.h>
#include <math.h>
#include "define.h"
#include "add_sym.h"
FILE *new_file;
void count();
void add_bloc_number();
void reduce_bloc_number();
void comment();
%}

DIGIT [0-9]|[-][0-9]
ID [A-Za-z]*
BLANK [\t\n]+
OTHER ["!"|"."|"@"|"$"|"%"|"^"|"&"|"_"|]

%%
"if"      {char *yycopy=strdup(yytext); count(); printf("found keyword (if) at line %d\n", line); addsym( yycopy, block_num ); return(IF);}
"elif"    {char *yycopy=strdup(yytext); count(); printf("found keyword (elif) at line %d\n", line); addsym( yycopy, block_num ); return(ELIF);}
"else"    {char *yycopy=strdup(yytext); count(); printf("found keyword (else) at line %d\n", line); addsym( yycopy, block_num ); return(ELSE);}
"while"   {char *yycopy=strdup(yytext); count(); printf("found keyword (while) at line %d\n", line); addsym( yycopy, block_num ); return(WHILE);}
"exit"    {char *yycopy=strdup(yytext); count(); printf("found keyword (exit) at line %d\n", line); addsym( yycopy, block_num ); return(EXIT);}
"def"     {char *yycopy=strdup(yytext); count(); printf("found keyword (def) at line %d\n", line); addsym( yycopy, block_num ); return(DEF);}
"print"   {char *yycopy=strdup(yytext); count(); printf("found keyword (print) at line %d\n", line); addsym( yycopy, block_num ); return(PRINT);}
"input"   {char *yycopy=strdup(yytext); count(); printf("found keyword (input) at line %d\n", line); addsym( yycopy, block_num ); return(INPUT);}
"return"  {char *yycopy=strdup(yytext); count(); printf("found keyword (return) at line %d\n", line); addsym( yycopy, block_num ); return(RETURN);}

"and"     {char *yycopy=strdup(yytext); count(); printf("found logical operator (and) at line %d\n", line); addsym( yycopy, block_num ); return(AND);}
"or"      {char *yycopy=strdup(yytext); count(); printf("found logical operator (or) at line %d\n", line); addsym( yycopy, block_num ); return(OR);}
"not"     {char *yycopy=strdup(yytext); count(); printf("found logical operator (not) at line %d\n", line); addsym( yycopy, block_num ); return(NOT);}

"+"       {char *yycopy=strdup(yytext); count(); printf("found operator (plus) at line %d\n", line); addsym( yycopy, block_num ); return(PLUS);}
"-"       {char *yycopy=strdup(yytext); count(); printf("found operator (minus) at line %d\n", line); addsym( yycopy, block_num ); return(MINUS);}
"*"       {char *yycopy=strdup(yytext); count(); printf("found operator (star) at line %d\n", line); addsym( yycopy, block_num ); return(STAR);}
"/"       {char *yycopy=strdup(yytext); count(); printf("found operator (slash) at line %d\n", line); addsym( yycopy, block_num ); return(SLASH);}

"<"       {char *yycopy=strdup(yytext); count(); printf("found equation symbol %s at line %d\n" ,yycopy, line); addsym( yycopy, block_num ); return(LT);}
">"       {char *yycopy=strdup(yytext); count(); printf("found equation symbol %s at line %d\n" ,yycopy, line); addsym( yycopy, block_num ); return(GT);}
"="       {char *yycopy=strdup(yytext); count(); printf("found equation symbol %s at line %d\n" ,yycopy, line); addsym( yycopy, block_num ); return(EQUAL);}
"<="      {char *yycopy=strdup(yytext); count(); printf("found equation symbol %s at line %d\n" ,yycopy, line); addsym( yycopy, block_num ); return(LESS_OR_EQ);}
"=>"      {char *yycopy=strdup(yytext); count(); printf("found equation symbol %s at line %d\n" ,yycopy, line); addsym( yycopy, block_num ); return(GREATER_OR_EQ);}
"<>"      {char *yycopy=strdup(yytext); count(); printf("found equation symbol %s at line %d\n" ,yycopy, line); addsym( yycopy, block_num ); return(NOT_EQUAL);}

"("       {char *yycopy=strdup(yytext); count(); printf("found left parenthesis at line %d\n" ,line); addsym( yycopy, block_num ); return(LPAREN);}
")"       {char *yycopy=strdup(yytext); count(); printf("found right parenthesis at line %d\n" ,line); addsym( yycopy, block_num ); return(RPAREN);}
":="      {char *yycopy=strdup(yytext); count(); printf("found assignment symbol at line %d\n" ,line); addsym( yycopy, block_num ); return(ASSIGN);}
","       {char *yycopy=strdup(yytext); count(); printf("found comma at line %d\n" ,line); addsym( yycopy, block_num ); return(COMMA);}
"#"       {comment();}

{OTHER}   {char *yycopy=strdup(yytext); count(); printf("Unrecognized character (%s) at line %d\n", yycopy, line); addsym( yycopy, block_num );}

{BLANK}   {count();}

{ID} if (strlen(yytext) <= 20) {
  count();
  printf( "found an identifier (%s)\n", yytext );
  return(IDENTIFIER);
} else {
  printf("The identifiers must be 20 characters at maximum.\n");
}

{DIGIT}+ {
  count();
  if ((atoi(yytext) <= 32767) && (atoi(yytext) >= -32768)) {
    printf( "found an integer (%d) at line %d\n", atoi(yytext),line);
    return(DIGIT);
  }
  else {
    printf("Number %d is out of range.\n",atoi(yytext));
  }
}
%%

int main( argc, argv )
int argc;
char **argv;
{
  ++argv, --argc; /* skip over program name */
  if ( argc > 0 )
  yyin = fopen( argv[0], "r" );
  else
  yyin = stdin;
  yylex();
}

void count() {
  int i;
  for(i=0;yytext[i]!='\0';i++) {
    if(yytext[i]=='\n')
      line++;
    }
  }

int yywrap() {
  return 1;
}

void add_bloc_number() {
  block_num=block_num+1;
}

void reduce_bloc_number() {
 block_num=block_num-1;
}

void comment() {
  int c;
  while(c=input()!='\n') {
  }
  line++;
}
