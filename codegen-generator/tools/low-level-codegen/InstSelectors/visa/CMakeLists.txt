cmake_minimum_required(VERSION 3.13.4)
project(qwq)

set(CMAKE_BUILD_TYPE Release)

set(LT_LLVM_INSTALL_DIR "${HYDRIDE_ROOT}/frontends/halide/llvm-build" PATH "LLVM installation directory")
list(APPEND CMAKE_PREFIX_PATH "${LT_LLVM_INSTALL_DIR}/lib/cmake/llvm/")
find_package(LLVM 12 REQUIRED CONFIG)
include_directories(SYSTEM ${LLVM_INCLUDE_DIRS} "../common")


set(CMAKE_CXX_STANDARD 14 CACHE STRING "")
if(NOT LLVM_ENABLE_RTTI)
set(CMAKE_CXX_FLAGS "${CMAKE_CXX_FLAGS} -fno-rtti")
endif()

file(GLOB legalizer_sources **.cpp)
file(GLOB legalizer_header ../common/**.cpp)

SET(legalizer ${legalizer_sources} ${legalizer_header})  
add_library(VISALegalizer SHARED ${legalizer})