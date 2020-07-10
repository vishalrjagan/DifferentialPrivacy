make acc_install_silent

# # |Q|=1
# make acc_silent INPUT=acc_1_numeric_c1_width1_gamma0.txt TYPE=1 NUMQ=1 RANGEWIDTH=1 ALPHA=0
# make acc_silent INPUT=acc_1_numeric_c1_width1_gamma1.txt TYPE=1 NUMQ=1 RANGEWIDTH=1 ALPHA=1

# # |Q|=2
# make acc_silent INPUT=acc_2_numeric_c1_width1_gamma0.txt TYPE=1 NUMQ=2 RANGEWIDTH=1 ALPHA=0
# make acc_silent INPUT=acc_2_numeric_c1_width1_gamma1.txt TYPE=1 NUMQ=2 RANGEWIDTH=1 ALPHA=1
# ## range (-2,2)
# make acc_silent INPUT=acc_2_numeric_c1_width2_gamma0.txt TYPE=1 NUMQ=2 RANGEWIDTH=2 ALPHA=0
# make acc_silent INPUT=acc_2_numeric_c1_width2_gamma1.txt TYPE=1 NUMQ=2 RANGEWIDTH=2 ALPHA=1
# make acc_silent INPUT=acc_2_numeric_c1_width2_gamma2.txt TYPE=1 NUMQ=2 RANGEWIDTH=2 ALPHA=2
# ## c=2
# make acc_silent INPUT=acc_2_numeric_c2_width1_gamma0.txt TYPE=1 NUMQ=2 C=2 RANGEWIDTH=1 ALPHA=0
# make acc_silent INPUT=acc_2_numeric_c2_width1_gamma1.txt TYPE=1 NUMQ=2 C=2 RANGEWIDTH=1 ALPHA=1

# #|Q|=3, range (-1,1)
# ## c=1
# make acc_silent INPUT=acc_3_numeric_c1_width1_gamma0.txt TYPE=1 NUMQ=3 RANGEWIDTH=1 ALPHA=0
# make acc_silent INPUT=acc_3_numeric_c1_width1_gamma1.txt TYPE=1 NUMQ=3 RANGEWIDTH=1 ALPHA=1
# make acc_silent INPUT=acc_3_numeric_c1_width1_gamma2.txt TYPE=1 NUMQ=3 RANGEWIDTH=1 ALPHA=2
# ## c=2
# make acc_silent INPUT=acc_3_numeric_c2_width1_gamma0.txt TYPE=1 NUMQ=3 RANGEWIDTH=1 C=2 ALPHA=0
# make acc_silent INPUT=acc_3_numeric_c2_width1_gamma1.txt TYPE=1 NUMQ=3 RANGEWIDTH=1 C=2 ALPHA=1
# make acc_silent INPUT=acc_3_numeric_c2_width1_gamma2.txt TYPE=1 NUMQ=3 RANGEWIDTH=1 C=2 ALPHA=2

# #|Q|=3, range (-2,2), c=2
# make acc_silent INPUT=acc_3_numeric_c2_width2_gamma0.txt TYPE=1 NUMQ=3 RANGEWIDTH=2 C=2 ALPHA=0
# make acc_silent INPUT=acc_3_numeric_c2_width2_gamma1.txt TYPE=1 NUMQ=3 RANGEWIDTH=2 C=2 ALPHA=1
# make acc_silent INPUT=acc_3_numeric_c2_width2_gamma2.txt TYPE=1 NUMQ=3 RANGEWIDTH=2 C=2 ALPHA=2

# #|Q|=4, range (-2,2), c=2
# make acc_silent INPUT=acc_4_numeric_c2_width2_gamma0.txt TYPE=1 NUMQ=4 RANGEWIDTH=2 C=2 ALPHA=0
# make acc_silent INPUT=acc_4_numeric_c2_width2_gamma1.txt TYPE=1 NUMQ=4 RANGEWIDTH=2 C=2 ALPHA=1
# make acc_silent INPUT=acc_4_numeric_c2_width2_gamma2.txt TYPE=1 NUMQ=4 RANGEWIDTH=2 C=2 ALPHA=2


# # Filling in gaps for width 2
# # 1 1 0
# make acc_silent INPUT=acc_1_numeric_c1_width2_gamma0.txt TYPE=1 NUMQ=1 RANGEWIDTH=2 ALPHA=0
# # 1 1 1
# make acc_silent INPUT=acc_1_numeric_c1_width2_gamma1.txt TYPE=1 NUMQ=1 RANGEWIDTH=2 ALPHA=1
# # 2 2 0
# make acc_silent INPUT=acc_2_numeric_c2_width2_gamma0.txt TYPE=1 NUMQ=2 C=2 RANGEWIDTH=2 ALPHA=0
# # 2 2 1
# make acc_silent INPUT=acc_2_numeric_c2_width2_gamma1.txt TYPE=1 NUMQ=2 C=2 RANGEWIDTH=2 ALPHA=1


# Filling in gaps for width 1
# make acc_silent INPUT=acc_4_numeric_c1_width1_gamma0.txt TYPE=1 NUMQ=4 RANGEWIDTH=1 ALPHA=0
# make acc_silent INPUT=acc_4_numeric_c1_width1_gamma1.txt TYPE=1 NUMQ=4 RANGEWIDTH=1 ALPHA=1
# make acc_silent INPUT=acc_4_numeric_c2_width1_gamma0.txt TYPE=1 NUMQ=4 RANGEWIDTH=1 C=2 ALPHA=0
# make acc_silent INPUT=acc_4_numeric_c2_width1_gamma1.txt TYPE=1 NUMQ=4 RANGEWIDTH=1 C=2 ALPHA=1


# Filling in gaps for width 2
# 4 1 0
# make acc_silent INPUT=acc_4_numeric_c1_width2_gamma0.txt TYPE=1 NUMQ=4 RANGEWIDTH=2 ALPHA=0
# 4 1 1
# make acc_silent INPUT=acc_4_numeric_c1_width2_gamma1.txt TYPE=1 NUMQ=4 RANGEWIDTH=2 ALPHA=1
# 3 1 0
# make acc_silent INPUT=acc_3_numeric_c1_width2_gamma0.txt TYPE=1 NUMQ=3 RANGEWIDTH=2 ALPHA=0
# 3 1 1
# make acc_silent INPUT=acc_3_numeric_c1_width2_gamma1.txt TYPE=1 NUMQ=3 RANGEWIDTH=2 ALPHA=1
# 2 2 2
make acc_silent INPUT=acc_2_numeric_c2_width2_gamma2.txt TYPE=1 NUMQ=2 RANGEWIDTH=2 C=2 ALPHA=2
# 4 1 2
make acc_silent INPUT=acc_4_numeric_c1_width2_gamma2.txt TYPE=1 NUMQ=4 RANGEWIDTH=2 C=1 ALPHA=2
# 3 1 2
make acc_silent INPUT=acc_3_numeric_c1_width2_gamma2.txt TYPE=1 NUMQ=3 RANGEWIDTH=2 C=1 ALPHA=2
# 1 1 2
make acc_silent INPUT=acc_1_numeric_c1_width2_gamma2.txt TYPE=1 NUMQ=1 RANGEWIDTH=2 C=1 ALPHA=2
