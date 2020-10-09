# Hello

Before reading on, please note the following about the tool
(reiterating the first two paragraphs of Section 7 from the paper):

1. The tool handles only loop-free programs with finite, discrete
   input domains whose deterministic functions have discrete output.

2. This is an extension of a related tool for verifying differential
   privacy. Because of this, the workflow is admittedly a bit
   unwieldy. For example: to build an I/O table for a particular
   algorithm's deterministic function, we use a script written in
   Ocaml. This script must know various things about the program being
   targeted, for example, the number of queries, the range for the
   program's inputs, and other parameters. When running the tool on a
   given DiPC+ program from the Inputs directory, the user must ensure
   that the I/O table matches up with the program. We've provided
   scripts for correctly running `make` in this way on the programs
   from the paper.


# Directory Contents

- Inputs: input programs.
- Scripts: scripts for running the tool and generating data from the paper.
- makefile: several parameters need to be specified, depending on
  program type.
- master.cpp: Code to process input programs and generate Mathematica
  scripts.
- ocaml/util.ml: code for generating I/O tables.


# High-level workflow

The tool uses Wolfram's proprietary Mathematica software. If you
 cannot obtain a license and install it on the provided VirtualBox
 disk image, then please watch the accompanying screencast that shows
 an example of using the tool. Otherwise, there are shell scripts in
 the Scripts directory that run the tool on the input programs from
 the paper.

- Access to Mathematica license: -- Install Mathematica on the
  VirtualBox disk image. Wolfram distributes an installer in the form
  of a shell script. Run that installation script using sudo in the
  disk image, and accept all default choices during installation, and:
  answer yes to Wolfram Script Integration and no to Vernier
  devices. To generate the data for tables in the paper, run the
  corresponding shell scripts `run_*.sh` in the Scripts
  directory. Each script invokes `make` using the appropriate input
  program and some parameters, generates a Mathematica script, calls
  Mathematica on the script, and displays the results. All you need
  from the Mathematica installation is that a `wolfram` executable is
  in your PATH on the disk image.

- No access to Mathematica: a screencast is included in this disk
  image that demonstrates running an example program through the
  tool.


# Verifying results from the paper

	The data for tables in the paper can be generated using the shell
		scripts in the Scripts directory. For example, to run the tool
		on the programs from Table 2(c), execute

        "> Scripts/run_table2c.sh"

        from the project root.

	Each of the scripts in Scripts/run_*.sh  will display a concise summary of the run, including times for each component of the tool and whether or not accuracy was verified.

	Additionally, each invocation of a script from Scripts will append
    output from Mathematica runs to a file named acc_all_bin.txt. This
    file can be inspected to find accuracy counterexamples.

	NOTE: Depending on which script, this could take on the order of a
		few hours to run. See tables in the paper to get an idea for
        runtimes. Running all scripts in sequence under the same setup as
    presented in the paper would likely take around 8 hours. On a virtual machine this will be slightly more.

    You can also run a single program (corresponding to a table row) from a given table by running the
   corresponding make command in the corresponding script. For example, to check the first row in Table 3, first build the project with:

   > make acc_install_silent

   And then the corresponding make command from table3.sh:

   > make acc_silent INPUT=input_1_numeric_c1_width1_gamma1.txt TYPE=1 NUMQ=1 RANGEWIDTH=1 ALPHA=1


# Summary of `makefile`

    The makefile and all Scripts should be run from the project root directory. In the
    disk image this is '~/Desktop/DiPC'. Below are two `make` commands
    which give some control over running the tool. Each parameter is
    described below.

    (For those who cannot access Mathematica):
    make acc_silent_no_math INPUT=<filename> TYPE=<t> NUMQ=<n> RANGEWIDTH=<w> ALPHA=<k> GAMMA=<g>

    This will generate a math_script.wl in the root
    directory, but will not run Mathematica.

    (For those who can access Mathematica):
    make acc_silent INPUT=<filename> TYPE=<t> NUMQ=<n> RANGEWIDTH=<w> ALPHA=<k> GAMMA=<g>

    Both uses of `make` above will activate two phases of the
    tool. The first phase generates the I/O table that we use to
    represent deterministic functions that correspond to
    non-randomized algorithms. The I/O table is named
    "io_table.txt". The second phase reads the input program and
    generates a Mathematica script called `math_script.wl`. The third
    phase, which is omitted by `make acc_silent_no_math`, runs
    Mathematica on the generated script.

    Meanings of the makefile parameters:

    TYPE:
        - INPUT: relative path to input program, e.g. from the project root: Inputs/input_1_svt1.txt
        - TYPE = 0 (Sparse or SparseVariant)
               = 1 (Numeric sparse)
               = 2 (Noisy max)
               = 3 (Laplace mechanism)
        - NUMQ: Integer >= 1, the number of queries
        - RANGEWIDTH: the range for each query. E.g. RANGEWIDTH=2 means each query ranges over [-2,2]
        - C: number of above threshold queries to seek. Only pertinent
        to TYPES 0, 1
        - THRESH: threshold, only pertinent to TYPES 0, 1
        - ALPHA: alpha accuracy parameter
        - GAMMA: gamma accuracy parameter
        - BOUNDFACTOR: rational number between 0 and 1, e.g. 1/2, 1/4, 1/8.


