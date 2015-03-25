#!/usr/bin/env python
# $ python juan.py 5 Genus groups.txt

import sys
# Error report and python exit
def stop_err( msg ):    #Function to send and error message and to exit the program  
    sys.stderr.write("ERROR: %s\n" % msg)
    sys.exit(1)

# Input from console
try:
	n, listtaxa, groupfile = sys.argv[1:]
except:
	stop_err("""The program expects the number of taxa 'n', a list of taxa identifiers and the groups file name\nFor example: \n$ python juan.py n listataxa.txt groups.txt""")

try:
    n = int(n)
except:
	stop_err("Are you sure the n value you gave is a number?")



# Read all lines in groups.txt and striped them from the last spaces
group = [x.rstrip().split(' ') for x in open(str(groupfile)).readlines()]



# Save the provided identifiers of the taxa
namestaxa = [x.rstrip().split(' ') for x in open(listtaxa, "r").readlines()]

# Save all the lines with only n number of components (the name of the group + n spp 
# separated by a space)
gngenes = [x for x in group if len(x) == n+1]


for line in group:
	if len(line) > n:
		taxa_c = 0
		for species in namestaxa:
			for contig in line:
				if species[0] in contig:
					taxa_c +=1
					break
		if taxa_c == n:
			print str(' '.join(line))