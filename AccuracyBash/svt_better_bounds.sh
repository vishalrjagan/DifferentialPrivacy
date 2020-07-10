make acc_install_silent

# svt1
# make acc_silent INPUT=input_3_svt1.txt TYPE=0 NUMQ=3 RANGEWIDTH=1 BOUNDFACTOR=1/7
# make acc_silent INPUT=input_3_svt1_c2.txt TYPE=0 NUMQ=3 RANGEWIDTH=1 C=2 BOUNDFACTOR=1/13

# svt2
# make acc_silent INPUT=input_3_svt2.txt TYPE=0 NUMQ=3 RANGEWIDTH=1 BOUNDFACTOR=1/7
# make acc_silent INPUT=input_3_svt2_c2.txt TYPE=0 NUMQ=3 RANGEWIDTH=1 C=2 BOUNDFACTOR=1/13

# Getting eps and failing inputs
# make acc_silent INPUT=input_3_svt1.txt TYPE=0 NUMQ=3 RANGEWIDTH=1 BOUNDFACTOR=1/7
# make acc_silent INPUT=input_3_svt1_c2.txt TYPE=0 NUMQ=3 RANGEWIDTH=1 BOUNDFACTOR=1/14
# make acc_silent INPUT=input_3_svt2.txt TYPE=0 NUMQ=3 RANGEWIDTH=1 BOUNDFACTOR=1/7
make acc_silent INPUT=input_3_svt2_c2.txt TYPE=0 NUMQ=3 RANGEWIDTH=1 C=2 BOUNDFACTOR=1/13
