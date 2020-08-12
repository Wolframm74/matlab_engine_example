
MATLABHOME = /usr/local/MATLAB/MATLAB_Production_Server/R2013a

CXX=g++

CFLAGS = -fPIC -pthread -ansi -D_GNU_SOURCE -fno-omit-frame-pointer -O3 -DNDEBUG

CXX=g++

ARMA_DIR=/home/wolfram74/Libs

INCLUDE_MEX = -I$(MATLABHOME)/extern/include

#INCLUDE = -I $(ARMA_DIR)/armadillo-4.500.1/include/ -I $(ARMA_DIR)/armadillo-4.500.1/mex_interface 

#MEXFLAGS =  -shared -Wl,--no-undefined -Wl,-rpath-link,$(MATLABHOME)/bin/glnxa64 -L$(MATLABHOME)/bin/glnxa64 -lmx -lmex -lmat -lm -lut -leng

CXXFLAGS = -c -Wall -g -std=c++11 

all: matlab_engine_testing_bin

INCLUDE_FILES= met_include.hpp

MATLAB_ENGINE_TESTING_OBJS = met_entry_obj.o

matlab_engine_testing_bin: $(MATLAB_ENGINE_TESTING_OBJS)
	$(CXX) -o $@ $(MATLAB_ENGINE_TESTING_OBJS) -Wl,--no-undefined -Wl,-rpath-link,$(MATLABHOME)/bin/glnxa64 -L$(MATLABHOME)/bin/glnxa64 -lmx -leng
#-lmex -lmat -lm -lut 	

met_entry_obj.o: met_entry.cpp $(INCLUDE_FILES)
	$(CXX) $(CXXFLAGS) $(CFLAGS) -o $@ $< $(INCLUDE_MEX) 
#$(INCLUDE) 

.PHONY: clean

clean:
	rm -f top_down_threaded_mex.$(MEXSUFFIX)
	rm -f *.o		