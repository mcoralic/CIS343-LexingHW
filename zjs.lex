%{
	#include <stdio.h>
	#include <string.h>
	void white_space(char* lex);
%}

%option yylineno

%%
(END)			{ printf("END\n"); }
;			{ printf("END_STATEMENT\n"); }
(POINT|point)		{ printf("POINT\n"); }
(LINE|line)		{ printf("LINE\n"); }
(CIRCLE|circle)		{ printf("CIRCLE\n"); }
(RECTANGLE|rectangle)	{ printf("RECTANGLE\n"); }
(SET_COLOR|set_color)	{ printf("SET_COLOR\n"); }
[0-9]+			{ printf("INT %s\n", yytext); }
[0-9]+\.[0-9]+		{ printf("FLOAT %s\n", yytext); }
-[0-9]			{ printf("ERROR: NEGATIVE NUMBER ON LINE %d\n", yylineno); }
[\n|\t| ]+		;
.			{ printf("ERROR: INVALID SYNTAX AT LINE %d\n", yylineno); }
%%


int main(int argc, char** argv) {
	yylex();
	return 0;
}

