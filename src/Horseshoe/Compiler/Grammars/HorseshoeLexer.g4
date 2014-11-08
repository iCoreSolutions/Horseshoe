lexer grammar HorseshoeLexer;

@lexer::header {#pragma warning disable 3021}

COMMENT 
   : '{{!--' .*? '--}}' -> channel(HIDDEN)
   ;

OPEN
   : '{{' -> pushMode(INTAG)
	;
	
OPEN_UNESC
    : '{{{'	-> pushMode(INTAG)
    ;

DATA 
   : . 
   ;

mode INTAG;


LPAREN
   : '('
   ;

RPAREN
   : ')'
   ;

CLOSE_UNESC 
   : '}}}' -> popMode
   ;

CLOSE 
   : '}}' -> popMode
	;

SLASH	
   : '/' 
	;

ALPHA	
   : '@'
	;

TILDE
   : '~'
   ;

DOT
   : '.'
	;

IF	
   : 'if' 
	;

FOREACH
   : 'foreach'
   ;

CALL
   : 'call'
   ;

IN
   : 'in'
   ;

ELSE
   : 'else'
   ;

TEMPLATE
   : 'template'
   ;

MODULE
   : 'module'
   ;

COLON	
   : ':'
   ;

HASH
   : '#'
   ;

NOT 
   : '!'
   ;

TOPSCOPE
   : '::'
   ;

IDENTIFIER 
   : [a-zA-Z_][a-zA-Z_0-9]*
	;

WS	  
   : ( '\t' | ' ' | '\r' | '\n'| '\u000C' )+ -> channel(HIDDEN)
   ;