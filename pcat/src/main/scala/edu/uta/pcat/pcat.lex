/********************************************************************************
*
* File: pcat.lex
* The PCAT scanner
*
********************************************************************************/

package edu.uta.pcat;

import java_cup.runtime.Symbol;

%%
%class PcatLex
%public
%line
%column
%cup
%state comment

%{

  private Symbol symbol ( int type ) {
    return new Symbol(type, yyline, yycolumn);
  }

  private Symbol symbol ( int type, Object value ) {
    return new Symbol(type, yyline, yycolumn, value);
  }

  public void lexical_error ( String message ) {
    throw new Error("*** Lexical Error: " + message + " (line: " + yyline
                    + ", position: " + yycolumn + ")");
  }
%}
DIGIT=[0-9]
ID=[a-zA-Z][a-zA-Z0-9]*
InputCharacter = [^\r\n]
LineTerminator = \r|\n|\r\n

Comment = {TraditionalComment} | {EndOfLineComment} | {DocumentationComment} | {GeneralContent}

TraditionalComment   = "/*" [^*] ~"*/" | "/*" "*"+ "/"
EndOfLineComment     = "//" {InputCharacter}* {LineTerminator}?
DocumentationComment = "/**" {CommentContent} "*"+ "/"
GeneralContent		 =	"(*"{CommentContent} "*"+")"
CommentContent       = ( [^*] | \*+ [^/*] )*

%%

"PROGRAM"				{ return symbol(sym.PROGRAM); }
"IS"					{ return symbol(sym.IS); }
"BEGIN"         		{ return symbol(sym.BEGIN); }
"AND"					{ return symbol(sym.AND); }
"ARRAY"					{ return symbol(sym.ARRAY); }
"BY"					{ return symbol(sym.BY); }
"DIV"					{ return symbol(sym.DIV); }
"PROCEDURE"				{ return symbol(sym.PROCEDURE); }
"RECORD"				{ return symbol(sym.RECORD); }
"THEN"					{ return symbol(sym.THEN); }
"TO"					{ return symbol(sym.TO); }
"TYPE"					{ return symbol(sym.TYPE); }
"VAR"					{ return symbol(sym.VAR); }
"WHILE"					{ return symbol(sym.WHILE); }
"WRITE"					{ return symbol(sym.WRITE); }
":="					{ return symbol(sym.ASGN); }
"OR"					{ return symbol(sym.OR); }
"NOT"					{ return symbol(sym.NOT); }
"OF"					{ return symbol(sym.OF); }
"DO"					{ return symbol(sym.DO); }
"WHILE"					{ return symbol(sym.WHILE); }
"ELSE"					{ return symbol(sym.ELSE); }
"ELSIF"					{ return symbol(sym.ELSIF); }
"RETURN"				{ return symbol(sym.RETURN); }
"READ"					{ return symbol(sym.READ); }
"END"					{ return symbol(sym.END); }
"EXIT"					{ return symbol(sym.EXIT); }
"FOR"					{ return symbol(sym.FOR); }
"IF"					{ return symbol(sym.IF); }
"LOOP"					{ return symbol(sym.LOOP); }
"MOD"					{ return symbol(sym.MOD); }
"("						{ return symbol(sym.LPAREN); }
")"						{ return symbol(sym.RPAREN); }
";"						{ return symbol(sym.SEMI); }
":"						{ return symbol(sym.COLON); }
"+"						{ return symbol(sym.PLUS); }
"-"						{ return symbol(sym.MINUS); }
"*"						{ return symbol(sym.TIMES); }
"/"						{ return symbol(sym.SLASH); }
","						{ return symbol(sym.COMMA); }
"<"						{ return symbol(sym.LT); }
"<="					{ return symbol(sym.LEQ); }
">"						{ return symbol(sym.GT); }
">="					{ return symbol(sym.GEQ); }
"."						{ return symbol(sym.DOT); }
"="						{ return symbol(sym.EQ); }
"<>"					{ return symbol(sym.NEQ); }
"["						{ return symbol(sym.LSQBRA); }
"]"						{ return symbol(sym.RSQBRA); }
"{"						{ return symbol(sym.LCUBRA); }
"}"						{ return symbol(sym.RCUBRA); }
\"[^\"]*\"              { return symbol(sym.STRING_LITERAL,yytext().substring(1,yytext().length()-1)); }
[ \t\r\n\f]             { /* ignore white spaces. */ }
{Comment}		            { /* ignore */ }
{DIGIT}+"."{DIGIT}+     { return symbol(sym.REAL_LITERAL, new Float(yytext())); }
{DIGIT}+                { return symbol(sym.INTEGER_LITERAL, new Integer(yytext())); }
{ID}					{ return symbol(sym.ID,yytext()); }