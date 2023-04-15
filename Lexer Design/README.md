# Lexer Design
This repository contains the source code for a Lexer designed for a compiler using Flex. The Lexer is responsible for analyzing the source code and converting it into a stream of tokens that can be parsed by the compiler.

## Introduction
A lexer is a component of a compiler that takes the source code as input and converts it into a stream of tokens that can be easily parsed by the compiler. Flex is a tool for generating lexical analyzers (i.e., lexers) in C or C++.

## Structure of a Lex Program

A lex program consists of three parts: declarations, rules, and user-defined functions.
```Lex
%{
Definition section
%}

%%
Rules section
%%

User Subroutine section 
```

### Declarations

The declarations section is the place to define macros, global variables and import header files written in C. It is also possible to write any C code here, which will be copied into the generated source file. The declarations section is enclosed in `%{` and `%}`.

For example:
```Lex
%{
#include <stdio.h>
int line_num = 1;
%}
```

### Rules
In the rules section, you define the patterns that the lexer will match and the corresponding actions to be taken when a match is found. Each rule is made up of two parts: a pattern and an action separated by whitespace.
```
pattern {action}
```
The rules section is enclosed in `%%`.

For example:
``` Lex
%%
"+" { printf("PLUS\n"); }
"-" { printf("MINUS\n"); }
"*" { printf("TIMES\n"); }
"/" { printf("DIVIDE\n"); }
[0-9]+ { printf("NUMBER\n"); }
. { printf("UNKNOWN\n"); }
\n { line_num++; }
%%
```

In this example, the first four rules match the arithmetic operators `+`, `-`, `*`, and `/`, respectively, and print the corresponding token types to the console. The fifth rule matches a sequence of digits and prints the `NUMBER` token type. The sixth rule matches any character that doesn't match the previous rules and prints the `UNKNOWN` token type. The seventh rule matches a newline character and increments the `line_num` variable. 

### User-defined Functions

In the user-defined functions section, you can define any helper functions that you need for your lexer. This section includes a `main` function. This section is for any additional C or C++ code that you want to include. The only required line is:
```C
main() { yylex(); }
```
This is the main function for the resulting program. Lex builds the yylex() function that is called, and will do all of the work for you. Other functions here can be called from the rules section.

For example:
```lex
void report_error(const char* message) {
  printf("ERROR: %s\n", message);
}
int yywrap() {
  return 1;
}
void print_count() {
    printf("Number of lines: %d\n", line_num);
}
int main() {
    yylex();
    print_count();
    return 0;
}
```

 # Usage: 
 ```
 flex sample1.lex
 gcc lex.yy.c
 ./a.exe
 ```
 
 
