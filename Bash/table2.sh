make install_silent
make silent INPUT=input_5_svt3_01.txt
cp math_script.wl Scripts/math_script_5_svt3_01.wl
make silent INPUT=input_2_svt4.txt
cp math_script.wl Scripts/math_script_2_svt4.wl
make silent INPUT=input_2_svt5.txt
cp math_script.wl Scripts/math_script_2_svt5.wl
make silent INPUT=input_3_svt6.txt
cp math_script.wl Scripts/math_script_3_svt6.wl
make silent INPUT=input_3_nmax7.txt
cp math_script.wl Scripts/math_script_3_nmax7.wl
make silent INPUT=input_1_nmax8.txt
cp math_script.wl Scripts/math_script_1_nmax8.wl
make silent INPUT=input_1_rr.txt RANGE="eps > 0 && eps < 1"
cp math_script.wl Scripts/math_script_1_rr.wl
mv input.cpp input2.cpp
mv input1.cpp input.cpp
make install_silent
make silent INPUT=input_1_nmax10.txt
cp math_script.wl Scripts/math_script_1_nmax10.wl
mv input.cpp input1.cpp
mv input2.cpp input.cpp