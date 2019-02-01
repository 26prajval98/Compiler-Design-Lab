# 1. lex programs
`flex <filename.l>`

`gcc lex.yy.c`

`./a.exe`

#2. Yacc (Bison) programs

`bison -d <program_name>.y`

`flex <filename.l> <program_name>.y`

`gcc lex.yy.c <program_name>`

`./a.exe`