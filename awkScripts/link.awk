BEGIN {

	fromNode=1; toNode=2;

	lineCount = 0;totalBits = 0;

      }

/^r/&&$3==fromNode&&$4==toNode {

    	totalBits += 8*$6;

	if ( lineCount==0 ) {

	timeBegin = $2; lineCount++;

	} 
	else {

	timeEnd = $2;

	};

};


END{

	duration = timeEnd-timeBegin;

	#print “Number of records is ” lineCount;

	print “Output: “;

	print “Transmission: N” fromNode “->N” toNode; 

	print “  - Total transmitted bits = ” totalBits ” bits”;

	print “  - duration = ” duration ” s”; 

	print “  - Thoughput = “  totalBits/duration/1e3 ” kbps.”; 

};

