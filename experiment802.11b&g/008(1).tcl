##################################################################
# Mohit P. Tahiliani				 		 #
# Ph.D Candidate				 		 #
# Department of Computer Engineering			 	 #
# N.I.T.K., Surathkal				 		 #
# tahiliani.nitk@gmail.com					 #
# www.mohittahiliani.blogspot.com				 #
##################################################################


##################################################################
#		Setting RED Parameters				 #
##################################################################

Queue/RED set thresh_ 5
Queue/RED set maxthresh_ 15
Queue/RED set q_weight_ 0.001
Queue/RED set bytes_ false
Queue/RED set queue_in_bytes_ false
Queue/RED set gentle_ false
Queue/RED set mean_pktsize_ 1000
Queue/RED set setbit_ true
Queue/RED set old_ecn_ true
#Queue/RED set use_mark_p_ true

##################################################################
#	    Setting the Default Parameters			 #
##################################################################

set val(chan)		Channel/WirelessChannel
set val(prop)		Propagation/TwoRayGround
set val(netif)		Phy/WirelessPhy
set val(mac)            Mac/802_11
set val(ifq)		Queue/DropTail
set val(ll)		LL
set val(ant)            Antenna/OmniAntenna
set val(x)		500	
set val(y)		500	
set val(ifqlen)		50		
set val(nn)		7		
set val(stop)		200.0		
set val(rp)             DSDV       	

##################################################################
#	    Creating New Instance of a Scheduler		 #
##################################################################

set ns_		[new Simulator]

##################################################################
#		Creating Trace files				 #
##################################################################

set tracefd	[open 008.tr w]
$ns_ trace-all $tracefd

##################################################################
#	        Creating NAM Trace files			 #
##################################################################

set namtrace [open 008.nam w]
$ns_ namtrace-all-wireless $namtrace $val(x) $val(y)

set prop	[new $val(prop)]

set topo	[new Topography]
$topo load_flatgrid $val(x) $val(y)

create-god $val(nn)

##################################################################
#		Node Configuration				 #
##################################################################

        $ns_ node-config -adhocRouting $val(rp) \
			 -llType $val(ll) \
			 -macType $val(mac) \
			 -ifqType $val(ifq) \
			 -ifqLen $val(ifqlen) \
			 -antType $val(ant) \
			 -propType $val(prop) \
			 -phyType $val(netif) \
			 -channelType $val(chan) \
			 -topoInstance $topo \
			 -agentTrace ON \
			 -routerTrace ON \
			 -macTrace ON
			 #-IncomingErrProc "uniformErr" \
			 #-OutgoingErrProc "uniformErr"

##################################################################
#		Creating Nodes					 #
##################################################################

#	for {set i 0} {$i < $val(nn) } {incr i} {
#		set node_($i) [$ns_ node]	
#		$node_($i) random-motion 0		;# disable random motion
#	}

##################################################################
#		Initial Positions of Nodes			 #
##################################################################

#for {set i 0} {$i < $val(nn)} {incr i} {
#	$ns_ initial_node_pos $node_($i) 40
#}

##################################################################
#		        Error Model				 #
##################################################################
#proc uniformErr {} {
#set err [new ErrorModel]
#$err unit pkt
#$err set rate_ 0.01
#return $err
#}

##################################################################
#		Topology Design				 	 #
##################################################################

set node_(0) [$ns_ node]
$node_(0) set X_ 10
$node_(0) set Y_ 10
$node_(0) set Z_ 0.0
$ns_ initial_node_pos $node_(0) 40
set node_(1) [$ns_ node]
$node_(1) set X_ 10
$node_(1) set Y_ 160
$node_(1) set Z_ 0.0
$ns_ initial_node_pos $node_(1) 40
set node_(2) [$ns_ node]
$node_(2) set X_ 10
$node_(2) set Y_ 310
$node_(2) set Z_ 0.0
$ns_ initial_node_pos $node_(2) 40
set node_(3) [$ns_ node]
$node_(3) set X_ 10
$node_(3) set Y_ 460
$node_(3) set Z_ 0.0
$ns_ initial_node_pos $node_(3) 40


$ns_ node-config -ifqLen 75 ;# We provide less Queue size to Node 4 so as to create Congestion
$ns_ node-config -ifqType Queue/RED

