#!/usr/bin/env bash

make acc_install_silent


# Table 2 (c) -----------------------------------------------------

# width=1
make acc_silent INPUT=input_2_laplace_gamma1.txt TYPE=3 NUMQ=2 RANGEWIDTH=1 GAMMA=1
make acc_silent INPUT=input_2_laplace_gamma2.txt TYPE=3 NUMQ=2 RANGEWIDTH=1 GAMMA=2
make acc_silent INPUT=input_2_laplace_gamma3.txt TYPE=3 NUMQ=2 RANGEWIDTH=1 GAMMA=3

# width=2
make acc_silent INPUT=input_2_laplace_width2_gamma1.txt TYPE=3 NUMQ=2 RANGEWIDTH=2 GAMMA=1
make acc_silent INPUT=input_2_laplace_width2_gamma2.txt TYPE=3 NUMQ=2 RANGEWIDTH=2 GAMMA=2
make acc_silent INPUT=input_2_laplace_width2_gamma3.txt TYPE=3 NUMQ=2 RANGEWIDTH=2 GAMMA=3
