rm -rf script_output.txt
echo "Input,              AdjTime,WritTime,  o/p, RunTime, LineCount" >>script_output.txt
echo "--------------------------------------------------------------------------------T1" >>script_output.txt
./AccuracyBash/scripts/table2a.sh >>script_output.txt
echo "--------------------------------------------------------------------------------T2" >>script_output.txt
./AccuracyBash/scripts/table2b.sh >>script_output.txt
echo "--------------------------------------------------------------------------------T3" >>script_output.txt
./AccuracyBash/scripts/table2c.sh >>script_output.txt
echo "--------------------------------------------------------------------------------T4" >>script_output.txt
./AccuracyBash/scripts/table3.sh >>script_output.txt

# Split these into separate scripts: just add the echos to the existing scripts
