%namespace Parsers
%partial
%parsertype KrystalParser
%visibility internal
%tokentype Token

%union { 
			public int n; 
			public string s; 
	   }

%start main

%token NUMBER

%token BLOCK_BEGIN BLOCK_END
%token LT GT
%token SEMICOLON COMMA

%%

main   : number
       ;

number : 
       | NUMBER							{ Console.WriteLine("Rule -> number: {0}", $1.n); }
       ;

%%