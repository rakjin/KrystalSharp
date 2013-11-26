%namespace Parsers
%scannertype KrystalScanner
%visibility internal
%tokentype Token

%option stack, minimize, parser, verbose, persistbuffer, noembedbuffers

%x					COMMENT_C

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

{COMMENT_CPP}		{ Console.WriteLine("\tC++ style comment: {0}", yytext); }

"/*"				{ Console.Write("\tC style comment begin\n\t\t"); BEGIN(COMMENT_C); }
<COMMENT_C>"*/"		{ Console.WriteLine("\n\tC style comment end"); BEGIN(INITIAL); }
<COMMENT_C>{NL}		{ Console.Write("\n\t\t"); }
<COMMENT_C>.		{ Console.Write("{0}", yytext); }

"{"					{ return (int)Token.BLOCK_BEGIN; }
"}"					{ return (int)Token.BLOCK_END; }
"<"					{ return (int)Token.LT; }
">"					{ return (int)Token.GT; }
";"					{ return (int)Token.SEMICOLON; }
","					{ return (int)Token.COMMA; }

%%