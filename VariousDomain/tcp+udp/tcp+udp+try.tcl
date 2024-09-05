set ns [new Simulator]
$ns color 1 red
$ns color 2 blue
$ns color 3 cyan

set tracefd	[open tcp+udp.tr w]
$ns trace-all $tracefd
set namfd [open tcp+udp.nam w]
$ns namtrace-all $namfd

# nodes
set n0 [$ns node]
set n1 [$ns node]

# link parameters
$ns duplex-link $n0 $n1 2Mb 10ms DropTail
$ns queue-limit $n0 $n1 20
$ns duplex-link-op $n0 $n1 orient right
$ns duplex-link-op $n0 $n1 queuePos 0.5

# tcp source 1
set tcp1 [new Agent/TCP]
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
#$ns at 10.5 "finish"

$ns run
