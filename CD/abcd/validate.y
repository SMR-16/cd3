%{
#include <stdio.h>
#include <stdlib.h>
void yyerror(char *);
int yylex(void);
%}

%token A B C D NL

%%
/* Parse exactly one valid line — not multiple */
start:
    expr NL   { printf("Accepted\n"); YYACCEPT; }
    ;

expr:
    A_part C_part
    ;

A_part:
    A A_part B
  | A B
  ;

C_part:
    C C_part D
  | C D
  ;
%%

void yyerror(char *s) {
    fprintf(stderr, "%s\n", s);
}

int main() {
    printf("Enter a string (a^n b^n c^m d^m, where n,m > 0)\n");
    printf("Examples: abcd, aabbcd, aabbccdd\n");
    yyparse();
    return 0;
}


