cmake_minimum_required(VERSION 3.13.4)
project(qwq)

set(CMAKE_BUILD_TYPE Release)


set(LT_LLVM_INSTALL_DIR "${HYDRIDE_ROOT}/frontends/halide/llvm-build" PATH "LLVM installation directory")
# link with AIE LLVM version
#set(LT_LLVM_INSTALL_DIR "/home/llvm-lab/new-mlir-aie/llvm/install" PATH "LLVM installation directory")
list(APPEND CMAKE_PREFIX_PATH "${LT_LLVM_INSTALL_DIR}/lib/cmake/llvm/")
find_package(LLVM 14 REQUIRED CONFIG)
include_directories(SYSTEM ${LLVM_INCLUDE_DIRS} "InstSelectors/common")


set(CMAKE_CXX_STANDARD 17 CACHE STRING "")
if(NOT LLVM_ENABLE_RTTI)
set(CMAKE_CXX_FLAGS "${CMAKE_CXX_FLAGS} -fno-rtti")
endif()

if(APPLE)
  # for MacOS X or iOS, watchOS, tvOS (since 3.10.3)
  include_directories(/opt/homebrew/Cellar/boost/1.81.0_1/include)
  SET(CMAKE_SHARED_LINKER_FLAGS "-undefined dynamic_lookup")
endif()

# add_library(X86Legalizer SHARED InstSelectors/x86/x86LegalizerAllArgs.cpp)
file(GLOB x86_legalizer_sources InstSelectors/x86/x86LegalizerAllArgs.cpp)
file(GLOB arm_legalizer_sources InstSelectors/arm/**.cpp)
file(GLOB aievec_legalizer_sources InstSelectors/aievec/**.cpp)
# file(GLOB legalizer_sources InstSelectors/aievec/**.cpp)
file(GLOB legalizer_header InstSelectors/common/**.cpp)

SET(x86_legalizer ${x86_legalizer_sources} ${legalizer_header})  
SET(arm_legalizer ${arm_legalizer_sources} ${legalizer_header})  
SET(aievec_legalizer ${aievec_legalizer_sources} ${legalizer_header})  
# add_library(ARMLegalizer SHARED ${arm_legalizer})
# add_library(x86LegalizerAllArgs SHARED ${x86_legalizer})
add_library(AIEVecLegalizer SHARED ${aievec_legalizer})