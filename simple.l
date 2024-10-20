%{
/* Definitions of any C code you want to include at the top */
#include <stdio.h>
#include <stdlib.h>
# define YY_DECL int yylex(yyscan_t yyscanner)
%}

%%
[0-9]+      { 
  // Recognize a number
  printf("NUMBER: %s\n", yytext); 
}
[a-zA-Z]+   { 
  // Recognize a word
  printf("WORD: %s\n", yytext); 
}
\n          { 
  // Recognize a newline
  printf("NEWLINE\n"); 
}
.           { 
  // Recognize any other single character
  printf("CHARACTER: %s\n", yytext); 
}

%%

/* C code for the main function */
int main(void) {
    yyscan_t scanner;

    // Initialize the scanner
    if (yylex_init(&scanner)) {
        fprintf(stderr, "Error initializing scanner\n");
        return EXIT_FAILURE;
    }

    // Start lexical analysis
    printf("Start scanning:\n");
    yylex(scanner);

    // Cleanup and exit
    yylex_destroy(scanner);
    return EXIT_SUCCESS;
}

int yywrap(yyscan_t yyscanner) {
    // Called when end of input is reached
    return 1; // Indicates end of file
}

