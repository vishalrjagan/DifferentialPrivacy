#!/usr/bin/env bash

make acc_install_silent


# Table 2 (a) -----------------------------------------------------

# svt1 (SparseVariant)
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

# svt2 (Sparse)
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