set node_(4) [$ns_ node]
$node_(4) set X_ 160
$node_(4) set Y_ 160
$node_(4) set Z_ 0.0
$ns_ initial_node_pos $node_(4) 40
set node_(5) [$ns_ node]
$node_(5) set X_ 310
$node_(5) set Y_ 310
$node_(5) set Z_ 0.0
$ns_ initial_node_pos $node_(5) 40
set node_(6) [$ns_ node]
$node_(6) set X_ 310
$node_(6) set Y_ 10
$node_(6) set Z_ 0.0
$ns_ initial_node_pos $node_(6) 40

##################################################################
#		Generating Traffic				 #
##################################################################

Agent/TCP set ecn_ 1
Agent/TCP set old_ecn_ 1

set tcp0 [new Agent/TCP]
set sink0 [new Agent/TCPSink]
$ns_ attach-agent $node_(0) $tcp0
$ns_ attach-agent $node_(5) $sink0
$ns_ connect $tcp0 $sink0
set ftp0 [new Application/FTP]
$ftp0 attach-agent $tcp0
$ns_ at 30.0 "$ftp0 start" 
$ns_ at 198.0 "$ftp0 stop"
set tcp0file [open ecnerr-tcp0-cwnd.tr w]
$tcp0 attach $tcp0file
$tcp0 trace cwnd_ 

set tcp1 [new Agent/TCP]
set sink1 [new Agent/TCPSink]
$ns_ attach-agent $node_(1) $tcp1
$ns_ attach-agent $node_(5) $sink1
$ns_ connect $tcp1 $sink1
set ftp1 [new Application/FTP]
$ftp1 attach-agent $tcp1
$ns_ at 30.0 "$ftp1 start" 
$ns_ at 198.0 "$ftp1 stop"
set tcp1file [open ecnerr-tcp1-cwnd.tr w]
$tcp1 attach $tcp1file
$tcp1 trace cwnd_ 

set tcp2 [new Agent/TCP]
set sink2 [new Agent/TCPSink]
$ns_ attach-agent $node_(2) $tcp2
$ns_ attach-agent $node_(6) $sink2
$ns_ connect $tcp2 $sink2
set ftp2 [new Application/FTP]
$ftp2 attach-agent $tcp2
$ns_ at 30.0 "$ftp2 start" 
$ns_ at 198.0 "$ftp2 stop"
set tcp2file [open ecnerr-tcp2-cwnd.tr w]
$tcp2 attach $tcp2file
$tcp2 trace cwnd_ 

set tcp3 [new Agent/TCP]
set sink3 [new Agent/TCPSink]
$ns_ attach-agent $node_(3) $tcp3
$ns_ attach-agent $node_(6) $sink3
$ns_ connect $tcp3 $sink3
set ftp3 [new Application/FTP]
$ftp3 attach-agent $tcp3
$ns_ at 30.0 "$ftp3 start" 
$ns_ at 198.0 "$ftp3 stop"
set tcp3file [open ecnerr-tcp3-cwnd.tr w]
$tcp3 attach $tcp3file
$tcp3 trace cwnd_ 

set tcp5 [new Agent/TCP]
set sink5 [new Agent/TCPSink]
$ns_ attach-agent $node_(5) $tcp5
$ns_ attach-agent $node_(6) $sink5
$ns_ connect $tcp5 $sink5
set ftp5 [new Application/FTP]
$ftp5 attach-agent $tcp5
$ns_ at 30.0 "$ftp5 start" 
$ns_ at 198.0 "$ftp5 stop"
set tcp5file [open ecnerr-tcp5-cwnd.tr w]
$tcp5 attach $tcp5file
$tcp5 trace cwnd_ 

set tcp6 [new Agent/TCP]
set sink6 [new Agent/TCPSink]
$ns_ attach-agent $node_(6) $tcp6
$ns_ attach-agent $node_(5) $sink6
$ns_ connect $tcp6 $sink6
set ftp6 [new Application/FTP]
$ftp6 attach-agent $tcp6
$ns_ at 100.0 "$ftp6 produce 3" 

##################################################################
#		Simulation Termination				 #
##################################################################

for {set i 0} {$i < $val(nn) } {incr i} {
    $ns_ at $val(stop) "$node_($i) reset";
}
$ns_ at $val(stop) "puts \"NS EXITING...\" ; $ns_ halt"

puts "Starting Simulation..."

$ns_ run
