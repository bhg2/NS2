# ns simulation program for testing competing flow behavior
# by Leonardo Balliache
# april 2004
#
# this file correspond to two tcp flow

# original test
set file "tcp+udp"

# to generate files for test using packets of 100 bytes
# set file "tcp+udp-100bytes"

# to generate files for test using 4000 bytes packets
# set file "tcp+udp-4000bytes"

# to generate files for test using less link throughput (1 Mb instead of 2Mb)
# set file "tcp+udp-1Mb"

# to generate files for test using an overbuffered router
# set file "tcp+udp-overbuf"

# to generate files for test using an underbuffered router
# set file "tcp+udp-underbuf"

# to generate files for test using a longer link (100ms propagation delay)
# set file "tcp+udp-link100ms"

# to generate files for test using bulk tcp vs interactive udp
# set file "tcp+udp-bulk-vs-inter"

set ns [new Simulator]
$ns color 1 red
$ns color 2 blue
$ns color 3 cyan

# exec nam
set xnam 0

set fall [open ./temp/out.tra w]
$ns trace-all $fall
set fnam [open ./temp/out.nam w]
$ns namtrace-all $fnam

proc finish {} {

    global ns fall fnam
	global xnam file
			
	set flow  {{
		if ( $8 == fw )
			print $0;
	}}
    set ewma  {{
		a = 0.9;
		if ( y == 0 )
			y = $2;
		x = $2;
		y = a*y + (1-a)*x;
        printf("%f  %f\n", $1, y);
    }}
    set ingress  {{
        printf("%05d   %09d  +\n", $1, 1000000*$2);
    }}
    set egress  {{
        printf("%05d   %09d  r\n", $1, 1000000*$2);
    }}
    set bw  {{
		if ( old1 == 0 )  {
			old1 = $1;
            printf("%f  %f\n", 0, 0);	# to compel gnuplot to use point x=0, y=0
		}
        else if ( (dif = $1 - old1) == 0 )
			old1 = $1;
        else if ( dif > 0 )  {
            printf("%f  %f\n", $1, (8*$2/1024)/dif);
            old1 = $1;
        }
    }}
    set meanbw  {{
		bytes += $2;
		if ( start == 0 )  {
			start = 0.1;
            printf("%f  %f\n", 0, 0);	# to compel gnuplot to use point x=0, y=0
		}
		elapsed = $1 - start;		
        if ( elapsed > 0 )
            printf("%f  %f\n", $1, (8*bytes/1024)/elapsed);
    }}
    set bytes  {{
		bytes += $2;
    } END { if ( bytes > 0 ) printf("KB sent: %f\n", bytes/1024); }}
    set latency  {{
		if ( $3 == "+" )  {
			if ( pkt[1] == 0 )  {
				ti[1] = $2;
				pkt[1] = $1+1;
			}
			else if ( pkt[2] == 0 )  {
				ti[2] = $2;
				pkt[2] = $1+1;
			}
			else if ( pkt[3] == 0 )  {
				ti[3] = $2;
				pkt[3] = $1+1;
			}
			else if ( pkt[4] == 0 )  {
				ti[4] = $2;
				pkt[4] = $1+1;
			}
			else  {
				ti[1] = ti[2];
				pkt[1] = pkt[2];
				ti[2] = ti[3];
				pkt[2] = pkt[3];
				ti[3] = ti[4];
				pkt[3] = pkt[4];
				ti[4] = $2;
				pkt[4] = $1+1;
			}
		}
		else  {		# $3 is 'r'
			rpkt = $1+1;
			maxlat = 15000;
			if ( pkt[4] == rpkt )  {
				if ( (lat = ($2-ti[4])/1000) > maxlat )
					lat = maxlat;
            	printf("%d  %f  %f\n", pkt[4], lat, $2/1000000);
			}
			if ( pkt[3] == rpkt )  {
				if ( (lat = ($2-ti[3])/1000) > maxlat )
					lat = maxlat;
            	printf("%d  %f  %f\n", pkt[3], lat, $2/1000000);
			}
			if ( pkt[2] == rpkt )  {
				if ( (lat = ($2-ti[2])/1000) > maxlat )
					lat = maxlat;
            	printf("%d  %f  %f\n", pkt[2], lat, $2/1000000);
			}
			if ( pkt[1] == rpkt )  {
				if ( (lat = ($2-ti[1])/1000) > maxlat )
					lat = maxlat;
            	printf("%d  %f  %f\n", pkt[1], lat, $2/1000000);
			}
			ti[1] = 0; ti[2] = 0; ti[3] = 0; ti[4] = 0;
			pkt[1] = 0; pkt[2] = 0; pkt[3] = 0; pkt[4] = 0;
		}
    }}
    set jitter  {{
		if ( pkt == 0 )  {
			ti = $2;
			pkt = $1;
		}
		else if ( $1 == (pkt+1) )  {
            printf("%d  %f  %f\n", $1, $2-ti, $3);
			ti = $2;
			pkt = $1;
		}
		else if ( $1 > (pkt+1) )  {
			ti = $2;
			pkt = $1;
		}
    }}
    set losses  {{
		if ( $1 == "+" )
			sent += 1;
		else if ( $1 == "d" )
            lost += 1;
    } END { 
		if ( sent > 0 )  { 
			printf("   Packets sent: %5d\n", sent);
			printf("Packets dropped: %5d\n", lost);
			printf("   Total losses: %12.6f%\n", 100*lost/sent);
		} 
	}}
    set queue  {{
		if ( $1 == "+" )
			queue += 1;
		else if ( $1 == "d" || $1 == "-" )
            queue -= 1;
        printf("%f  %d\n", $2, queue);
	}}

    $ns flush-trace
    close $fall
    close $fnam
	if { $xnam == 1 } { exec nam ./temp/out.nam & }
		
	# bandwidth	- tcp+udp
    exec cat ./temp/out.tra | awk -v fw=1 $flow | grep "0 1 tcp" | grep ^r | perl column 1 5 | awk $bw | awk $ewma >./temp/bw.tcp
    exec cat ./temp/out.tra | awk -v fw=2 $flow | grep "0 1 cbr" | grep ^r | perl column 1 5 | awk $bw | awk $ewma >./temp/bw.udp

	# bandwidth - graph
	exec echo "tcp+udp" >./temp/title.tmp
	exec echo "time elapsed in seconds" >./temp/xlabel.tmp
	exec echo "throughput in kbps" >./temp/ylabel.tmp
	exec echo "./graphs/bw-$file.png" >./temp/output.tmp
	exec echo "plot \"./temp/bw.tcp\" using 1:2 title \"tcp flow\" with lines,\
	                \"./temp/bw.udp\" using 1:2 title \"udp-flow\" with lines" >./temp/plot.tmp
    exec gnuplot gnuplot.plot

	# mean bandwidth - tcp+udp
   	exec cat ./temp/out.tra | awk -v fw=1 $flow | grep "0 1 tcp" | grep ^r | perl column 1 5 | awk $meanbw >./temp/meanbw.tcp
   	exec cat ./temp/out.tra | awk -v fw=2 $flow | grep "0 1 cbr" | grep ^r | perl column 1 5 | awk $meanbw >./temp/meanbw.udp

	# bandwidth - graph
	exec echo "system throughput in kbps" >./temp/ylabel.tmp
	exec echo "./graphs/meanbw-$file.png" >./temp/output.tmp
	exec echo "plot \"./temp/meanbw.tcp\" using 1:2 title \"tcp-flow\" with lines,\
                    \"./temp/meanbw.udp\" using 1:2 title \"udp-flow\" with lines" >./temp/plot.tmp
    exec gnuplot gnuplot.plot

	# bytes transfered - tcp+udp
   	exec cat ./temp/out.tra | awk -v fw=1 $flow | grep "0 1 tcp" | grep ^r | perl column 1 5 | awk $bytes >./graphs/bytes-tcp-$file.txt
   	exec cat ./temp/out.tra | awk -v fw=2 $flow | grep "0 1 cbr" | grep ^r | perl column 1 5 | awk $bytes >./graphs/bytes-udp-$file.txt
	
	# latency - tcp+udp
	exec cat ./temp/out.tra | awk -v fw=1 $flow | grep "0 1 tcp" | grep ^+ | perl column 10 1 | awk $ingress >./temp/ingress.tcp
	exec cat ./temp/out.tra | awk -v fw=1 $flow | grep "0 1 tcp" | grep ^r | perl column 10 1 | awk $egress >./temp/egress.tcp
	exec cat ./temp/ingress.tcp ./temp/egress.tcp | sort +0 +1 | awk $latency >./temp/latency.tcp
	exec cat ./temp/out.tra | awk -v fw=2 $flow | grep "0 1 cbr" | grep ^+ | perl column 10 1 | awk $ingress >./temp/ingress.udp
	exec cat ./temp/out.tra | awk -v fw=2 $flow | grep "0 1 cbr" | grep ^r | perl column 10 1 | awk $egress >./temp/egress.udp
	exec cat ./temp/ingress.udp ./temp/egress.udp | sort +0 +1 | awk $latency >./temp/latency.udp
	
	# latency - graph
	exec echo "latency in ms" >./temp/ylabel.tmp
	exec echo "./graphs/latency-$file.png" >./temp/output.tmp
	exec echo "plot \"./temp/latency.tcp\" using 3:2 title \"tcp-flow\" with points,\
 					\"./temp/latency.udp\" using 3:2 title \"udp-flow\" with points" >./temp/plot.tmp
    exec gnuplot gnuplot.plot
	
	# jitter - tcp
	exec cat ./temp/latency.tcp | awk $jitter >./temp/jitter.tcp
	exec cat ./temp/latency.udp | awk $jitter >./temp/jitter.udp
	
	# jitter - graph
	exec echo "jitter in ms" >./temp/ylabel.tmp
	exec echo "./graphs/jitter-$file.png" >./temp/output.tmp
	exec echo "plot \"./temp/jitter.tcp\" using 3:2 title \"tcp-flow\" with points,\
					\"./temp/jitter.udp\" using 3:2 title \"udp-flow\" with points" >./temp/plot.tmp
    exec gnuplot gnuplot.plot
	
	# queue length - tcp
    exec cat ./temp/out.tra | awk -v fw=1 $flow | grep "0 1 tcp" >./temp/queue1.tmp
    exec cat ./temp/queue1.tmp | awk $queue | awk $ewma >./temp/queue.tcp
    exec cat ./temp/out.tra | awk -v fw=2 $flow | grep "0 1 cbr" >./temp/queue2.tmp
    exec cat ./temp/queue2.tmp | awk $queue | awk $ewma >./temp/queue.udp
	
	# queue length - graph
	exec echo "queue length in packets" >./temp/ylabel.tmp
	exec echo "./graphs/queue-$file.png" >./temp/output.tmp
	exec echo "plot \"./temp/queue.tcp\" using 1:2 title \"tcp-flow\" with lines,\
					\"./temp/queue.udp\" using 1:2 title \"udp-flow\" with lines" >./temp/plot.tmp
    exec gnuplot gnuplot.plot
	
	# loss - tcp
    exec cat ./temp/queue1.tmp | awk $losses >./graphs/loss-tcp-$file.txt
    exec cat ./temp/queue2.tmp | awk $losses >./graphs/loss-udp-$file.txt
	
	# total queue length - tcp
    exec cat ./temp/out.tra | grep "0 1" >./temp/queue.tmp
    exec cat ./temp/queue.tmp | awk $queue | awk $ewma >./temp/queue.both
	
	# total queue length - graph
	exec echo "total queue length in packets" >./temp/ylabel.tmp
	exec echo "./graphs/totalqueue-$file.png" >./temp/output.tmp
	exec echo "plot \"./temp/queue.both\" using 1:2 title \"tcp+udp\" with lines" >./temp/plot.tmp
    exec gnuplot gnuplot.plot
	
	# we're ready
    exit 0
}

