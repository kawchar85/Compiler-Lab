%option noyywrap
%{
#include "pp.tab.h"
%}
digit [0-9]
letter [a-zA-Z]
id (_|{letter})({letter}|{digit})*
number [-+]?{digit}*\.?{digit}+([eE][-+]?{digit}+)?
ws [ \t\n]
delim ({ws})+
%%
{delim} {}
"int" {return INT;}
"float" {return FLOAT;}
"double" {return DOUBLE;}
"void" {return VOID;}
"if" {return IF;}
"else" {return ELSE;}
"for" {return FOR;}
"while" {return WHILE;}
"do" {return DO;}
"return" {return RETURN;}
"," {return COMMA;}
";" {return SEMI;}
"(" {return LP1;}
")" {return RP1;}
"{" {return LP2;}
"}" {return RP2;}
"[" {return LP3;}
"]" {return RP3;}
"++" {return INCREMENT;}
"--" {return DECREMENT;}
"+" {return PLUS;}
"-" {return MINUS;}
"*" {return MUL;}
"/" {return DIV;}
"%" {return MOD;}
"=" {return ASSIGN;}
"==" {return EQ;}
"!=" {return NE;}
"<" {return LT;}
"<=" {return LE;}
">" {return GT;}
">=" {return GE;}
"&" {return AND;}
"|" {return OR;}
"^" {return XOR;}
"~" {return NOT;}
{id} {return ID;}
{number} {return NUM;}

