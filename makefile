INPUT?=input.txt
FRAC?=1
EPS?=0
DELTA?=0
RANDOM?=0
RANGE?=eps > 0
APPROACH?=1

level0: install level1

level1: similarity level2

level2: script

install: master compare

silent: start_silent similarity_silent script_silent result_silent

clean:
	@ echo "Cleaning files..."
	@ rm -rf adjacency
	@ rm -rf output.txt
	@ rm -rf math_script.wl
	@ rm -rf *.out
	@ rm -rf master.err
	@ rm -rf master.log
	@ rm -rf bin.txt
	@ rm -rf acc_bin.txt
	@ rm -rf io_table.txt
	@ rm -rf ./ocaml/*.out

master: master.cpp
	@ echo "Compiling master.cpp..."
	@ g++ --std=c++11 input.cpp compare.cpp -o compare.out
	@ g++ --std=c++11 topological_sort.cpp master.cpp -o master.out

compare: compare.cpp
	@ echo "Compiling compare.cpp..."
	@ g++ --std=c++11 input.cpp compare.cpp -o compare.out

similarity:
	@ echo "Creating adjacency relation..."
	@ start=$$(date +%s); ./compare.out $(RANDOM) <Inputs/$(INPUT) && echo "\tRuntime: $$((($$(date +%s)-start)))s"

script:
	@ echo "Writing Mathematica script..."
	@ start=$$(date +%s); ./master.out $(FRAC) $(EPS) $(DELTA) "$(RANGE)" $(APPROACH) <Inputs/$(INPUT) >master.log 2>master.err && echo "\tRuntime: $$((($$(date +%s)-start)))s"
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

experiment:
	@ echo "Running Mathematica Thrice..."
	@ echo $(INPUT) >>all_bin.txt
	@ start=$$(date +%s); wolfram -script math_script.wl; wolfram -script math_script.wl; wolfram -script math_script.wl >bin.txt; grep -Fq "True" bin.txt; echo "$(INPUT), $$?, $$((($$(date +%s)-start)/3))s" >>stats.txt && echo "\tRuntime: $$((($$(date +%s)-start)/3))s"
	@ cat bin.txt >>all_bin.txt
	@ echo ""
	@ echo "-----------------------------------------------------------------------------------------" >>all_bin.txt

install_silent:
	@ rm -rf adjacency
	@ rm -rf output.txt
	@ rm -rf math_script.wl
	@ rm -rf *.out
	@ rm -rf master.err
	@ rm -rf master.log
	@ g++ --std=c++11 input.cpp compare.cpp -o compare.out
	@ g++ --std=c++11 topological_sort.cpp master.cpp -o master.out
	@ g++ --std=c++11 input.cpp compare.cpp -o compare.out

start_silent:
	@ echo -n "$(INPUT),\t "

similarity_silent:
	@ start=$$(date +%s); ./compare.out $(RANDOM) <Inputs/$(INPUT) && echo -n "$$((($$(date +%s)-start)))s,\t "

script_silent:
	@ start=$$(date +%s); ./master.out $(FRAC) $(EPS) $(DELTA) "$(RANGE)" $(APPROACH) <Inputs/$(INPUT) >master.log 2>master.err && echo -n "$$((($$(date +%s)-start)))s,\t "

result_silent:
	@ echo $(INPUT) >>all_bin.txt
	@ start=$$(date +%s); wolfram -script math_script.wl >bin.txt; grep -Fq "True" bin.txt; echo "$$?,\t $$((($$(date +%s)-start)))s,\t $$(wc -l < math_script.wl)"
	@ cat bin.txt >>all_bin.txt
	@ echo "-----------------------------------------------------------------------------------------" >>all_bin.txt


### Accuracy related ###

TYPE?=0
NUMQ?=1
RANGEWIDTH?=2
C?=1
THRESH?=0
ALPHA?=1
GAMMA?=1
BOUNDFACTOR?=1
PWD=$(shell pwd)

# Build
acc_install_silent:
	@ rm -rf io_table.txt
	@ rm -rf output.txt
	@ rm -rf math_script.wl
	@ rm -rf *.out
	@ rm -rf ./ocaml/*.out
	@ rm -rf master.err
	@ rm -rf master.log
	@ ocamlopt -o ./ocaml/util.out ./ocaml/util.ml
	@ g++ --std=c++11 topological_sort.cpp master.cpp -o master.out

acc_silent: acc_start_silent acc_io_silent acc_script_silent acc_result_silent

acc_silent_no_math: acc_start_silent acc_io_silent acc_script_silent

acc_start_silent:
	@ echo -n "$(INPUT),\t"

acc_util_silent:
	@ ocamlopt -o ./ocaml/util.out ./ocaml/util.ml

# Generate I/O table
acc_io_silent:
	@ start=$$(date +%s); ./ocaml/util.out $(TYPE) $(NUMQ) $(RANGEWIDTH) $(C) $(THRESH) $(ALPHA) $(GAMMA) $(BOUNDFACTOR) && echo -n "$$((($$(date +%s)-start)))s,\t"

# Generate Mathematica script
acc_script_silent:
	@ start=$$(date +%s); ./master.out $(FRAC) $(EPS) $(DELTA) "$(RANGE)" $(APPROACH) <AccuracyInputs/$(INPUT) >master.log 2>master.err && echo -n "$$((($$(date +%s)-start)))s,\t"

# Run Mathematica script using the wolfram command, and check for a
# failed accuracy condition
acc_result_silent:
	@ echo $(INPUT) >>acc_all_bin.txt
	@ start=$$(date +%s); wolfram -script math_script.wl >acc_bin.txt; grep -Fq "failure" acc_bin.txt; echo "$$?,\t $$((($$(date +%s)-start)))s,\t $$(wc -l < math_script.wl)"
	@ cat acc_bin.txt >>acc_all_bin.txt
	@ echo "-----------------------------------------------------------------------------------------" >>acc_all_bin.txt


# The same rules without suppressed output
acc_install:
	rm -rf io_table.txt
	rm -rf output.txt
	rm -rf math_script.wl
	rm -rf *.out
	rm -rf ./ocaml/*.out
	rm -rf master.err
	rm -rf master.log
	ocamlopt -o ./ocaml/util.out ./ocaml/util.ml
	g++ --std=c++11 topological_sort.cpp master.cpp -o master.out
acc: acc_start acc_io acc_script acc_result
acc_start:
	echo -n "$(INPUT),\t"
acc_io:
	start=$$(date +%s); ./ocaml/util.out $(TYPE) $(NUMQ) $(RANGEWIDTH) $(C) $(THRESH) $(ALPHA) $(GAMMA) $(BOUNDFACTOR)$ && echo -n "$$((($$(date +%s)-start)))s,\t"
acc_script:
	start=$$(date +%s); ./master.out $(FRAC) $(EPS) $(DELTA) "$(RANGE)" $(APPROACH) <AccuracyInputs/$(INPUT) >master.log 2>master.err && echo -n "$$((($$(date +%s)-start)))s,\t"
acc_result:
	echo $(INPUT) >>acc_all_bin.txt
	start=$$(date +%s); wolfram -script math_script.wl >acc_bin.txt; grep -Fq "failure" acc_bin.txt; echo "$$?,\t $$((($$(date +%s)-start)))s,\t $$(wc -l < math_script.wl)"
	cat acc_bin.txt >>acc_all_bin.txt
	echo "-----------------------------------------------------------------------------------------" >>acc_all_bin.txt
