%{ 
#include <stdio.h> 
int keywords = 0; 
int operator = 0; 
int constants = 0; 
int special = 0; 
int identifiers = 0; 
%} 
%% 
int|float|char|return|for|while|do|if|else {keywords++;} 
[\+\-\=\/] {operator++;} 
[0-9]+ {constants++;} 
[/%/&/;/$] {special++;} 
[_||a-zA-Z][_a-zA-Z0-9]* {identifiers++;} 
%% 
int yywrap() 
{ 
return 1; 
} 
void main() 
{ 
printf("Enter Line of code\n"); 
yylex(); 
printf("Keywords: %d\n", keywords); 
printf("Operators: %d\n", operator); 
printf("constants: %d\n", constants); 
printf("Identifier: %d\n", identifiers); 
printf("Special Symbols: %d\n", special); 
}