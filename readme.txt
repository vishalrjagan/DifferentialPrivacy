***Directory Contents***
	Inputs: A folder containing the input programs.
	Scripts: A folder containing the math scripts.
	Programs: A folder containing code to generate common input programs.
	ProgramInputs: A folder containing code to create input files to programs in Programs.
	Bash: A folder containing shell scripts to create data for Tables in Paper.
	compare.cpp: A program which uses input.cpp to generate the adjacency relation between inputs.
	input.cpp, input1.cpp, input3.cpp: A program which contains function compare (and other variations of the function), which defines the adjacency relation.
	makefile: A master file to run the entire directory.
	master.cpp: A program which contains the code to generate the mathematica script.
	run.sh: A shell program which runs scripts in Bash folder.
	topological_sort.cpp: A program which can generate the list of all topological sorts which satisfy a given partial order.

***How to Run***
******Summary
	To run from program compilation,
		make level0 result INPUT=<filename> FRAC=<frac> EPS=<eps> RANGE="<eps-range>" RANDOM=<0/1> DELTA=<delta>
	To run from adjacency relation creation,
		make level1 result INPUT=<filename> FRAC=<frac> EPS=<eps> RANGE="<eps-range>" RANDOM=<0/1> DELTA=<delta>
	To run from script file creation,
		make level2 result INPUT=<filename> FRAC=<frac> EPS=<eps> RANGE="<eps-range>" RANDOM=<0/1> DELTA=<delta>
	To only run till script creation, but avoid running script file on mathematica, remove the result option from the above commands, i.e., run the above commands as
		make levelX INPUT=<filename> FRAC=<frac> EPS=<eps> RANGE="<eps-range>" RANDOM=<0/1> DELTA=<delta>

******Detailed
	make [options] INPUT=<filename> FRAC=<frac> EPS=<eps> RANGE="<eps-range>" RANDOM=<rand_bit> DELTA=<delta>
		filename: The input program file. NOTE: This should be the name of a file present in the Inputs folder (default: input.txt)
		frac: The program would check for frac*eps-differential privacy. For example, if we wish to check 2*eps-differential privacy, use frac as 2. (default: 1)
		eps: The constant epsilon value to be checked for. (default: None)
		eps-range: The range of epsilon to be checked for, expressed as an inequality in Mathematica Inequality, Eg: "eps>0 && eps<1". (default: "eps > 0")
		rand_bit: Whether adjacency pairs must be produced in random order. 0 for False, 1 for True. (default: 0).
		delta: The delta to be considered for epsilon-delta differential privacy.

		Options:
			install: Installs the executables required, namely compare.out and master.out.
			clean: Cleans the directory and requires the intermediate files produced.
			similarity: Creates the adjacency relation in the file named adjacency, using the input program and the compare function defined in input.cpp.
			script: Creates the script file math_script.wl using the input program and the adjacency relation.
			result: Runs the script file on Mathematica and prints out only the final result.
			terminal: Runs the script file on Terminal while outputting every computation in the script.
			session: Opens the script file in a Mathematica window.

			level2: Runs the script option, generates the script file.
			level1: Runs similarity and script options, generates the adjacency file and then the script file.
			level0: Runs install, similarity and script options, compiles the programs, then generates adjacency file and then the script file.

***Adjacency Relation***
	The adjacency relation is created using the compare function present in input.cpp file in the main directory. This function takes as input, two vectors, representing to tuples of inputs (the i^th entry in the vector is the value assigned to the i^th input variable in the program). The function returns a boolean value, which is true if the two inputs form a pair in the similarity relation and false otherwise.
	The default function implemented concludes that a pair of inputs are similar, if they differ by atmost 1 at each position.

	Another method to give the similarity relation is to manually create the file adjacency in the main directory. Each line of the file must be of the form
	"a1 a2 ... an ~ b1 b2 ... bn", where the first input has the i^th variable in input being set to a_i and the second input has the i^th variable set to b_i. When using this input method for the adjacency relation, remember NOT to run level0, level1 and similarity in make options. The adjacency relation will be overwritten otherwise.

