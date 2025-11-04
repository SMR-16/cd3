%{
#include <stdio.h>
#include "string.tab.h"
extern void yyerror(char *);
%}

%%
[a]    { return A; }
[b]    { return B; }
[ \t]  ;              /* skip whitespace */
\n     { return '\n'; }   /* newline marks end of input */
.      { yyerror("Invalid string"); exit(1); }
%%

int yywrap(void) {
    return 1;
}
