#Jared McDonald
#This program takes in a data file containing transposed text and performs Ceasar ciphers until the words Cook or Perl have been found in  the result.
$trans = 1; #current transposition
$fin = 0; #found cook or perl in the sentence
$ind = 0; #index of current letter
@letters = (a..z);
sub getIndex{
	for ($i = 0;$i < 26; $i++){
		if(@letters[$i] eq $_[0]){
			return $i;
		}
	}
}

open(my $INP,"prog2.dat") or die "Can't open the input file.";
my $line = lc <$INP>; #lowercase first line
print "Line read was: $line\n";
$str;

while($fin < 26){
    my @chars = split("",$line); 
	foreach $c (@chars){
	    if($c ne " "){
		    $ind = getIndex($c); #get index of the character in line
		    $str .= @letters[($ind-$trans)%26];
	    }
	    else{
	       $str .= " "; 
	    }
	}
	#print "Transposed($trans) = $str\n";
    if(index($str, "perl") != -1 or index($str, "cook") != -1){
        print "Found the transposition!\n";
		$fin = 26;
    }
	else{
	    $str = "";
		$trans++;
		$fin++;
    }
}
close($INP);
print "$str\n";
print "The original string was transposed by +$trans\n";