make install_silent
make silent INPUT=input_3_svt1.txt
cp math_script.wl Scripts/math_script_3_svt1.wl
make silent INPUT=input_3_svt2.txt
cp math_script.wl Scripts/math_script_3_svt2.wl
make silent INPUT=input_3_svt3.txt
cp math_script.wl Scripts/math_script_3_svt3.wl
make silent INPUT=input_3_svt4.txt
cp math_script.wl Scripts/math_script_3_svt4.wl
make silent INPUT=input_3_svt5.txt
cp math_script.wl Scripts/math_script_3_svt5.wl
make silent INPUT=input_3_svt6.txt
cp math_script.wl Scripts/math_script_3_svt6.wl
make silent INPUT=input_3_nmax5.txt
cp math_script.wl Scripts/math_script_3_nmax5.wl
make silent INPUT=input_3_nmax6.txt
cp math_script.wl Scripts/math_script_3_nmax6.wl
make silent INPUT=input_3_nmax7.txt
cp math_script.wl Scripts/math_script_3_nmax7.wl
make silent INPUT=input_3_nmax8.txt
cp math_script.wl Scripts/math_script_3_nmax8.wl
make silent INPUT=input_3_rr.txt RANGE="eps > 0 && eps < 1"
cp math_script.wl Scripts/math_script_3_rr.wl
mv input.cpp input2.cpp
mv input1.cpp input.cpp
make install_silent
make silent INPUT=input_3_nmax9.txt
cp math_script.wl Scripts/math_script_3_nmax9.wl
make silent INPUT=input_3_nmax10.txt
cp math_script.wl Scripts/math_script_3_nmax10.wl
mv input.cpp input1.cpp
mv input2.cpp input.cpp