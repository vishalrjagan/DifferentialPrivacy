make acc_install_silent


# Table 2 (a) -----------------------------------------------------

# svt1
make acc_silent INPUT=input_1_svt1.txt TYPE=0 NUMQ=1 RANGEWIDTH=1

make acc_silent INPUT=input_2_svt1.txt TYPE=0 NUMQ=2 RANGEWIDTH=1
make acc_silent INPUT=input_2_svt1_c2.txt TYPE=0 NUMQ=2 RANGEWIDTH=1 C=2

make acc_silent INPUT=input_3_svt1.txt TYPE=0 NUMQ=3 RANGEWIDTH=1
make acc_silent INPUT=input_3_svt1_c2.txt TYPE=0 NUMQ=3 RANGEWIDTH=1 C=2
make acc_silent INPUT=input_3_svt1_c3.txt TYPE=0 NUMQ=3 RANGEWIDTH=1 C=3

make acc_silent INPUT=input_4_svt1.txt TYPE=0 NUMQ=4 RANGEWIDTH=1
make acc_silent INPUT=input_4_svt1_c2.txt TYPE=0 NUMQ=4 RANGEWIDTH=1 C=2
make acc_silent INPUT=input_4_svt1_c3.txt TYPE=0 NUMQ=4 RANGEWIDTH=1 C=3
make acc_silent INPUT=input_4_svt1_c4.txt TYPE=0 NUMQ=4 RANGEWIDTH=1 C=4

# svt2
make acc_silent INPUT=input_1_svt2.txt TYPE=0 NUMQ=1 RANGEWIDTH=1

make acc_silent INPUT=input_2_svt2.txt TYPE=0 NUMQ=2 RANGEWIDTH=1
make acc_silent INPUT=input_2_svt2_c2.txt TYPE=0 NUMQ=2 RANGEWIDTH=1 C=2

make acc_silent INPUT=input_3_svt2.txt TYPE=0 NUMQ=3 RANGEWIDTH=1
make acc_silent INPUT=input_3_svt2_c2.txt TYPE=0 NUMQ=3 RANGEWIDTH=1 C=2
make acc_silent INPUT=input_3_svt2_c3.txt TYPE=0 NUMQ=3 RANGEWIDTH=1 C=3

make acc_silent INPUT=input_4_svt2.txt TYPE=0 NUMQ=4 RANGEWIDTH=1
make acc_silent INPUT=input_4_svt2_c2.txt TYPE=0 NUMQ=4 RANGEWIDTH=1 C=2
make acc_silent INPUT=input_4_svt2_c3.txt TYPE=0 NUMQ=4 RANGEWIDTH=1 C=3
make acc_silent INPUT=input_4_svt2_c4.txt TYPE=0 NUMQ=4 RANGEWIDTH=1 C=4


# Table 2 (b) -----------------------------------------------------

make acc_silent INPUT=input_3_nmax5_width1.txt TYPE=2 NUMQ=3 RANGEWIDTH=1
make acc_silent INPUT=input_3_nmax5_width2.txt TYPE=2 NUMQ=3 RANGEWIDTH=2
make acc_silent INPUT=input_3_nmax5_width3.txt TYPE=2 NUMQ=3 RANGEWIDTH=3


# Table 2 (c) -----------------------------------------------------

# width=1
make acc_silent INPUT=laplace_2_gamma1.txt TYPE=3 NUMQ=2 RANGEWIDTH=1 GAMMA=1
make acc_silent INPUT=laplace_2_gamma2.txt TYPE=3 NUMQ=2 RANGEWIDTH=1 GAMMA=2
make acc_silent INPUT=laplace_2_gamma3.txt TYPE=3 NUMQ=2 RANGEWIDTH=1 GAMMA=3

# width=2
make acc_silent INPUT=laplace_2_width2_gamma1.txt TYPE=3 NUMQ=2 RANGEWIDTH=2 GAMMA=1
make acc_silent INPUT=laplace_2_width2_gamma2.txt TYPE=3 NUMQ=2 RANGEWIDTH=2 GAMMA=2
make acc_silent INPUT=laplace_2_width2_gamma3.txt TYPE=3 NUMQ=2 RANGEWIDTH=2 GAMMA=3
