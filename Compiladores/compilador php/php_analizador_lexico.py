import ply.lex as lex

conversion_de_tipos = ['ARRAY_CAST', 'INT_CAST', 'BOOL_CAST', 'DOUBLE_CAST', 'STRING_CAST', 'OBJECT_CAST', 'UNSET_CAST']

simbolos = ['LPAREN', 'RPAREN', 'LBRACKET', 'RBRACKET', 'LBRACE', 'RBRACE', 'COMMA', 'SEMICOLON']

etiquetas = ['OPEN_TAG', 'CLOSE_TAG']
literales = ['NUMBER', 'STRING', 'COMENTARY', 'FALSE', 'TRUE']
identificadores = ['ID']
variables = ['VARIABLE']

reservadas = ['BREAK', 'AND', 'ARRAY', 'AS', 'SWITCH',
                'CATCH', 'CLASS', 'CLONE', 'CONST', 'CONTINUE',
                'DIE', 'DO', 'ECHO', 'ELSE', 'ELSEIF',
                'EMPTY', 'EDDECLARE', 'ENDIF', 'ENDWHILE', 'ENDFOR',
                'ENDFOREACH', 'ENDSWITCH', 'EVAL', 'FINAL', 'FINALLY',
                'FOR', 'FOREACH', 'FUNCTION', 'GLOBAL', 'GOTO',
                'IF', 'IMPLEMENTS', 'INCLUDE', 'INCLUDE_ONCE', 'INSTANCEOF',
                'INTERFACE', 'ISSET', 'LIST', 'NAMESPACE', 'OR',
                'PRINT', 'PRIVATE', 'PUBLIC', 'PROTECTED', 'REQUIRE',
                'REQUIRE_ONCE', 'RETURN', 'STATIC', 'THROW', 'TRY',
                'UNSET', 'VAR', 'WHILE', 'XOR']

aritmeticos = ['PLUS', 'MINUS', 'MUL', 'DIV', 'MOD', 'POW']
logicos = ['BOOLEAN_AND', 'BOOLEAN_OR', 'BOOLEAN_NOT']
bitwise = ['BITWISE_AND', 'BITWISE_OR', 'BITWISE_XOR', 'BITWISE_NOT', 'BITWISE_SL', 'BITWISE_SR']
inc_dec = ['PLUS_PLUS', 'MINUS_MINUS']
asignacion = ['EQUAL', 'PLUS_EQUAL', 'MINUS_EQUAL', 'MUL_EQUAL', 'DIV_EQUAL', 'MOD_EQUAL', 'POW_EQUAL', 
                'AND_EQUAL', 'OR_EQUAL', 'XOR_EQUAL', 'SL_EQUAL', 'SR_EQUAL', 'CONCAT_EQUAL']
comparacion = ['IS_EQUAL', 'IS_IDENTICAL', 'IS_NOT_EQUAL', 'IS_NOT_IDENTICAL', 'COMPARATOR', 'FUSION_OF_NULL',
                'IS_GREATER', 'IS_SMALLER', 'IS_GREATER_OR_EQUAL', 'IS_SMALLER_OR_EQUAL']
otros = ['DOUBLE_ARROW', 'OBJECT_OPERATOR']
operadores = aritmeticos + logicos + asignacion + comparacion + bitwise + inc_dec + otros


tokens = reservadas + identificadores + variables + operadores + literales + simbolos + etiquetas + conversion_de_tipos

# Simbolos
t_LPAREN = r'\('
t_RPAREN = r'\)'
t_LBRACKET = r'\['
t_RBRACKET = r'\]'
t_LBRACE = r'\{'
t_RBRACE = r'\}'
t_COMMA = r','
t_SEMICOLON = r';'

