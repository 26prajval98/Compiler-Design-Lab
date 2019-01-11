%{
    int valid = 0;
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
		valid = 0;
	else if(day = 29 && year%400 == 0)
		valid = 1;
	else if(day = 29 && year%100 == 0)
		valid = 0;
	else if(day = 29 && year%4 == 0)
		valid = 1;
	else if(day = 29)
		valid = 0;
	else
		valid = 1;
	
	return 0;
}

{DDMMYY31} {valid = 1;}

{DDMMYY} {valid = 1;}

. {return 0;}
%%

int yywrap(){} 
int main(){
    yylex();
    
    if(valid) 
    	printf("Valid Date\n");\
    else
		printf("Invalid Date\n");\
		    	
    return 0; 
} 
