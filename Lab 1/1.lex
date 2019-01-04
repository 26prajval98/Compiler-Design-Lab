%{
    int n_c = 0, n_l = 0, n_s = 0, n_w = 0;
%}


%%
" " {n_s++;}
\n {n_l++; n_c++;}
. {n_c++;}
[a-zA-Z][a-zA-Z0-9]* {n_w++; n_c+= yyleng;}
"end" {return 0;}
%%

int yywrap(){} 
int main(){
    yylex(); 
    printf("Characters = %d, Lines = %d, Spaces = %d, Words = %d\n", n_c, n_l, n_s, n_w);
    return 0; 
} 