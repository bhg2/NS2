
Queue/XCP set xcp_on_ 1
Agent/TCP set minrto_ 1

proc set-red-params { qsize } {

	Queue/RED set thresh_ [expr 0.6 * $qsize]
	Queue/RED set maxthresh_ [expr 0.8 * $qsize]
	Queue/RED set q_weight_ 0.001
	Queue/RED set linterm_ 10
	Queue/RED set bytes_ false ;
	Queue/RED set queue_in_bytes_ false ;
	Agent/TCP set old_ecn_ true
	Queue/RED set setbit_     true
}


proc create-topology2 { BW delay qtype qsize numSideLinks deltaDelay } {
    global ns 
    

set nf [open out.nam w]
$ns namtrace-all $nf

    #Set the queue size to the pipe's size assuming the packet size is 1000 KByte
    if { $qsize == 0 } { set qsize [expr round([expr ($BW / 8) * 2 * $delay])] }

    set i 0
    while { $i < 2 } {
	global R$i
	set R$i [$ns node]
	incr i
    }
    
    $ns duplex-link $R0 $R1 [set BW]Mb [set delay]ms $qtype
    $ns queue-limit $R0 $R1 $qsize
    $ns queue-limit $R1 $R0 $qsize

    # Give a global handle to the Bottleneck Queue to allow 
    # setting the RED paramters
    global Bottleneck rBottleneck
    set  Bottleneck  [[$ns link $R0 $R1] queue] 
    set  rBottleneck [[$ns link $R1 $R0] queue]
    global l rl
    set  l  [$ns link $R0 $R1]  
    set  rl [$ns link $R1 $R0]

    global all_links 
    set all_links "$l $rl "

    # The side links  have the same BW as the Bottleneck
    set i 0
    while { $i < $numSideLinks } {
	global n$i q$i rq$i l$i rl$i
	set n$i  [$ns node]
	$ns duplex-link [set n$i]  $R0  [set BW]Mb [expr $delay + $i * $deltaDelay]ms $qtype
	$ns queue-limit [set n$i]  $R0  $qsize
	$ns queue-limit $R0 [set n$i]   $qsize
	set  q$i   [[$ns link [set n$i]  $R0] queue] 
	set  rq$i  [[$ns link $R0 [set n$i]] queue]
	set  l$i    [$ns link [set n$i]  $R0] 
	set  rl$i   [$ns link $R0 [set n$i]]
	set all_links "$all_links [set l$i] [set rl$i] "
	incr i
    }
}
#------- Sender Class :
# This is essentially an ftp sender
Class GeneralSender  -superclass Agent 

# otherparams are "startTime TCPclass .."
GeneralSender instproc init { id node rcvrTCP otherparams } {
    global  ns
    $self next
    $self instvar tcp_ id_ ftp_ node_ tcp_rcvr_ tcp_type_
    set id_ $id
    set node_ $node

    if { [llength $otherparams] > 1 } {
	set TCP [lindex $otherparams 1]
    } else { 
	set TCP "TCP/Reno"
    }
    set   tcp_type_ $TCP
    set   tcp_ [new Agent/$TCP]
    $tcp_ set  packetSize_ 1000   
    $tcp_ set  class_  $id
    set   ftp_ [new Source/FTP]
    $ftp_ set agent_ $tcp_
    $ns   attach-agent $node $tcp_
    $ns   connect $tcp_  $rcvrTCP
    set   tcp_rcvr_ $rcvrTCP
    set   startTime [lindex $otherparams 0]
    $ns   at $startTime "$ftp_ start"
    puts  "initialized Sender $id_ at $startTime"
}

GeneralSender instproc trace-xcp parameters {
    $self instvar tcp_ id_ tcpTrace_
    global ftracetcp$id_ 
    set ftracetcp$id_ [open  xcp$id_.tr  w]
    set tcpTrace_ [set ftracetcp$id_]
    $tcp_ attach-trace [set ftracetcp$id_]
    if { -1 < [lsearch $parameters cwnd]  } { $tcp_ tracevar cwnd_ }
    if { -1 < [lsearch $parameters seqno] } { $tcp_ tracevar t_seqno_ }
}
#--- Command line arguments
proc  set-cmd-line-args { list_args } {
    global argv

    set i 0
    foreach a $list_args {
	global $a
	set $a  [lindex $argv $i]
	puts "$a = [set $a]"
	incr i
    }
}

#-------------- Plotting functions -----------#

