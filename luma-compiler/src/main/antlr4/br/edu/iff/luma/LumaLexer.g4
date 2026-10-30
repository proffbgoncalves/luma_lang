lexer grammar LumaLexer;

MODULE : 'module';
MAIN : 'main';
CONST : 'const';
VAR : 'var';
STRUCT : 'struct';
FUNCTION : 'function';
PROCEDURE : 'procedure';
RETURN : 'return';
IF : 'if';
ELSE : 'else';
SWITCH : 'switch';
CASE : 'case';
DEFAULT : 'default';
WHILE : 'while';
FOR : 'for';
FROM : 'from';
TO : 'to';
STEP : 'step';
REPEAT : 'repeat';
UNTIL : 'until';
BREAK : 'break';
CONTINUE : 'continue';
READ : 'read';
PRINT : 'print';
TRUE : 'true';
FALSE : 'false';
INT : 'int';
FLOAT : 'float';
BOOL : 'bool';
CHAR : 'char';
STRING : 'string';
AND : 'and';
OR : 'or';
NOT : 'not';
ARROW : '->';
EQ : '==';
NEQ : '!=';
LE : '<=';
GE : '>=';
ASSIGN : '=';
LT : '<';
GT : '>';
PLUS : '+';
MINUS : '-';
STAR : '*';
SLASH : '/';
PERCENT : '%';
COLON : ':';
SEMI : ';';
COMMA : ',';
DOT : '.';
LPAREN : '(';
RPAREN : ')';
LBRACE : '{';
RBRACE : '}';
LBRACK : '[';
RBRACK : ']';
FLOAT_LITERAL
: DIGIT+ '.' DIGIT+
;
INT_LITERAL
: DIGIT+
;
CHAR_LITERAL
: '\'' ~['\r\n] '\''
;
STRING_LITERAL
: '"' ~["\r\n]* '"'
;
ID
: [a-zA-Z_] [a-zA-Z0-9_]*
;
LINE_COMMENT
: '//' ~[\r\n]* -> skip
;
BLOCK_COMMENT
: '/*' .*? '*/' -> skip
;
WS
: [ \t\r\n]+ -> skip
;
fragment DIGIT
: [0-9]
;