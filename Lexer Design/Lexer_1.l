%option noyywrap

%{
#include <stdio.h>
#include <stdlib.h>
#include <string.h>
%}

DIGIT [0-9]
DIGITS {DIGIT}+
LETTER [a-zA-Z]
LETTER_ {LETTER}|_
IDENTIFIER {LETTER_}({LETTER_}|{DIGIT})*
NUMBER [-+]?{DIGITS}(\.{DIGITS})?([eE][-+]?{DIGITS})?
STRING \".*\"
LOOP while|for
KEYWORDS void|int|float|return
OPERATOR "--"|[+\-*\/\%]|[><]=?|[=!]?=
WSPACE  [ \t\r\n] 
PARA {WSPACE}*\(.*\)
ONE_COMMENT \/\/.* 
MULTI_COMMENT \/\*([^*]|(\*+([^*/])))*\*+\/
COMMENT {ONE_COMMENT}|{MULTI_COMMENT}
%%
{IDENTIFIER}/{PARA} { printf("Function: %s\n", yytext); }
{COMMENT}	  { printf("COMMENT: %s\n", yytext); }
{LOOP}    	  { printf("LOOPing Keyword: %s\n", yytext); }
{KEYWORDS}    { printf("KEYWORD: %s\n", yytext); }
{OPERATOR}    { printf("OPERATOR: %s\n", yytext); }
{NUMBER}      { printf("NUMBER: %s\n", yytext); }
{STRING}      { printf("STRING Literal: %s\n", yytext); }
{IDENTIFIER}  { printf("IDENTIFIER: %s\n", yytext); }
{WSPACE}      {/* ignore whitespace */}
[\(]		  { printf("Opening parenthesis: %s\n", yytext); }
[\)]		  { printf("Closing parenthesis: %s\n", yytext); }
[\{]		  { printf("Opening Curly Brace: %s\n", yytext); }
[\}]		  { printf("Closing Curly Brace: %s\n", yytext); }
,			  { printf("Comma Separotor: %s\n", yytext); }
;			  { printf("Semicolon: %s\n", yytext); }
"."           { printf("Invalid character: %s\n", yytext); }

%%

int main(int argc, char** argv) {

    int hasInputFile = 1, hasOutputFile = 1; //assuming I have a input and output file, If i found I will use these, otherwose I will use terminal for Input and/or output
    FILE* input_file = fopen("Kawchar Husain - Assignment1.txt", "r");
    FILE* output_file = fopen("output.txt", "w");
	
    if (!input_file) {
        //no input file found
        hasInputFile = 0;
    } else {
        yyin = input_file;
    }
	
    if (!output_file) {
        //no output file found
        hasOutputFile = 0;
    } else {
        yyout = output_file;
    }
    
    yylex();

    if(hasInputFile) {
        fclose(input_file);
    }
    if(hasOutputFile) {
        fclose(output_file);
    }
    return 0;
}