# plot a xcp traced var
proc plot-xcp { TraceName nXCPs  PlotTime what } {
    if {[string compare $what "cwnd_"] == 0} {
	exec rm -f xgraph_cwnd.tcp
	set f [open xgraph_cwnd.tcp w]
	set a cwnd
    } else {
	exec rm -f xgraph_seqno.tcp
	set f [open xgraph_seqno.tcp w]
	set a seqno
    }
    puts $f "TitleText: $TraceName"
    puts $f "Device: Postscript"

    foreach i $nXCPs {
	#the TCP traces are flushed when the sources are stopped
	exec rm -f temp.tcp 
        exec touch temp.tcp
	global ftracetcp$i 
	if [info exists ftracetcp$i] { flush [set ftracetcp$i] }
        set result [exec awk -v PlotTime=$PlotTime -v what=$what {
	    {
		if (( $6 == what ) && ($1 > PlotTime)) {
		    print $1, $7 >> "temp.tcp";
		}
	    }
	} xcp$i.tr]
 
	puts "$i : $result"

	puts $f \"$what$i 
	exec cat temp.tcp >@ $f
	puts $f "\n"
	flush $f
    }
    close $f
    exec xgraph  -nl -m  -x time -y $what xgraph_$a.tcp &
    return 
}

# Takes as input the the label on the Y axis, the time it starts plotting, and the trace file tcl var
proc plot-xcp-queue { TraceName PlotTime traceFile } {
    
    exec rm -f xgraph.xcp_queue
    exec rm -f temp.q temp.a temp.p temp.avg_enqueued temp.avg_dequeued temp.x temp.y 
    exec touch temp.q temp.a temp.p temp.avg_enqueued temp.avg_dequeued temp.x temp.y 
    
    exec awk -v PT=$PlotTime {
	{
	    if (($1 == "q" && NF>2) && ($2 > PT)) {
		print $2, $3 >> "temp.q"
	    }
	    else if (($1 == "a" && NF>2) && ($2 > PT)) {
		print $2, $3 >> "temp.a"
	    }
	    else if (($1 == "p" && NF>2) && ($2 > PT)) {
		print $2, $3 >> "temp.p"
	    }
	}
    }  $traceFile

    set ff [open xgraph.xcp_queue w]
    puts $ff "TitleText: DROPTAIL XCP queue$TraceName"
    puts $ff "Device: Postscript \n"
    puts $ff \"queue
    exec cat temp.q >@ $ff  
    puts $ff \n\"ave_queue
    exec cat temp.a >@ $ff
    puts $ff \n\"prob_drop
    exec cat temp.p >@ $ff

    close $ff
    exec xgraph  -P -x time -y queue xgraph.xcp_queue &
}

proc plot-red-queue { TraceName PlotTime traceFile } {
    
    exec rm -f xgraph.red_queue
    exec rm -f temp.q temp.a temp.p temp.avg_enqueued temp.avg_dequeued temp.x temp.y 
    exec touch temp.q temp.a temp.p temp.avg_enqueued temp.avg_dequeued temp.x temp.y 
    
    exec awk -v PT=$PlotTime {
	{
	    if (($1 == "Q" && NF>2) && ($2 > PT)) {
		print $2, $3 >> "temp.q"
	    }
	    else if (($1 == "a" && NF>2) && ($2 > PT)) {
		print $2, $3 >> "temp.a"
	    }
	    else if (($1 == "p" && NF>2) && ($2 > PT)) {
		print $2, $3 >> "temp.p"
	    }
	}
    }  $traceFile

    set ff [open xgraph.red_queue w]
    puts $ff "TitleText: RED TCP queue$TraceName"
    puts $ff "Device: Postscript \n"
    puts $ff \"queue
    exec cat temp.q >@ $ff  
    puts $ff \n\"ave_queue
    exec cat temp.a >@ $ff
    puts $ff \n\"prob_drop
    exec cat temp.p >@ $ff

    close $ff
    exec xgraph  -P -x time -y queue xgraph.red_queue &
}

proc plot-red {varname filename PlotTime} {
    
    exec rm -f temp.$filename
    exec touch temp.$filename
    
    set result [exec awk -v PlotTime=$PlotTime -v what=$varname -v file=temp.$filename {
	{
	    if (( $1 == what ) && ($2 > PlotTime)) {
		print $2, $3 >> file ;
	    }  
	}
    } ft_red_Bottleneck.tr]

    exec xgraph -P -x time -y $filename temp.$filename
}



#-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*- Initializing Simulator -*-*-*-*-*-*-*-*--*-*-*-*-*-*-*-*-#
# BW is in Mbs and delay is in ms

