# Lexer Design
This repository contains the source code for a lexer designed for a compiler using Flex. It also provides some basic information on using Flex to create lexers

## Introduction
A lexer is a component of a compiler that takes the source code as input and converts it into a stream of tokens that can be easily parsed by the compiler. Flex is a tool for generating lexical analyzers (i.e., lexers) in C or C++.

## Structure of a Lex Program

A lex program consists of three parts: declarations, rules, and user-defined functions. Regular definitions can be placed in between the Definition section and the Rules section.
```Lex
%{
Definition section
%}

/* Regular definitions can be added here */

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

In the user-defined functions section, you can define any helper functions that you need for your lexer. This section includes a `main` function. This section is for any additional C or C++ code that you want to include. If you redefine input(), unput(), output(), or yywrap(), the new versions or supporting subroutines might be here. The only required line is:
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


## Lex Predefined

Flex provides several predefined variables, functions and options that can be used in your lex program.

### Variables

- `yytext`: The matched string (i.e., the lexeme) of the current rule.
- `yyleng`: The length of current matched strng.
- `yylineno`: The current line number.
- `yyin`: The input stream (i.e., the file or stdin).
- `yyout`: The output stream (i.e., the file or stdout).


### Functions

- `yylex()`: Returns the next token from the input stream.
- `yyrestart()`: Resets the input stream to a new file or stdin.
- `yywrap()`: Returns 1 to indicate the end of input.

### Options
 There are several options available in lex. Here are some commonly used ones:
  - `%option noyywrap`: tells lex not to generate code for handling end-of-file
  - `%option c++`: generates C++ code instead of C code
  - `%option outfile="filename"`: specifies the name of the output file
  - `%option yylineno`: generates code to track line numbers and assign them to the yylineno variable
  - `%option case-insensitive`: makes lex case-insensitive when matching patterns
  - `%option prefix="prefix"`: specifies a prefix to add to all function and variable names
  - `%option warn`: enables warnings during code generation
  - `%option debug`: generates debug information for the generated lexer
These options can be included at the top of the lex file, before the rule definitions. These options affect how lex generates the lexer code and how it behaves during compilation and execution. You can include multiple options separated by spaces, for example:
```lex
%option noyywrap c++
```
or
```lex
%option noyywrap
%option c++
```

## Regular Expression

In Lex patterns are an extended version of the regular expression. Regular expressions are composed of normal characters, which represent themselves, and metacharacters which have special meaning in a pattern.

| Metacharacter | Meaning                                | Example          |
|--------------|----------------------------------------|------------------|
| .            | Matches any single character except the newline character `\n`. | `a.c` matches "abc", "a*c", but not "ac" |
| []           | Match any one of the characters within the brackets. | `[abc]` matches "a", "b", or "c" |
| *            | Matches zero or more of the preceding expression. | `ab*c` matches "ac", "abc", "abbc", and so on |
| +            | Matches one or more occurence of the preceding regular expression. | `ab+c` matches "abc", "abbc", "abbbc", and so on, but not "ac" |
| ?            | Matches zero or one occurrence of the preceding regular expression. | `ab?c` matches "ac" or "abc" |
| {}           | A single number `{n}` means n repetitions of the preceding pattern. `{n,m}` are a minimum and maximum number of repetitions of the preceding pattern. | `[0-9]{3}` matches any three-digit number |
| \            | Used to escape a special character or indicate a special sequence. | `\d` matches any digit, `\n` matches a newline |
| ()           | Group a series of regular expressions together. | `(ab)+` matches "ab", "abab", "ababab", and so on |
| \|           | Match either the preceding regular expression or the subsequent regular expression. | `kalu\|wan` matches "kalu" or "wan" |
| ""           | Match everything within the quotation marks literally. | `"Hello World"` matches "Hello World" |
| /            | Matches the preceding regular expression but only if followed by the following regular expression. | `0/1` matches "0" in the string "01" but not "0" or "02" |
| ^            | Matches the beginning of a line. | `^Hello` matches "Hello" at the beginning of a line |
| $            | Matches the end of a line. | `World$` matches "World" at the end of a line |
| <>           | A name or list of names in angle brackets at the beginning of a pattern makes that pattern apply only in the given start states. | `<INITIAL> {letter}` matches a letter only in the `INITIAL` state |
| `<<EOF>>`      | Matches the end of file. | `<<EOF>>` matches the end of a file |

### Pattern Matching Examples

| Expression         | Matches                                                |
|--------------------|--------------------------------------------------------|
| abc                | abc                                                    |
| abc*               | ab, abc, abcc, abccc, ...                              |
| abc+               | abc, abcc, abccc, ...                                   |
| a(bc)+             | abc, abcbc, abcbcbc, ...                                 |
| a(bc)?             | a, abc                                                  |
| [abc]              | one of: a, b, c                                         |
| [a-z]              | any letter, a-z                                         |
| [a\-z]             | one of: a, -, z                                         |
| [-az]              | one of: -, a, z                                         |
| [A-Za-z0-9]+       | one or more alphanumeric characters                    |
| [ \t\n]+           | whitespace                                             |
| [^ab]              | anything except: a, b                                   |
| [a^b]              | one of: a, ^, b                                         |
| [a\|b]             | one of: a, \|, b                                        |
| a\|b               | one of: a, b                                            |




 ## Usage: 
 ```
 flex sample1.l
 gcc lex.yy.c
 ./a.exe
 ```
 
 
