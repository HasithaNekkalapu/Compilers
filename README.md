# Compilers
PCAT Compiler
 +There are 6 phases in the construction of a Compiler
 +1) Lexical Analysis: Implement the PCAT scanner using the JFLex scanner generator
 +2) Parsing: Use the CUP parser generator to implement the PCAT parser
 +3) Generate abstract syntax trees: Add semantic actions to the PCAT parser to generate ASTs.
 +4) type-checking: implement the type checking program for PCAT.
 +5) Code Generation: add code to your parser to generate intermediate code (IR trees) from ASTs.
 +6) Instruction selection: This is the final stage in which PCAT compiler generate MIPS code and run it using SPIM
