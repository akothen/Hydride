import ply.lex as lex
import ply.yacc as yacc
import sys
from VISAAST import *

visa_type = ['UD', 'D', 'bit']
reserved_types = []


class SimpleParser(object):
    # List of token names.   This is always required

    reserved = [
        'FOR',
        'IF',
        'ELSE',
        'WHILE',
        'IS',
        'REL_OP'
    ]
    tokens = [
        'CONSTANT',
        'IDENTIFIER',
        'STRING',
        'LEFT_OP',
        'RIGHT_OP',
        'LE_OP',
        'GE_OP',
        'EQ_OP',
        'NE_OP',
        'LAND_OP',
        'LOR_OP',
        'INC_OP',
        'DEC_OP',
        'ADD_ASSIGN',
    ] + list(reserved)+reserved_types+visa_type

    # Regular expression rules for simple tokens
    literals = "+-*/()[]{}=,.;?:<>!~&|^%~"
    t_LEFT_OP = r"<<"
    t_RIGHT_OP = r">>"
    t_LE_OP = r"<="
    t_GE_OP = r">="
    t_EQ_OP = r"=="
    t_NE_OP = r"!="
    t_LAND_OP = r"&&"
    t_LOR_OP = r"\|\|"
    t_INC_OP = r"\+\+"
    t_DEC_OP = r"\-\-"
    t_ADD_ASSIGN = r"\+="

    # A regular expression rule with some action code
    # Note addition of self parameter since we're in a class

    def t_STRING(self, t):
        r"\'([^\\\n]|(\\.))*?\'"
        t.value = t.value[1:-1]
        return t

    def t_HEX_CONSTANT(self, t):
        r'0x[a-fA-F0-9]+'
        t.type = "CONSTANT"
        t.value = int(t.value, 16)
        return t

    def t_FLOAT_CONSTANT(self, t):
        r'\d+\.\d*[f]?'
        t.type = "CONSTANT"
        t.value = float(t.value.rstrip('f'))
        return t

    def t_CONSTANT(self, t):
        r'\d+'
        t.value = int(t.value)
        return t

    def t_COMMENT(self, t):
        r'//.*'
        pass

    # Define a rule so we can track line numbers
    def t_newline(self, t):
        r'\n+'
        t.lexer.lineno += len(t.value)

    def t_IDENTIFIER(self, t):
        r'[a-zA-Z_][a-zA-Z_0-9]*'
        # Check for reserved words
        if t.value in visa_type:
            t.type = t.value
        elif t.value.upper() in self.reserved:
            t.type = t.value.upper()
        else:
            t.type = 'IDENTIFIER'

        return t

    # A string containing ignored characters (spaces and tabs)
    t_ignore = ' \t'

    lex_error = False
    parse_error = False

    # Error handling rule
    def t_error(self, t):
        # assert False, "Illegal character '%s'" % t.value[0]
        print("Illegal character '%s'" % t.value[0], file=sys.stderr)
        t.lexer.skip(1)
        self.lex_error = True

    def p_primary_expression(self, p):
        '''primary_expression : IDENTIFIER
        | CONSTANT
        | '(' expression ')'
        '''
        if len(p) == 2:
            if type(p[1]) == int:
                p[0] = Number(p[1])
            else:
                p[0] = Var(p[1])
        else:
            p[0] = p[2]

    def p_postfix_expression(self, p):
        '''postfix_expression : primary_expression
        | postfix_expression '[' expression ']'
        | postfix_expression '[' expression ':' expression ']'
        | postfix_expression '.' IDENTIFIER
        | postfix_expression '(' ')'
        | postfix_expression '(' argument_expression_list ')'
        | postfix_expression INC_OP
        '''
        if len(p) == 2:
            p[0] = p[1]
        elif len(p) == 4 and p[2] == '.':
            p[0] = Member(p[1], p[3])
        elif len(p) == 7 and p[2] == '[':
            p[0] = ArraySlice(p[1], p[3], p[5])
        elif len(p) == 5 and p[2] == '[':
            p[0] = ArrayIndex(p[1], p[3])
        elif len(p) == 4 and p[2] == '(':
            p[0] = Call(p[1].name, [])
        elif len(p) == 5 and p[2] == '(':
            p[0] = Call(p[1].name, p[3])
        elif len(p) == 3 and p[2] == '++':
            # TODO: check if this is correct
            p[0] = Update('=', p[1], BinaryExpr('+', p[1], Number(1)))
        else:
            assert False

    def p_unary_expression(self, p):
        '''unary_expression : postfix_expression
        | '-' unary_expression
        | '!' unary_expression
        | '*' unary_expression
        | '&' unary_expression
        | INC_OP unary_expression
        | DEC_OP unary_expression
        | '~' unary_expression
        '''
        if len(p) == 2:
            p[0] = p[1]
        else:
            p[0] = UnaryExpr(p[1], p[2])

    def p_argument_expression_list(self, p):
        '''argument_expression_list : expression
        | argument_expression_list ',' expression
        '''
        if len(p) == 2:
            p[0] = [p[1]]
        else:
            p[0] = p[1]+[p[3]]

    def p_binary_expression(self, p):
        '''multiplicative_expression : unary_expression
        | multiplicative_expression '*' unary_expression
        | multiplicative_expression '/' unary_expression
        | multiplicative_expression '%' unary_expression
        additive_expression : multiplicative_expression
        | additive_expression '+' multiplicative_expression
        | additive_expression '-' multiplicative_expression
        shift_expression : additive_expression
        | shift_expression LEFT_OP additive_expression
        | shift_expression RIGHT_OP additive_expression
        relational_expression : shift_expression
        | relational_expression '<' shift_expression
        | relational_expression '>' shift_expression
        | relational_expression LE_OP shift_expression
        | relational_expression GE_OP shift_expression
        | relational_expression REL_OP shift_expression
        equality_expression : relational_expression
        | equality_expression EQ_OP relational_expression
        | equality_expression NE_OP relational_expression
        and_expression : equality_expression
        | and_expression '&' equality_expression
        exclusive_or_expression : and_expression
        | exclusive_or_expression '^' and_expression
        inclusive_or_expression : exclusive_or_expression
        | inclusive_or_expression '|' exclusive_or_expression
        logical_and_expression : inclusive_or_expression
        | logical_and_expression LAND_OP inclusive_or_expression
        logical_or_expression : logical_and_expression
        | logical_or_expression LOR_OP logical_and_expression
        logical_is_expression : logical_or_expression
        | logical_or_expression IS logical_or_expression
        '''
        if len(p) == 2:
            p[0] = p[1]
        else:
            p[0] = BinaryExpr(p[2], p[1], p[3])

    def p_conditional_expression(self, p):
        '''conditional_expression : logical_is_expression
        | logical_is_expression '?' expression ':' conditional_expression
        '''
        if len(p) == 2:
            p[0] = p[1]
        else:
            p[0] = IfElseExpr(p[1], p[3], p[5])

    def p_expression(self, p):
        '''expression : conditional_expression
        | unary_expression '=' conditional_expression
        | unary_expression ADD_ASSIGN conditional_expression
        '''
        if len(p) == 2:
            p[0] = p[1]
        else:
            p[0] = Update(p[2], p[1], p[3])

    def p_expression_statement(self, p):
        '''expression_statement : ';'
        | expression ';'
        '''
        if len(p) == 2:
            p[0] = None
        else:
            p[0] = p[1]

    def p_selection_statement(self, p):
        '''selection_statement : IF '(' expression ')' statement
        | IF '(' expression ')' statement ELSE statement
        '''
        if len(p) == 8:
            p[0] = IfElseStmt(p[3], p[5], p[7])
        else:
            p[0] = IfStmt(p[3], p[5])

    # def p_case_statement(self, p):
    #     '''case_statement : WHEN expression OF statement
    #     '''
    #     p[0] = Case(p[2], p[4])

    # def p_case_statement_base(self, p):
    #     '''case_statement : OTHERWISE statement
    #     '''
    #     p[0] = CaseBase(p[2])

    def p_iteration_statement(self, p):
        '''iteration_statement : WHILE '(' expression ')' statement
        | FOR '(' expression_statement expression_statement expression ')' statement
        '''
        # FOR '(' expression_statement expression_statement ')' statement
        if len(p) == 8:
            p[0] = For(p[3], p[4], p[5], p[7])
        else:
            p[0] = While(p[3], p[5])

    def p_compound_statement(self, p):
        '''compound_statement : '{' '}'
        | '{' statement_list '}'
        | '{' declaration_list '}'
        | '{' declaration_list statement_list '}'
        '''
        if len(p) == 3:
            p[0] = []
        elif len(p) == 4:
            p[0] = p[2]
        else:
            p[0] = p[2]+p[3]

    def p_statement(self, p):
        '''statement : expression_statement
        | compound_statement
        | iteration_statement
        | selection_statement
        '''
        p[0] = p[1]

    def p_statement_list(self, p):
        '''statement_list : statement
        | statement_list statement
        '''
        if len(p) == 2:
            p[0] = [p[1]]
        else:
            p[0] = p[1]+[p[2]]

    def p_declaration_list(self, p):
        '''
        declaration_list : declaration
        | declaration_list declaration
        '''
        if len(p) == 2:
            p[0] = [p[1]]
        else:
            p[0] = p[1]+[p[2]]

    def p_declaration(self, p):
        '''
        declaration : declaration_specifiers init_declarator_list ';'
        '''
        # if isinstance(p[2][0], Update):
        #     p[0] = VarDeclInit(VarsDecl([p[2][0].lhs], p[1],
        #                        self.new_id()), p[2][0].rhs)
        # elif isinstance(p[2], List):

        p[0] = VarsDecl(p[2], p[1])
        # else:
        #     assert False, p[2]

    def p_declaration_specifiers(self, p):
        '''declaration_specifiers : UD
        | D
        | bit
        '''

        p[0] = p[1]

    def p_init_declarator_list(self, p):
        '''init_declarator_list : init_declarator
        | init_declarator_list ',' init_declarator
        '''
        if len(p) == 2:
            p[0] = [p[1]]
        else:
            p[0] = p[1]+[p[3]]

    def p_init_declarator(self, p):
        '''init_declarator : IDENTIFIER
        | IDENTIFIER '=' expression'''
        if len(p) == 2:
            p[0] = VarDeclUndef(Var(p[1]))
        else:
            # p[0] = p[3]
            p[0] = VarDeclInit(Var(p[1]), p[3])

    def p_startpoint(self, p):
        '''startpoint : statement_list
        | declaration_list statement_list'''
        if len(p) == 2:
            p[0] = p[1]
        else:
            p[0] = p[1]+p[2]

    # Error rule for syntax errors

    def p_error(self, p):
        print("Syntax error in input!", p, file=sys.stderr)
        # assert False, p
        self.parse_error = True

    # # Build the lexer
    def build(self, **kwargs):
        self.lexer = lex.lex(module=self, **kwargs)
        self.parser = yacc.yacc(
            module=self, start='startpoint', ** kwargs)
        self.id = 0
        self.lex_error = False

    # Test it output
    def test_lex(self, data):
        self.lexer.input(data)
        while True:
            tok = self.lexer.token()
            if not tok:
                break
            print(tok)

    def test_parse(self, data):
        result = self.parser.parse(data)
        print(result)

    def parse(self, data):
        return self.parser.parse(data)
