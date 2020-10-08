#!/usr/bin/env bash

make acc_install_silent


# ------ noisy max better bounds, range (-1,1) ------

make acc_silent INPUT=input_3_nmax5_width1.txt TYPE=2 NUMQ=3 RANGEWIDTH=1 BOUNDFACTOR=1/4
make acc_silent INPUT=input_4_nmax5.txt TYPE=2 NUMQ=4 RANGEWIDTH=1 BOUNDFACTOR=1/4

# Failure inputs and epsilon

make acc_silent INPUT=input_3_nmax5_width1.txt TYPE=2 NUMQ=3 RANGEWIDTH=1 BOUNDFACTOR=1/5
make acc_silent INPUT=input_4_nmax5.txt TYPE=2 NUMQ=4 RANGEWIDTH=1 BOUNDFACTOR=1/5
