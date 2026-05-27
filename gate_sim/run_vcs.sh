pkill -f nWave
rm -r simv *.fsdb ucli.key csrc simv.daidir
vcs -full64 -debug_access+all +v2k +neg_tchk -negdelay +sdfverbose +sdf_report chip_top_syn.v FFT64_tb.v tsmc18.v -o simv
./simv
nWave wave.fsdb &
