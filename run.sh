rm -rf script_output.txt
echo "Input,              AdjTime,WritTime,  o/p, RunTime, LineCount" >>script_output.txt
echo "--------------------------------------------------------------------------------Table2a" >>script_output.txt
./AccuracyBash/scripts/table2a.sh >>script_output.txt
echo "--------------------------------------------------------------------------------Table2b" >>script_output.txt
./AccuracyBash/scripts/table2b.sh >>script_output.txt
echo "--------------------------------------------------------------------------------Table2c" >>script_output.txt
./AccuracyBash/scripts/table2c.sh >>script_output.txt
echo "--------------------------------------------------------------------------------Table3" >>script_output.txt
./AccuracyBash/scripts/table3.sh >>script_output.txt
echo "--------------------------------------------------------------------------------Table4" >>script_output.txt
./AccuracyBash/scripts/svt_better_bounds.sh >>script_output.txt
./AccuracyBash/scripts/noisy_max_better_bounds.sh >>script_output.txt
./AccuracyBash/scripts/numeric_better_bounds.sh >>script_output.txt
