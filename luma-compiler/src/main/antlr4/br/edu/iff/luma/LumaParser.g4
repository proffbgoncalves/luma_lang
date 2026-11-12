parser  grammar LumaParser;

options {tokenVocab=LumaLexer;}

programa
 : declaracaoModulo declaracao* blocoMain EOF
 ;
declaracaoModulo
 : MODULE ID SEMI
 ;
blocoMain
 : MAIN bloco
 ;

declaracao
 : declaracaoConstante
 | declaracaoVariavel
 | declaracaoStruct
 | declaracaoFuncao
 | declaracaoProcedimento
 ;
declaracaoConstante
 : CONST ID COLON tipo ASSIGN expressao SEMI
 ;
declaracaoVariavel
 : VAR ID COLON tipo (ASSIGN expressao)? SEMI
 ;
declaracaoStruct
 : STRUCT ID LBRACE campoStruct+ RBRACE
 ;
campoStruct
 : ID COLON tipo SEMI
 ;
declaracaoFuncao
 : FUNCTION ID LPAREN listaParametros? RPAREN
 ARROW tipo bloco
 ;
declaracaoProcedimento
 : PROCEDURE ID LPAREN listaParametros? RPAREN bloco
 ;
listaParametros
 : parametro (COMMA parametro)*
 ;
parametro
 : ID COLON tipo
 ;
tipo
 : tipoBase (LBRACK INT_LITERAL RBRACK)?
 ;
tipoBase
 : INT
 | FLOAT
 | BOOL
 | CHAR
 | STRING
 | ID
 ;

bloco
 : LBRACE comando* RBRACE
 ;
comando
 : comandoAtribuicao
 | comandoRead
 | comandoPrint
 | comandoIf
 | comandoSwitch
 | comandoWhile
 | comandoFor
 | comandoRepeat
 | comandoBreak
 | comandoContinue
 | comandoReturn
 | comandoChamada
 ;
comandoAtribuicao
 : referencia ASSIGN expressao SEMI
 ;
comandoRead
 : READ LPAREN referencia RPAREN SEMI
 ;
comandoPrint
 : PRINT LPAREN listaExpressoes RPAREN SEMI
 ;
listaExpressoes
 : expressao (COMMA expressao)*
 ;

comandoIf
 : IF LPAREN expressao RPAREN bloco
 (ELSE (comandoIf | bloco))?
 ;
comandoSwitch
 : SWITCH LPAREN expressao RPAREN
 LBRACE casoSwitch* defaultSwitch? RBRACE
 ;
casoSwitch
 : CASE literalCase bloco
 ;
defaultSwitch
 : DEFAULT bloco
 ;
literalCase
 : INT_LITERAL
 | CHAR_LITERAL
 | STRING_LITERAL
 | TRUE
 | FALSE
 ;
comandoWhile
 : WHILE LPAREN expressao RPAREN bloco
 ;
comandoFor
 : FOR ID FROM expressao TO expressao
 STEP expressao bloco
 ;
comandoRepeat
 : REPEAT bloco UNTIL LPAREN expressao RPAREN SEMI
 ;
comandoBreak
 : BREAK SEMI
 ;
comandoContinue
 : CONTINUE SEMI
 ;
comandoReturn
 : RETURN expressao SEMI
 ;
comandoChamada
 : chamada SEMI
 ;

referencia
 : ID (LBRACK expressao RBRACK | DOT ID)*
 ;
chamada
 : ID LPAREN argumentos? RPAREN
 ;
argumentos
 : expressao (COMMA expressao)*
 ;
expressao
 : expressaoOu
 ;
expressaoOu
 : expressaoE (OR expressaoE)*
 ;
expressaoE
 : expressaoIgualdade (AND expressaoIgualdade)*
 ;
expressaoIgualdade
 : expressaoRelacional
 ((EQ | NEQ) expressaoRelacional)?
 ;
expressaoRelacional
 : expressaoAditiva
 ((LT | LE | GT | GE) expressaoAditiva)?
 ;
expressaoAditiva
 : expressaoMultiplicativa
 ((PLUS | MINUS) expressaoMultiplicativa)*
 ;
expressaoMultiplicativa
 : expressaoUnaria
 ((STAR | SLASH | PERCENT) expressaoUnaria)*
 ;
expressaoUnaria
 : (NOT | MINUS) expressaoUnaria
 | expressaoPrimaria
 ;
expressaoPrimaria
 : literal
 | chamada
 | referencia
 | LPAREN expressao RPAREN
 ;
literal
 : INT_LITERAL
 | FLOAT_LITERAL
 | TRUE
 | FALSE
 | CHAR_LITERAL
 | STRING_LITERAL
 ;