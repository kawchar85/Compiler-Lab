/* A Bison parser, made by GNU Bison 3.8.2.  */

/* Bison interface for Yacc-like parsers in C

   Copyright (C) 1984, 1989-1990, 2000-2015, 2018-2021 Free Software Foundation,
   Inc.

   This program is free software: you can redistribute it and/or modify
   it under the terms of the GNU General Public License as published by
   the Free Software Foundation, either version 3 of the License, or
   (at your option) any later version.

   This program is distributed in the hope that it will be useful,
   but WITHOUT ANY WARRANTY; without even the implied warranty of
   MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
   GNU General Public License for more details.

   You should have received a copy of the GNU General Public License
   along with this program.  If not, see <https://www.gnu.org/licenses/>.  */

/* As a special exception, you may create a larger work that contains
   part or all of the Bison parser skeleton and distribute that work
   under terms of your choice, so long as that work isn't itself a
   parser generator using the skeleton or a modified version thereof
   as a parser skeleton.  Alternatively, if you modify or redistribute
   the parser skeleton itself, you may (at your option) remove this
   special exception, which will cause the skeleton and the resulting
   Bison output files to be licensed under the GNU General Public
   License without this special exception.

   This special exception was added by the Free Software Foundation in
   version 2.2 of Bison.  */

/* DO NOT RELY ON FEATURES THAT ARE NOT DOCUMENTED in the manual,
   especially those whose name start with YY_ or yy_.  They are
   private implementation details that can be changed or removed.  */

#ifndef YY_YY_PP_TAB_H_INCLUDED
# define YY_YY_PP_TAB_H_INCLUDED
/* Debug traces.  */
#ifndef YYDEBUG
# define YYDEBUG 0
#endif
#if YYDEBUG
extern int yydebug;
#endif

/* Token kinds.  */
#ifndef YYTOKENTYPE
# define YYTOKENTYPE
  enum yytokentype
  {
    YYEMPTY = -2,
    YYEOF = 0,                     /* "end of file"  */
    YYerror = 256,                 /* error  */
    YYUNDEF = 257,                 /* "invalid token"  */
    INT = 258,                     /* INT  */
    FLOAT = 259,                   /* FLOAT  */
    DOUBLE = 260,                  /* DOUBLE  */
    VOID = 261,                    /* VOID  */
    ID = 262,                      /* ID  */
    NUM = 263,                     /* NUM  */
    SEMI = 264,                    /* SEMI  */
    ASSIGN = 265,                  /* ASSIGN  */
    GT = 266,                      /* GT  */
    LT = 267,                      /* LT  */
    LE = 268,                      /* LE  */
    GE = 269,                      /* GE  */
    EQ = 270,                      /* EQ  */
    NE = 271,                      /* NE  */
    AND = 272,                     /* AND  */
    OR = 273,                      /* OR  */
    XOR = 274,                     /* XOR  */
    NOT = 275,                     /* NOT  */
    LP1 = 276,                     /* LP1  */
    RP1 = 277,                     /* RP1  */
    LP2 = 278,                     /* LP2  */
    RP2 = 279,                     /* RP2  */
    LP3 = 280,                     /* LP3  */
    RP3 = 281,                     /* RP3  */
    PLUS = 282,                    /* PLUS  */
    MINUS = 283,                   /* MINUS  */
    MUL = 284,                     /* MUL  */
    DIV = 285,                     /* DIV  */
    MOD = 286,                     /* MOD  */
    IF = 287,                      /* IF  */
    ELSE = 288,                    /* ELSE  */
    FOR = 289,                     /* FOR  */
    WHILE = 290,                   /* WHILE  */
    DO = 291,                      /* DO  */
    RETURN = 292,                  /* RETURN  */
    COMMA = 293,                   /* COMMA  */
    INCREMENT = 294,               /* INCREMENT  */
    DECREMENT = 295                /* DECREMENT  */
  };
  typedef enum yytokentype yytoken_kind_t;
#endif

/* Value type.  */
#if ! defined YYSTYPE && ! defined YYSTYPE_IS_DECLARED
typedef int YYSTYPE;
# define YYSTYPE_IS_TRIVIAL 1
# define YYSTYPE_IS_DECLARED 1
#endif


extern YYSTYPE yylval;


int yyparse (void);


#endif /* !YY_YY_PP_TAB_H_INCLUDED  */
