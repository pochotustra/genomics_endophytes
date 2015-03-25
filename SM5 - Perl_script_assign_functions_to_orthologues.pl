#use warnings;

open(IN,'ortho32a.txt');  # Reading groups file in IN file handler
open(INT,'HeadersEnterobacter.txt'); # Reading headers file in INT file handler
open(OUT,'>FinalTable.txt'); # File handler for writing result into final file OUT

#Passing both file into array and hash decalaration
@file1= <IN>; @file2= <INT>;%hash = ();

# Reading Handler file, making key-value combination for geneid and their function
foreach $ln(@file2)
{
  chomp($ln);
  @tp = split(/\|/,$ln);
  $tp[3] =~ s/^\s+//;$tp[3] =~ s/\s+$//;
  $hash{$tp[3]} = $tp[4];

}


#Reading group file, printing gene function value with gene id
foreach $line(@file1)
{
chomp($line);
@tmp = split(/\|/,$line);
print OUT "$tmp[0] \t";

for($i=0;$i<@tmp;$i++)
{ 
        @arr = split(/ /,$tmp[$i]);
  if($i > 0)
  {
	  $subst = join('|',$substr, $arr[0]);
   
	    if($tmp[$i] =~ /^\D/ )
		{
		  @geneid = split(/ /,$tmp[$i]);
		  print OUT "$subst \t $hash{$geneid[0]} \t ";
		}
  }
  $substr = $arr[1];

 }
 print OUT " \n";
 }


