make acc_install_silent


# numeric sparse

make acc_silent INPUT=acc_3_numeric_c1_width1_gamma1.txt TYPE=1 NUMQ=3 RANGEWIDTH=1 ALPHA=1 BOUNDFACTOR=1/3
make acc_silent INPUT=acc_3_numeric_c1_width1_gamma1.txt TYPE=1 NUMQ=3 RANGEWIDTH=1 ALPHA=1 BOUNDFACTOR=1/4

make acc_silent INPUT=acc_3_numeric_c2_width1_gamma1.txt TYPE=1 NUMQ=3 RANGEWIDTH=1 C=2 ALPHA=1 BOUNDFACTOR=1/5
make acc_silent INPUT=acc_3_numeric_c2_width1_gamma1.txt TYPE=1 NUMQ=3 RANGEWIDTH=1 C=2 ALPHA=1 BOUNDFACTOR=1/6
