import ply.lex as lex
import ply.yacc as yacc
from calculadora_analizador_lexico import *

precedence = (
    ('left', 'SUMA', 'RESTA'),
    ('left', 'MULTIPLICACION' , 'DIVISION'),
    ('right', 'UMINUS')
    )

def p_program(p):
    'program : expresion'

def p_expresion(p):
    '''expresion : expresion SUMA expresion
                | expresion RESTA expresion
                | RESTA expresion %prec UMINUS
                | expresion MULTIPLICACION expresion
                | expresion DIVISION expresion
                | LPAREN expresion RPAREN
                | NUMERO'''

def p_error(p):
    print("error de sintaxis", "posicion")

if __name__=='__main__':
    analizador = lex.lex()
    parser = yacc.yacc()
    while True:
        line = input("operacion >>> ")
        result = parser.parse(line)
        
        
