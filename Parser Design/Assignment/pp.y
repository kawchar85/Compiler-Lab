%{
#include <stdio.h>
extern int yylex();
void yyerror(char *s);
%}

%token INT FLOAT DOUBLE VOID ID NUM SEMI ASSIGN GT LT LE GE EQ NE AND OR XOR NOT LP1 RP1 LP2 RP2 LP3 RP3 PLUS MINUS MUL DIV MOD IF ELSE FOR WHILE DO RETURN COMMA INCREMENT DECREMENT
%start start
%%

start: stmts ;

stmts: /* empty */
     | stmts stmt
     ;

type: INT
    | FLOAT
    | DOUBLE
    ;

array: LP3 rval RP3 ;

op_array: /* empty */
        | op_array array
        ;

lval: ID op_array
    | type ID op_array ;

ar_op: PLUS
     | MINUS
     | MUL
     | DIV
     | MOD
     ;

re_op: EQ
     | NE
     | LT
     | LE
     | GT
     | GE
     ;

bw_op: AND
     | OR
     | XOR
     | NOT
     ;

op: ar_op
  | re_op
  | bw_op
  ;

rval: NUM
     | fncall
     | apply_inc_dec
     | ID op_array
     | rval op rval
     | LP1 rval RP1
     ;

params: /* empty */
      | type ID para_more
      ;
 
para_more: /*empty */
	 | COMMA type ID para_more
	 ;
	
pass_para: /* empty */
	 | rval pass_more
	 ;
	 
pass_more: /* empty */
	 | COMMA rval pass_more
	 ;
	 
fncall: ID LP1 pass_para RP1
      ;

op_block: stmt
	| LP2 stmts RP2
	;

op_else: /* empty */
       | ELSE op_block
       ;

var_decl: type ID set_val decl_more;
		 
decl_more: /* empty */
	 | COMMA ID set_val decl_more
  	 ;
  	 
set_val: /* empty */
       | ASSIGN rval

inc_dec: INCREMENT
       | DECREMENT
       ;
apply_inc_dec: ID inc_dec
	     | inc_dec ID
	     ;

for_last: /* empty */
	| for_last_stmts
	;

for_last_stmts: apply_inc_dec for_last_more
	      | ID ASSIGN rval for_last_more
	      ;

for_last_more: /* empty */
	     | COMMA for_last_stmts
	

stmt: ID set_val decl_more SEMI
    | var_decl SEMI
    | lval ar_op ASSIGN rval SEMI
    | lval bw_op ASSIGN rval SEMI
    | IF LP1 rval RP1 op_block op_else
    | FOR LP1 stmt rval SEMI for_last RP1 op_block
    | WHILE LP1 rval RP1 op_block
    | DO op_block WHILE LP1 rval RP1 SEMI
    | type ID LP1 params RP1 LP2 stmts RETURN rval SEMI RP2
    | VOID ID LP1 params RP1 LP2 stmts RP2
    | fncall SEMI
    | apply_inc_dec SEMI
    ;

%%
void yyerror(char *s) {
   fprintf(stderr, "Error: %s\n", s);
}

int main() {
   yyparse();
   return 0;
}

