from ARMAST import *
ManualAST = {
    "aarch64_vector_arithmetic_binary_uniform_diff": [
        VarDeclInit(VarsDecl([Var('operand1', '0')], ('bits', Var(
            'datasize', '1')), '2'), ArrayIndex(Var('V', '3'), [Var('n', '4')], '5'), '6'),
        VarDeclInit(VarsDecl([Var('operand2', '7')], ('bits', Var(
            'datasize', '8')), '9'), ArrayIndex(Var('V', '10'), [Var('m', '11')], '12'), '13'),
        VarsDecl([Var('result', '14')], ('bits', Var('datasize', '15')), '16'),
        VarsDecl([Var('res', '14.')], ('bits', Var('datasize', '15.')), '16.'),
        VarsDecl([Var('element1', '17')], ('integer', Number(64)), '18'),
        VarsDecl([Var('element2', '19')], ('integer', Number(64)), '20'),
        VarsDecl([Var('absdiff', '21')], ('bits', Var('esize', '22')), '23'),
        Update(Var('res', '24'), IfElse(Var('accumulate', '25'), ArrayIndex(Var('V', '26'), [Var('d', '27')], '28'), Call('Zeros', [], '29'), '30')), For(Var('e', '31'), Number(0), BinaryExpr('-', Var('elements', '32'), Number(1), '33'), [Update(Var('element1', '34'), Call('Int', [ArrayIndex(Var('Elem', '35'), [Var('operand1', '36'), Var('e', '37'), Var('esize', '38')], '39'), Var('unsigned', '40')], '41')), Update(Var('element2', '42'), Call('Int', [ArrayIndex(Var('Elem', '43'), [Var('operand2', '44'), Var('e', '45'), Var('esize', '46')], '47'), Var('unsigned', '48')], '49')), Update(Var('absdiff', '50'), ArrayIndex(Call('Abs', [BinaryExpr('-', Var('element1', '51'), Var('element2', '52'), '53')], '54'), [SliceRange(BinaryExpr('-', Var('esize', '55'), Number(1), '56'), Number(0), '57')], '58')), Update(ArrayIndex(Var('Elem', '59'), [Var('result', '60'), Var('e', '61'), Var('esize', '62')], '63'), BinaryExpr('+', ArrayIndex(Var('Elem', '64'), [Var('res', '65'), Var('e', '66'), Var('esize', '67')], '68'), Var('absdiff', '69'), '70'))], 1, '71'), Update(ArrayIndex(Var('V', '72'), [Var('d', '73')], '74'), Var('result', '75'))],
    "aarch64_vector_arithmetic_binary_disparate_diff": [
        VarDeclInit(VarsDecl([Var('operand1', '0')], ('bits', Var('datasize', '1')), '2'), ArrayIndex(
            Var('Vpart', '3'), [Var('n', '4'), Var('part', '5')], '6'), '7'),
        VarDeclInit(VarsDecl([Var('operand2', '8')], ('bits', Var('datasize', '9')), '10'), ArrayIndex(
            Var('Vpart', '11'), [Var('m', '12'), Var('part', '13')], '14'), '15'),
        VarsDecl([Var('result', '16')], ('bits', BinaryExpr(
            '*', Number(2), Var('datasize', '17'), '18')), '19'),
        VarsDecl([Var('res', '16.')], ('bits', BinaryExpr(
            '*', Number(2), Var('datasize', '17.'), '18.')), '19.'),
        VarsDecl([Var('element1', '20')], ('integer', Number(64)), '21'),
        VarsDecl([Var('element2', '22')], ('integer', Number(64)), '23'),
        VarsDecl([Var('absdiff', '24')], ('bits', BinaryExpr(
            '*', Number(2), Var('esize', '25'), '26')), '27'),
        Update(Var('res', '28'), IfElse(Var('accumulate', '29'), ArrayIndex(
            Var('V', '30'), [Var('d', '31')], '32'), Call('Zeros', [], '33'), '34')),
        For(Var('e', '35'), Number(0), BinaryExpr('-', Var('elements', '36'), Number(1), '37'), [Update(Var('element1', '38'), Call('Int', [ArrayIndex(Var('Elem', '39'), [Var('operand1', '40'), Var('e', '41'), Var('esize', '42')], '43'), Var('unsigned', '44')], '45')), Update(Var('element2', '46'), Call('Int', [ArrayIndex(Var('Elem', '47'), [Var('operand2', '48'), Var('e', '49'), Var('esize', '50')], '51'), Var('unsigned', '52')], '53')), Update(Var('absdiff', '54'), ArrayIndex(Call('Abs', [BinaryExpr('-', Var('element1', '55'), Var('element2', '56'), '57')], '58'), [SliceRange(BinaryExpr('-', BinaryExpr('*', Number(2), Var('esize', '59'), '60'), Number(1), '61'), Number(0), '62')], '63')), Update(ArrayIndex(Var('Elem', '64'), [Var('result', '65'), Var('e', '66'), BinaryExpr('*', Number(2), Var('esize', '67'), '68')], '69'), BinaryExpr('+', ArrayIndex(Var('Elem', '70'), [Var('res', '71'), Var('e', '72'), BinaryExpr('*', Number(2), Var('esize', '73'), '74')], '75'), Var('absdiff', '76'), '77'))], 1, '78'), Update(ArrayIndex(Var('V', '79'), [Var('d', '80')], '81'), Var('result', '82'))]
}
