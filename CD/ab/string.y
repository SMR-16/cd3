%{
#include <stdio.h>
#include <stdlib.h>
void yyerror(char *);
int yylex(void);
%}

%token A B

%%
S : T '\n'   { printf("Valid string\n"); exit(0); }
  ;

T : A T B
  | A B
  ;
%%

void yyerror(char *s) {
    fprintf(stderr, "Invalid string\n");
}

int main(void) {
    printf("Enter a string: ");
    yyparse();
    return 0;
}
