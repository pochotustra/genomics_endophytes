data_path='<data_path>'
for k in 87 81 77 75 71 67 61 57 51 47 41 39 37 35 31
do
	SOAPdenovo-127mer all -K$k -p 2 -s ${data_path}SOAPdenovo.config -o ${data_path}asm_<sample_id>_$k
	GapCloser -b ${data_path}SOAPdenovo.config \
	-a ${data_path}asm_<sample_id>_$k.scafSeq -o ${data_path}asm2_<sample_id>_$k.scafSeq -t 8 -p 31
done