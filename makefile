INPUT?=input.txt
FRAC?=1
EPS?=0
DELTA?=0

level0: install level1

level1: similarity level2

level2: script

install: master compare

clean:
	@ echo "Cleaning files..."
	@ rm -rf adjacency
	@ rm -rf output.txt
	@ rm -rf math_script.wl
	@ rm -rf *.out
	@ rm -rf master.err
	@ rm -rf master.log

master: master.cpp
	@ echo "Compiling master.cpp..."
	@ g++ --std=c++11 input.cpp compare.cpp -o compare.out
	@ g++ --std=c++11 topological_sort.cpp master.cpp -o master.out

compare: compare.cpp
	@ echo "Compiling compare.cpp..."
	@ g++ --std=c++11 input.cpp compare.cpp -o compare.out

similarity:
	@ echo "Creating adjacency relation..."
	@ start=$$(date +%s); ./compare.out <Inputs/$(INPUT) && echo "\tRuntime: $$((($$(date +%s)-start)))s"

script:
	@ echo "Writing Mathematica script..."
	@ start=$$(date +%s); ./master.out $(FRAC) $(EPS) $(DELTA) <Inputs/$(INPUT) >master.log 2>master.err && echo "\tRuntime: $$((($$(date +%s)-start)))s"
	@ echo -n "\tMathematica Equation Count: " && wc -l < math_script.wl
	@ bash -c "if [[ -s master.err ]] ; then echo \"***ERRORS FOUND: Check master.err***\" ; false ; fi ;"

result:
	@ echo "Running Mathematica..."
	@ start=$$(date +%s); wolfram -script math_script.wl && echo "\tRuntime: $$((($$(date +%s)-start)))s"
	
terminal:
	@ echo "Running Mathematica in terminal..."
	@ math < math_script.wl

session:
	@ echo "Opening Mathematica (Press \"Run All Code\" in window)..."
	@ start=$$(date +%s); mathematica -run math_script.wl && echo "\tRuntime: $$((($$(date +%s)-start)))s"

experiment: #Deprecated...
	@ echo "Running Mathematica Thrice..."
	@ start=$$(date +%s); wolfram -script math_script.wl; wolfram -script math_script.wl; wolfram -script math_script.wl; echo "$(INPUT), $$?, $$((($$(date +%s)-start)/3))s" >>stats.txt && echo "\tRuntime: $$((($$(date +%s)-start)/3))s"