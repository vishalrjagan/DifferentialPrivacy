make install_silent
make silent INPUT=input_3_svt7_d0.txt FRAC=0.5 
cp math_script.wl Scripts/math_script_3_svt7_1.wl
make silent INPUT=input_3_svt7_d0.txt FRAC=0.5 DELTA=Exp[-1/32]
cp math_script.wl Scripts/math_script_3_svt7_2.wl
make silent INPUT=input_3_svt7_d0.txt FRAC=0.5 DELTA=Exp[-4]
cp math_script.wl Scripts/math_script_3_svt7_3.wl
make silent INPUT=input_3_svt7_c2_d0.txt FRAC=0.5
cp math_script.wl Scripts/math_script_3_svt7_4.wl
make silent INPUT=input_3_svt7_c2_d0.txt FRAC=0.5 DELTA=Exp[-2]
cp math_script.wl Scripts/math_script_3_svt7_5.wl
make silent INPUT=input_3_svt7_c2_d0.txt FRAC=0.5 DELTA=Exp[-4]
cp math_script.wl Scripts/math_script_3_svt7_6.wl
# make silent INPUT=input_3_svt7_c2_d0.txt FRAC=0.5 DELTA=Exp[-1/64]
# cp math_script.wl Scripts/math_script_3_svt7_7.wl