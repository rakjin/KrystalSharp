%namespace Parsers
%scannertype KrystalScanner
%visibility internal
%tokentype Token

%option stack, minimize, parser, verbose, persistbuffer, noembedbuffers 

NL					[\n\r]+
WS					[ \t]+
L					[a-zA-Z_]
D					[0-9]
ID					{L}({L}|{D})*
COMMENT_CPP			"//"[^\n]*$

%{

%}

%%

/* Scanner body */

{D}+				{ Console.WriteLine("token: {0}", yytext);		GetNumber(); return (int)Token.NUMBER; }

{NL}+				/* skip */
{WS}+				/* skip */


%%