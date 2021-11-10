#python3 ../run_synth.py --grammar tensor_grammar_8bit.rkt tensor_8bit.spec -v --iterations 10 --depth 3
#python3 ../run_synth.py --grammar tensor_grammar_2bit.rkt tensor_2bit.spec -v --iterations 10 --depth 3 -v
#python3 ../run_synth.py --grammar tensor_grammar_32bit.rkt tensor_32bit.spec -v --iterations 10 --depth 3

python3 generate_spec_and_grammar.py
python3 ../run_synth.py --grammar gen_grammar.rkt gen_spec.rkt -v --iterations 10 --depth 3 -v