# Operadores
t_PLUS = r'\+'
t_MINUS = r'-'
t_MUL = r'\*'
t_DIV = r'/'
t_MOD = r'%'
t_POW = r'\*\*'
t_PLUS_PLUS = r'\+\+'
t_MINUS_MINUS = r'--'
t_BOOLEAN_AND = r'&&'
t_BOOLEAN_OR = r'\|\|'
t_BOOLEAN_NOT = r'!'
t_BITWISE_AND = r'&'
t_BITWISE_OR = r'\|'
t_BITWISE_XOR = r'\^'
t_BITWISE_NOT = r'~'
t_BITWISE_SL = r'<<'
t_BITWISE_SR = r'>>'
t_EQUAL = r'='
t_PLUS_EQUAL = r'\+='
t_MINUS_EQUAL = r'-='
t_MUL_EQUAL = r'\*='
t_DIV_EQUAL = r'/='
t_MOD_EQUAL = r'%='
t_POW_EQUAL = r'\*\*='
t_SL_EQUAL = r'<<='
t_SR_EQUAL =  r'>>='
t_AND_EQUAL = r'&='
t_OR_EQUAL = r'\|='
t_XOR_EQUAL = r'\^='
t_CONCAT_EQUAL = r'\.='
t_IS_EQUAL = r'=='
t_IS_IDENTICAL = r'==='
t_IS_NOT_EQUAL = r'!=|<>'
t_IS_NOT_IDENTICAL = r'!=='
t_IS_GREATER = r'>'
t_IS_SMALLER = r'<'
t_IS_GREATER_OR_EQUAL = r'>='
t_IS_SMALLER_OR_EQUAL = r'<='
t_COMPARATOR = r'<=>'
t_FUSION_OF_NULL = r'\?\?'
t_DOUBLE_ARROW = r'=>'
t_OBJECT_OPERATOR = r'->'

# Tipos
t_FALSE = r'[Ff][Aa][Ll][Ss][Ee]'
t_TRUE = r'[Tt][Rr][Uu][Ee]'

# Conversion de tipos
def t_ARRAY_CAST(t):
    r'\( [\ \t]* ([Aa][Rr][Rr][Aa][Yy]) [\ \t]* \)'
    t.value = "".join(t.value.split())
    return t

def t_INT_CAST(t):
    r'\( [\ \t]* ([Ii][Nn][Tt][Ee][Gg][Ee][Rr]|[Ii][Nn][Tt]) [\ \t]* \)'
    t.value = "".join(t.value.split())
    return t

def t_BOOL_CAST(t):
    r'\( [\ \t]* ([Bb][Oo][Oo][Ll][Ee][Aa][Nn]|[Bb][Oo][Oo][Ll]) [\ \t]* \)'
    t.value = "".join(t.value.split())
    return t

def t_DOUBLE_CAST(t):
    r'\( [\ \t]* ([Ff][Ll][Oo][Aa][Tt]|[Dd][Oo][Uu][Bb][Ll][Ee]|[Rr][Ee][Aa][Ll]) [\ \t]* \)'
    t.value = "".join(t.value.split())
    return t

def t_STRING_CAST(t):
    r'\( [\ \t]* ([Ss][Tt][Rr][Ii][Nn][Gg]) [\ \t]* \)'
    t.value = "".join(t.value.split())
    return t

def t_OBJECT_CAST(t):
    r'\( [\ \t]* ([Oo][Bb][Jj][Ee][Cc][Tt]) [\ \t]* \)'
    t.value = "".join(t.value.split())
    return t

def t_UNSET_CAST(t):
    r'\( [\ \t]* ([Uu][Nn][Ss][Ee][Tt]) [\ \t]* \)'
    t.value = "".join(t.value.split())
    return t

# Literales
t_NUMBER = r'0[xX][0-9a-fA-F]+ | 0[0-7]+ | 0b[0-1]+ | (0|[1-9][0-9]*)(\.[0-9]+)?([eE]-?(0|[1-9][0-9]*)(\.[0-9]+)?)? | 0'
t_STRING = r'\'((\\\')?[^\']?)*\' | "((\\\")?[^"]?)*"'

# Identificadores
def t_ID(t):
    r'[a-zA-Z_\x7f-\xff][a-zA-Z0-9_\x7f-\xff]*'
    if t.value.upper() in reservadas:
        t.type = t.value.upper()
    return t

# Variables
def t_VARIABLE(t):
    r'\$[a-zA-Z_\x7f-\xff][a-zA-Z0-9_\x7f-\xff]*'
    t.value = t.value[1:]
    return t

t_OPEN_TAG = r'<\?php'
t_CLOSE_TAG = r'\?>'

t_ignore = ' \t\n'

def t_COMENTARY(t):
	r'//(.+)?\n|\#.*\n|/\*.*\*/'

def t_error(t):
    print("caracter ilegal", (t.value[0]))
    t.lexer.skip(1)
    return t

if __name__=='__main__':
	fin = 'ejemplo2.php'
	f = open(fin, 'r')
	data = f.read()
	print(data)
	analizador = lex.lex()
	analizador.input(data)
	while True:
		tok = analizador.token()
		if not tok:
			break
		print(tok)
		