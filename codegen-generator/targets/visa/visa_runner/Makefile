#Find all cpp files in the current directory
SRCS := $(wildcard *.cpp)
DPCPP_HOME?=~/sycl_workspace
CXX=$(DPCPP_HOME)/llvm/build/bin/clang++
CXXFLAGS=-fsycl

all: $(SRCS:.cpp=.out) $(SRCS:.cpp=.txt)

%.out: %.cpp
	$(CXX) $(CXXFLAGS) $< -o $@
%.txt: %.out
	- LD_LIBRARY_PATH=$(DPCPP_HOME)/llvm/build/lib ./$< > $@