# Programs from the paper
	Input programs from the paper can be found in the Inputs
    directory. The name format of input files is as follows.

	input_X_algo_options.txt:
		X: The number of queries in the program.
		algo: The name of the algorithm used. Note: svt1 refers to the
	SparseVariant algorithm in the paper and svt2 refers to
	Sparse, nmax5 refers to NoisyMax in the paper.
		options:
			cY: The count variable c=Y.
            widthY: the width of the interval for the input range.
            gammaY: value of gamma=alpha in the case of Numeric sparse, and gamma in the case of Laplace mechanism.


# Input program syntax
	NOTE: The input program should be present in the file <filename> in the folder Inputs.

	The syntax for input programs is a bit like assembly syntax.
	IMPORTANT: Every component should be space separated. Eg: var1+var2 needs to be written as "var1 + var2".

	RULES FOR INPUT PROGRAM:
	1)	The first line of the input program contains two integers separated by a space. These two numbers denote the RANGE of the integers in this program. Eg: If the line reads "-5 5", then the range for all integers in the program would be the integers in the interval [-5,5].
	2)	The subsequent lines are the code for the program. The first
			lines denote the input to the program. Each of the input
			variables is listed in a separate line. The syntax is:
			input <var_type> <var_name> <min_val> <max_val>;
		<var_type> can be "int" or "bool".
		<var_name> is the name of the variable, which can be any
		string with no newline or space characters and the first
		character is an alphabet.
		<min_val> to <max_val> is the range we allow the inputs to take for this variable.
	3) IMPORTANT: The real variables get treated as constant variables. They should be assigned values only once in every branch of execution. If not, then this would lead to the previous assignment statements being completely ignored.
	4) The remaining program allows the following commands:
		a) <var_type> <var_name>;
			This is a variable declaration statement.
				<var_type>, the type of the variable, can be "int", "bool" or "real", denoting integer, boolean and real variables respectively.
				<var_name>, the name of the variable, can be any string with no newline or space characters and the first character is an alphabet.
			Eg: int val;
		b) <var_name> = <constant>;
			This is the constant assignment statement. The allowed values depend on the type of the variable:
				int: Any value in the RANGE defined in the program.
				bool: true or false.
				real: Any real value given in decimal point form, i.e. 12.23.
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
		g) <real_var> = Lap "<lin_in_eps>" <int_var>;
			This is the Laplacian assignment statement.
				<lin_in_eps> is a linear expression in eps and other variables defined in the program, but every token must be space separated, i.e., "2*eps+3" needs to be written as "2 * eps + 3". Also, this variable must be enclosed in double quotes.
				<int_var> This is the variable holding the value of the mean of the Laplacian distribution.
			Eg: rl = Lap "val * eps + 3" val;
		h) return <var1> <var2> ... <vark>;
			This is the return statement.
				We can return a list of variables. But the length of the array and the type of each variable must be constant across all return statements in the program.
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

		l) Prob{<math_exp>} <statement>
			This is the probabilistic statement.
				<math_exp> is a Mathematica Expression for the probability with which this statement must be executed. This probability may depend on eps
		    	<statement> is the statement to be executed, which may be one of the previous types of statements
			The command <statement> is executed with probability <math_exp> and not executed with probability 1-<math_exp>.
			Eg: Prob{1/(Exp[eps]+1)} out1 = ! q1;

	NOTE:
	1) We don't have assignments of the form var1 = var2 + 3. In the arithmetic statement, both the operands must be variables. "var1 = var2 + 3" must be written as "int three; three = 3; var1 = var2 + three;"
	2) In the entire program, individual tokens must be separated by spaces. i.e., "var=var1+var2;" needs to be written as "var = var1 + var2;"