#set-cmd-line-args "seed qType BW nXCPs delay "

set seed   472904
set qType  XCP
set BW     20; # in Mb/s
set nXCPs  3; # Number of flows
set delay  10; # in ms


set ns          [new Simulator]
$ns             use-scheduler Heap
set rtg [new RNG]
$rtg seed       $seed


set f_all [open out.tr w]
$ns trace-all $f_all


set  qSize  [expr round([expr ($BW / 8.0) * 4 * $delay * 1.0])];#set buffer to the pipe size

#set qSize [expr $qSize/4]

set tracedXCPs       "0 1 2 3"
set SimStopTime      30
set PlotTime         0



#---------- Create the simulation --------------------#

# Create topology
set-red-params $qSize
create-topology2 $BW $delay $qType $qSize $nXCPs 0.0


foreach link $all_links {
    set queue [$link queue]
    switch $qType {
	"XCP" {
		$queue set-link-capacity [[$link set link_] set bandwidth_];
	}
	"DropTail/XCP" {
		$queue set-link-capacity-Kbytes [expr [[$link set link_] set bandwidth_] / 8000];
	}
	    default {
		    puts "Incorrect qType $qType"
		    exit 0
	    }
    }
}


# Create sources:
set i 0
while { $i < $nXCPs  } {
    set StartTime [expr [$rtg integer 1000] * 0.001 * (0.01 * $delay) + $i  * 0.0] 
    set rcvr_XCP      [new Agent/TCPSink/XCPSink]
    $ns attach-agent  $R1 $rcvr_XCP
    set src$i         [new GeneralSender $i [set n$i] $rcvr_XCP "$StartTime TCP/Reno/XCP"]
	#[[set src$i] set tcp_]  set  packetSize_ [expr 100 * ($i +10)]
	[[set src$i] set tcp_]  set  packetSize_ 1000
	[[set src$i] set tcp_]  set  window_     [expr $qSize * 10]
	incr i
}

set StartTime 0.0900000000000000023
set rcvr_TCP [new Agent/TCPSink]
$ns attach-agent $R1 $rcvr_TCP
set src$i [new GeneralSender $i $n0 $rcvr_TCP "$StartTime TCP/Reno"]

[[set src$i] set tcp_]  set  packetSize_ [expr 100 * ($i +10)]
[[set src$i] set tcp_]  set  window_     [expr $qSize * 10]
incr i



 
#---------- Trace --------------------#
set i 0
# Trace sources
foreach i $tracedXCPs {
	[set src$i] trace-xcp "cwnd seqno"
}

# Trace Queues
foreach queue_name "Bottleneck rBottleneck" {
	set queue [set "$queue_name"]
	switch $qType {
		"XCP" {
			global "ft_red_$queue_name"
			global "tcp_$queue_name"
			set "ft_red_$queue_name" [open ft_red_[set queue_name].tr w]
			$queue attach [set ft_red_$queue_name]
			
			set "tcp_$queue_name" [open tcp.tr w]
			set tcpq [$queue set vq_(1)]
			$tcpq attach [set tcp_$queue_name]
			$tcpq trace curq_
			$tcpq trace ave_
			$tcpq trace prob1_
			
		}
		"DropTail/XCP" {}
	}
}


#---------------- Run the simulation ------------------------#
proc flush-files {} {
    set files "f_all ft_red_Bottleneck ft_red_rBottleneck"
    global tracedXCPs
    foreach file $files {
        global $file
        if {[info exists $file]} {
            flush [set $file]
            close [set $file]
        }   
    }
    foreach i $tracedXCPs {
	global src$i
	    set file [set src$i tcpTrace_]
	if {[info exists $file]} {
            flush [set $file]
            close [set $file]
        }   
    }
}

proc finish {} {
    global ns 

    if {[info exists f]} {
	$ns flush-trace
	close $f
    }   

    $ns halt
}

$ns at $SimStopTime "finish"
$ns run
flush-files
puts "running nam..."
	exec nam out.nam &
	exit 0
#------------ Post Processing ---------------#
set PostProcess 1
if { $PostProcess } {
    #--- Traced TCPs
	set TraceName "Flows --$qType-QS$qSize"
	plot-xcp      $TraceName  $tracedXCPs  0.0  "cwnd_"
	plot-xcp      $TraceName  $tracedXCPs  0.0  "t_seqno_"
	
	#plot-xcp-queue  $TraceName  $PlotTime   ft_red_Bottleneck.tr
	#plot-red-queue  $TraceName  $PlotTime   tcp.tr
	plot-red "u" util 0.0
}
