#include "Halide.h"
#include "../../common_params.h"

using namespace Halide;

class Sobel5x5 : public Generator<Sobel5x5> {
public:
    Input<Buffer<uint8_t>> input{ "input", 2 };
    Output<Buffer<uint8_t>> output{ "output", 2 };

    GeneratorParam<bool> use_parallel_sched{ "use_parallel_sched", true };
    GeneratorParam<bool> use_prefetch_sched{ "use_prefetch_sched", true };


    void generate() {
        bounded_input(x, y) =  
        //    input(x,y);  
        BoundaryConditions::repeat_edge(input)(x, y);

        // Kernel values from the paper:
        //   Image Segmentation using Extended Edge Operator for Mammographic Images

        Func input_16{ "input_16" };
        input_16(x, y) = cast<uint16_t>(bounded_input(x, y));

        sobel_x_high_avg(x, y) = 2*input_16(x - 2, y) + 2*input_16(x - 1, y) +
                                 4*input_16(x, y) +
                                 2*input_16(x + 1, y) + 2*input_16(x + 2, y);
        sobel_x_high(x, y) = absd(sobel_x_high_avg(x, y - 2), sobel_x_high_avg(x, y + 2));

        sobel_x_low_avg(x, y) = 1*input_16(x - 2, y) + 1*input_16(x - 1, y) +
                                2*input_16(x, y) +
                                1*input_16(x + 1, y) + 1*input_16(x + 2, y);
        sobel_x_low(x, y) = absd(sobel_x_low_avg(x, y - 1), sobel_x_low_avg(x, y + 1));

        sobel_x(x, y) = cast<uint8_t>(clamp(sobel_x_high(x, y) + sobel_x_low(x, y), 0, 255));


        sobel_y_high_avg(x, y) = 2*input_16(x, y - 2) + 2*input_16(x, y - 1) +
                                 4*input_16(x, y) +
                                 2*input_16(x, y + 1) + 2*input_16(x, y + 2);
        sobel_y_high(x, y) = absd(sobel_y_high_avg(x - 2, y), sobel_y_high_avg(x + 2, y));

        sobel_y_low_avg(x, y) = 1*input_16(x, y - 2) + 1*input_16(x, y - 2) +
                                2*input_16(x, y) +
                                1*input_16(x, y + 1) + 1*input_16(x, y + 2);
        sobel_y_low(x, y) = absd(sobel_x_low_avg(x - 1, y), sobel_x_low_avg(x + 1, y));

        sobel_y(x, y) = cast<uint8_t>(clamp(sobel_y_high(x, y) + sobel_y_low(x, y), 0, 255));

        output(x, y) = cast<uint8_t>(clamp(sobel_x(x, y) + sobel_y(x, y), 0, 255));
    }

    void schedule() {
        if (auto_schedule) {
            // Estimates taken from here: https://github.com/uwplse/rake/blob/hvx-artifact/benchmarks/hexagon/halide/test/run.cpp#L710
            input.set_estimates({{0, stef_width}, {0, stef_height}});
            output.set_estimates({{0, stef_width}, {0, stef_height}});
        }
    }

private:
    Var x{ "x" }, y{ "y" };
    Func sobel_x_high_avg{ "sobel_x_high_avg" }, sobel_x_low_avg{ "sobel_x_low_avg" };
    Func sobel_x_low{ "sobel_x_low" }, sobel_x_high{ "sobel_x_high" };
    Func sobel_y_high_avg{ "sobel_y_high_avg" }, sobel_y_low_avg{ "sobel_y_low_avg" };
    Func sobel_y_low{ "sobel_y_low" }, sobel_y_high{ "sobel_y_high" };
    Func sobel_x{ "sobel_x" }, sobel_y{ "sobel_y" };
    Func bounded_input{ "bounded_input" };
};

HALIDE_REGISTER_GENERATOR(Sobel5x5, sobel5x5)
