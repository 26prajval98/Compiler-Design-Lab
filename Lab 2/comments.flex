%{
    int n_sl = 0, n_ml = 0;
%}

NL \n
CHAR .
SL "//"{CHAR}*
ML "/*"({NL}|{CHAR})*"*/"

%%
"end" {return 0;}
{SL} {n_sl++;}
{ML} {n_ml++;}
%%

int yywrap(){} 
int main(){
    yylex(); 
    printf("Multiline = %d and Single Line = %d \n", n_ml, n_sl);
    return 0; 
} 
