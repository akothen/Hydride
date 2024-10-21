#include <iostream>
#include <sycl/ext/intel/esimd.hpp>
#include <sycl/sycl.hpp>

using namespace sycl;
using namespace sycl::ext::intel::esimd;

inline auto createExceptionHandler() {
  return [](exception_list l) {
    for (auto ep : l) {
      try {
        std::rethrow_exception(ep);
      } catch (sycl::exception &e0) {
        std::cout << "sycl::exception: " << e0.what() << std::endl;
      } catch (std::exception &e) {
        std::cout << "std::exception: " << e.what() << std::endl;
      } catch (...) {
        std::cout << "generic exception\n";
      }
    }
  };
}

#define DUMP(x)                                                                \
  {                                                                            \
    printf("0x");                                                              \
    for (int i = (sizeof(x)) / sizeof(uint8_t) - 1; i >= 0; i--)                 \
      printf("%02x", ((uint8_t *)x)[i]);                                       \
    printf("\n");                                                              \
  }