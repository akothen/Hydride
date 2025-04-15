#include "Halide.h"

using namespace Halide;

class RadixSort : public Generator<RadixSort> {
    public:
        // Step 1: Define the input buffer (data to be sorted).
        Input<Buffer<int32_t>> Input{ "Input", 1 };
        Output<Buffer<int32_t>> Output{ "Output", 1 };

        void generate() {

            auto n = Input.dim(0).extent();
            const int num_bits = 32;
            // Step 2: Define Halide variables.

            std::vector<Func> states(num_bits);

            // Step 3: Perform Radix Sort by iterating over each bit.
            for (int b = 0; b < num_bits; b++) {

                int state_index = b;
                // Calculate the current bit value (either 0 or 1) for each element.
                Func input_func("input_func_bit_"+std::to_string(b));
                // Load the input into a Halide function.
                if(state_index == 0){
                    input_func(x) = Input(x);
                } else {
                    input_func(x) = states[state_index-1](x);
                }

                Func count_zeros("count_zeros_bit_"+std::to_string(b));
                Func bit_value("bit_value_bit_"+std::to_string(b));
                bit_value(x) = (input_func(x) >> b) & 1;
                bit_value.compute_root().vectorize(x,32);

                // Step 4: Count the number of zeros and ones (for this bit).
                RDom r(0, n); // Reduction domain to sum over the entire array.
                count_zeros() = 0;
                count_zeros() += select(bit_value(r) == 0, 1, 0);

                // Factorize reduction for counting zeros to offload to PIM
                Var i("i_"+std::to_string(b));
                Func intermediate_count = count_zeros.update().rfactor({{r,i }});
                intermediate_count.compute_root().update().vectorize(i, 32);
                



                RDom k(0, n);
                Func prefix_sum_zeros("prefix_sum_zeros_"+std::to_string(b));
                Var psum_zero_idx;
                prefix_sum_zeros(psum_zero_idx) = (int32_t) 0;
                prefix_sum_zeros(k) = select(k ==0 , 0 , prefix_sum_zeros(k - 1) + select(bit_value(clamp(k-1, 0 , n-1)) == 0, 1, 0)) ;



                Func prefix_sum_ones("prefix_sum_ones_"+std::to_string(b));
                Var psum_one_idx;
                prefix_sum_ones(psum_one_idx) = (int32_t) 0;
                prefix_sum_ones(k) = select(k ==0 , 0 , prefix_sum_ones(k - 1) + select(bit_value(clamp(k-1, 0, n-1)) == 1, 1, 0)) ;


                // Step 5: Reorder elements based on the current bit.

                Func output_indices("output_indices_"+std::to_string(b));
                output_indices(x) =  select(bit_value(x) == 0, clamp(prefix_sum_zeros(x), 0, n-1), clamp(count_zeros() + prefix_sum_ones(x)  , 0, n-1));

                RDom scatter(0, n);
                states[state_index](x) = undef<int>();  // or 0, depending on your needs
                states[state_index](output_indices(scatter)) = input_func(scatter);


                states[state_index].compute_root();



            }

            Output(x) = states[num_bits-1](x);
            Output.vectorize(x,32);






        }
    private:
        Var x{ "x" }, y{ "y" }, bit{"bit"};
};
HALIDE_REGISTER_GENERATOR(RadixSort, radix_sort)
