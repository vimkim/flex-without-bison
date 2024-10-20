%{
/* Definitions of any C code you want to include at the top */
// this is my header
#include <stdio.h>
%}

%%
[0-9]+      { 
  // this is a number
  printf("NUMBER: %s\n", yytext); }
[a-zA-Z]+   { 
  // this is a word
  printf("WORD: %s\n", yytext); }
\n          { 
  // this is a newline
  printf("NEWLINE\n"); }
.           { 
  // this is a character
  printf("CHARACTER: %s\n", yytext); }

%%
/* C code for the main function */
int main() {
    // this is my main
    yylex();  // Call the lexer
    return 0;
}

int yywrap() {
    // this is yywrap
    return 1; // Indicates end of file
}
