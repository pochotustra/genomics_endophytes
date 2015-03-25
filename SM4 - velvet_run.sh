data_path='<data_path>'
shuffleSequences_fastq.pl ${data_path}R1.fastq ${data_path}R2.fastq ${data_path}interleaved.fastq
for k in 61 55 47 39 37 35 33 31
do
        velveth ${data_path}run$k $k -shortPaired -fastq ${data_path}interleaved.fastq
    	velvetg ${data_path}run$k -exp_cov auto -ins_length 600 -cov_cutoff auto
done
