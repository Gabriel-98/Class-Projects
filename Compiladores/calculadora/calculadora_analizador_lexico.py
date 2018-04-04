import ply.lex as lex

tokens = ['SUMA', 'RESTA', 'MULTIPLICACION', 'DIVISION', 'LPAREN', 'RPAREN', 'NUMERO']

t_ignore = ' \t'
t_SUMA = r'\+'
t_RESTA = r'-'
t_MULTIPLICACION = r'\*'
t_DIVISION = r'/'
t_LPAREN = '\('
t_RPAREN = '\)'
t_NUMERO = r'(0|[1-9][0-9]*) (\.[0-9]+)? ([eE]-?(0|[1-9][0-9]*)(\.[0-9]+)?)?'

def t_error(t):
    print("caracter ilegal", t.value[0])
    t.lexer.skip(1)
    return t

if __name__=='__main__':
    while True:
        cadena = input("operacion >>> ")
        if cadena == ".exit":
            break
        analizador = lex.lex()
        analizador.input(cadena)
        while True:
            tok = analizador.token()
            if not tok:
                break
            print(tok)
