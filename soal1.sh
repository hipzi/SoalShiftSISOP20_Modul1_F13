#!/bin/bash

#!/bin/bash

gawk -F "\t" '
NR>1 {
	arr[$13]+=$NF;
}
 
END { PROCINFO["sorted_in"] = "@val_num_asc"
	for (i in arr) { 
	print "Region : "i 
	}
}' Sample-Superstore.tsv | head -1

gawk -F "\t" '
NR>1 {
	if($13 == "Central") {
		arr[$11]+=$NF;
	}
}
 
END { PROCINFO["sorted_in"] = "@val_num_asc"
	for (i in arr) { 
		print "State : "i 
	}
}' Sample-Superstore.tsv | head -2


gawk -F "\t" '
NR>1 {
	if($11 == "Texas" || $11 == "Illinois") {
		arr[$17]+=$NF;
	}
}
 
END { PROCINFO["sorted_in"] = "@val_num_asc"
	for (i in arr) { 
		print "Product Name : " i 
	}
}' Sample-Superstore.tsv | head -10
 



