%{
    int n_pi = 0, n_ni = 0, n_pf = 0, n_nf = 0;
%}

PINT "+"?" "*[0-9]+
NINT "-"" "*[0-9]+
INT [0-9]+

%%
"end" {return 0;}
{PINT} {n_pi++;}
{NINT} {n_ni++;}
{PINT}"."{INT} {n_pf++;}
{NINT}"."{INT} {n_nf++;}
%%

int yywrap(){} 
int main(){
    yylex(); 
    printf("Positive Integers = %d and decimals = %d \nNegative Integers = %d and decimals = %d\n", n_pi, n_pf, n_ni, n_nf);
    return 0; 
} 