# nodes
set n0 [$ns node]
set n1 [$ns node]

# link parameters
$ns duplex-link $n0 $n1 2Mb 10ms DropTail

# to see what happen when the link has less capacity (1Mb instead of 2Mb)
# $ns duplex-link $n0 $n1 1Mb 10ms DropTail

# to see what happen when the link has a longer distance (100ms instead of 10ms)
# $ns duplex-link $n0 $n1 2Mb 100ms DropTail

# queue parameters: just 20 packets
$ns queue-limit $n0 $n1 20

# queue parameters: to check what happen when the system is overbuffered
# $ns queue-limit $n0 $n1 50

# queue parameters: to check what happen when the system is underbuffered
# $ns queue-limit $n0 $n1 5

# just for nam
$ns duplex-link-op $n0 $n1 orient right
$ns duplex-link-op $n0 $n1 queuePos 0.5

# tcp source 1
set tcp1 [new Agent/TCP/Reno]
$tcp1 set fid_ 1
$ns attach-agent $n0 $tcp1

# tcp app 1
set ftp1 [new Application/FTP]
$ftp1 set type_ FTP
$ftp1 attach-agent $tcp1

# tcp sink 1
set sink1 [new Agent/TCPSink]
$ns attach-agent $n1 $sink1
$ns connect $tcp1 $sink1

# to check what happen when we have an small packet size
# $tcp1 set packetSize_ 100

# to check what happen when we have an large packet size
# $tcp1 set packetSize_ 4000

# udp source 2
set udp2 [new Agent/UDP]
$udp2 set fid_ 2
$ns attach-agent $n0 $udp2

# udp null 2
set null2 [new Agent/Null]
$ns attach-agent $n1 $null2
$ns connect $udp2 $null2

# udp app 2
set cbr2 [new Application/Traffic/CBR]
$cbr2 set type_ CBR
$cbr2 set packet_size_ 1000
$cbr2 set rate_ 0.95mb
$cbr2 set random_ false
$cbr2 attach-agent $udp2

# to check what happen when we have a small packet size
# $udp2 set packetSize_ 100
# $cbr2 set packet_size_ 100

# to check what happen when we have an large packet size
# $udp2 set packetSize_ 4000
# $cbr2 set packet_size_ 4000

$ns at 0.1 "$ftp1 start"
$ns at 0.1 "$cbr2 start"
$ns at 10.0 "$ftp1 stop"
$ns at 10.0 "$cbr2 stop"
$ns at 10.5 "finish"

$ns run