***Input Program***
	NOTE: The input program should be present in the file <filename> in the folder Inputs.

	The syntax for the input program is essentially a modification of the assembly language syntax.
	IMPORTANT: Every component should be space separated. Eg: var1+var2 needs to be written as "var1 + var2".

	RULES FOR INPUT PROGRAM:
	1)	The first line of the input program contains two integers separated by a space. These two numbers denote the RANGE of the integers in this program. Eg: If the line reads "-5 5", then the range for all integers in the program would be the integers in the interval [-5,5].
	2)	The subsequent lines are the code for the program. The first lines denote the input to the program. Each of the input variables are listed in a separate line. The syntax is:
			input <var_type> <var_name> <min_val> <max_val>;
		<var_type> can be "int" or "bool".
		<var_name> is the name of the variable, which can be any string with no newline or space characters and the first character is an alphabet.
		<min_val> to <max_val> is the range we allow the inputs to take for this variable.
	3) IMPORTANT: The real variables get treated as constant variables. They should be assigned values only once in every branch of execution. If not, then this would lead to the previous assignment statements being completely ignored.
	4) The remaining program allows the following commands:
		a) <var_type> <var_name>;
			This is the variable declaration statement.
				<var_type>, the type of the variable, can be "int", "bool" or "real", denoting integer, boolean and real variables respectively.
				<var_name>, the name of the variable, can be any string with no newline or space characters and the first character is an alphabet.
			Eg: int val;
		b) <var_name> = <constant>;
			This is the constant assignment statement. The allowed values depend on the type of the variable:
				int: Any value in the RANGE defined in the program.
				bool: true or false.
				real: Any real value.
			Eg: val = -5;
		c) <var_name1> = <var_name2>;
			This is the variable assignment statement. The types of both the variables must be the same.
			Eg: val1 = val2;
		d) <real_var> = <int_var>;
			Using this statement, we can assign the value of the integer variable to the real variable.
			Eg: rl = val;
		e) <var_name> = <var_name1> <op> <var_name2>;
			This is the arithmetic operation command.
				The variable <var_name> must be an integer variable or a boolean variable.
				We allow +, -, *, /, %, <, <=, >=, > and == between integer variables, and && and || between boolean variables.
			Eg: val = val1 + val2;
		f) <bool_var1> = ! <bool_var2>
			This is the negation statement.
			Eg: bl1 = ! bl2;
		g) <real_var> = Lap "<lin_in_eps" <int_var>;
			This is the Laplacian assignment statement.
				<lin_in_eps> is a linear expression in eps and other variables defined in the program, but every token must be space separated, i.e., "2*eps+3" needs to be written as "2 * eps + 3". Also, this variable must be enclosed in double quotes.
				<int_var> This is the variable holding the value of the mean of the Laplacian distribution.
			Eg: rl = Lap "val * eps + 3" val;
		h) return <var1> <var2> ... <vark>;
			This is the return statement.
				We can return an list of variables. But the length of the array and the type of each variable must be constant across all return statements in the program.
				<vari> can be an integer variable or a boolean variable.
			Eg: return val1 val2 val3;
		i) if <bool_var> then <program1> else <program2> fi;
			This is the if-else statement.
				<bool_var> must be a boolean variable.
				<program1> and <program2> are lists of commands.
			Eg: if b then val = val + a;
				b = b + a;
				return val;
				else val = val + b;
				a = a + b;
				fi;
		j) if <bool_var> then <program1> fi;
			This is the if statement.
				<bool_var> must be a boolean variable.
				<program1> is a list of commands.
			Eg: if b then val = val + a;
				b = b + a;
				return val;
				fi;
		k) <int_var> = TDLap "<lin_in_eps>" <var1> <var2> <var3>;
			This is the truncated discrete laplacian statement.
				<var1> is the variable storing value of the variance.
				<var2> is the variable storing lower cutoff for the distribution.
				<var3> is the variable storing upper cutoff for the distribution.
				<lin_in_eps> is a linear expression in eps, as in the Laplacian statement in (g).
			Eg: val = TDLap "val * eps + 3" val1 val2 val3;

	NOTE:
	1) We don't have assignments of the form var1 = var2 + 3. In the arithmetic statement, both the operands must be variables. "var1 = var2 + 3" must be written as "int three; three = 3; var1 = var2 + three;"
	2) In the entire program, individual tokens must be separated by spaces. i.e., "var=var1+var2;" needs to be written as "var = var1 + var2;"

***Pre-written Inputs***
	A bunch of pre-written input files can be found in the Inputs Directory. The name format of the input file is:
	input_X_algo_options.txt:
		X: The number of queries in the program.
		algo: The name of the algorithm used. Note: svt7 refers to the Sparse algorithm in the paper. nmax5-8 refer to NMax1-4 in paper. nmax9-10 refer to Hist 1-2.
		options:
			cY: The count variable c=Y.
			dY: The domain is integers in [Y,1].
			01: The discretization is using the sequence 0<1. (Sequence is -1<0<1 otherwise).
	These input files can be generated by using the create.cpp file in ProgramInputs folder. From the main directory, run the following commands:
		g++ ProgramInputs/create.cpp
		./a.out
		./generateInputs.sh

***Data for Tables in Paper***
	The data for tables in the paper can be generated using the run.sh script in the main directory. Run the command:
		./run.sh >>final.txt
	This would create the files final.txt and all_bin.txt.
	NOTE: This program would take more than a day to produce all the outputs.
	final.txt contains the concise summary of the runs, including times for each component of the tool and whether or not a counterexample was found.
	all_bin.txt would contain the outputs of the Mathematica script for each run.