%{
    int n_valid = 0, n_invalid = 0;
%}

Day ([0-2][1-9]|"30")
Month "0"[1-9]|"1"("0"|"1"|"2")
Year [0-9][0-9][0-9][0-9]
DDMMYY {Day}"/"{Month}"/"{Year}
DDMMYY31 "31/"("01"|"03"|"05"|"07"|"08"|"10"|"12")"/"{Year}
DDMMFEB {Day}"/02/"{Year}

%%
"end" {return 0;}

{DDMMFEB} {
	int len = strlen(yytext), i = 0; 
	char ty[5], td[3];
	td[2] = '\0';
	ty[4] = '\0';
	for(i=len-4; i < len; i++) ty[i - len + 4] = yytext[i];
	td[0] = yytext[0];
	td[1] = yytext[1];
	
	int year = atoi(ty), day = atoi(td);
	
	if(day > 29)
		n_invalid += 1;
	else if(day = 29 && year%400 == 0)
		n_valid += 1;
	else if(day = 29 && year%100 == 0)
		n_invalid += 1;
	else if(day = 29 && year%4 == 0)
		n_valid += 1;
	else if(day = 29)
		n_invalid += 1;
	else
		n_valid += 1;
	
	return 0;
}

{DDMMYY31} {n_valid += 1;}

{DDMMYY} {n_valid += 1;}

. {n_invalid += 1;}
%%

int yywrap(){} 
int main(){
    yylex();
    
	printf("Valid Date = %d and Invalid Dates = %d\n", n_valid, n_invalid);
		    	
    return 0; 
} 
