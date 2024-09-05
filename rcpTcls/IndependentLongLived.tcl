#source "rcp-pair.tcl"
Class RCP_pair
RCP_pair instproc init {args} {
    $self instvar pair_id group_id id debug_mode
    $self instvar rcps rcpr;# Sender RCP,  Receiver RCP

    eval $self next $args

    $self set rcps [new Agent/RCP]  ;# Sender RCP
    $self set rcpr [new Agent/RCP]  ;# Receiver RCP

    $rcps set_callback $self
#   $rcpr set_callback $self

    $self set pair_id  0
    $self set group_id 0
    $self set id       0
    $self set debug_mode 0
}
RCP_pair instproc setup {snode dnode} {
#   Directly connect agents to snode, dnode.
#   For faster simulation.
    global ns link_rate
    $self instvar rcps rcpr;# Sender RCP,  Receiver RCP
    $self instvar san dan  ;# memorize dumbell node (to attach)

    $self set san $snode
    $self set dan $dnode

    $ns attach-agent $snode $rcps;
    $ns attach-agent $dnode $rcpr;

    $ns connect $rcps $rcpr
}
RCP_pair instproc setfid { fid } {
    $self instvar rcps rcpr
    $self instvar id
    $self set id $fid
    $rcps set fid_ $fid;
    $rcpr set fid_ $fid;
}
RCP_pair instproc start { nr_pkts } {
    global ns
    $self instvar rcps id group_id
    $self instvar start_time pkts
    $self instvar aggr_ctrl start_cbfunc
    $self instvar debug_mode

    $self set start_time [$ns now] ;# memorize
    $self set pkts       $nr_pkts  ;# memorize

    set pktsize [$rcps set packetSize_]

    if { $debug_mode == 1 } {
	puts "stats: [$ns now] start grp $group_id fid $id $nr_pkts pkts ($pktsize +40)"
    }

    if { [info exists aggr_ctrl] && [info exists start_cbfunc] } {
	$aggr_ctrl $start_cbfunc
    }

    $rcps set numpkts_ $nr_pkts
    $rcps sendfile
}
RCP_pair instproc stop {} {
    $self instvar rcps rcpr

    $rcps reset
    $rcpr reset
}
Agent/RCP instproc set_callback {rcp_pair} {
    $self instvar ctrl
    $self set ctrl $rcp_pair
}
#add/remove packet headers as required
#this must be done before create simulator, i.e., [new Simulator]

remove-all-packet-headers       ;# removes all except common
add-packet-header Flags IP RCP  

set ns [new Simulator]
#puts "#Date: [clock format [clock seconds]]"
#set sim_start [clock seconds]
#puts "#Host: [exec uname -a]"

#set tf [open traceall.tr w]
#$ns trace-all $tf
set nf [open out.nam w]
$ns namtrace-all $nf

if {$argc != 3} {
    puts "usage: ns xxx.tcl link_rate(Gbps) RTT(per hop,sec) numFlows"
    exit 0
}
set link_rate [lindex $argv 0]
set mean_link_delay [expr [lindex $argv 1] / 2.0]
set numFlows [lindex $argv 2] 
set rcpalpha 0.4
set rcpbeta  1 

puts "LOG: link_rate $link_rate Gbps"
puts "LOG: RTT  [expr $mean_link_delay * 2.0] sec"

#packet size is in bytes.
set pktSize 960
puts "LOG: pktSize(IP)             $pktSize byte"
puts "LOG: pktSize(include header) [expr $pktSize + 40] byte"


Agent/RCP set packetSize_ $pktSize
Queue/DropTail/RCP set rate_fact_mode_ 0
Queue/DropTail/RCP set propag_rtt_ [expr $mean_link_delay * 2]
Queue/DropTail/RCP set alpha_ $rcpalpha
Queue/DropTail/RCP set beta_  $rcpbeta
puts "LOG: rate_fact_mode_ [Queue/DropTail/RCP set rate_fact_mode_]"
puts "LOG: alpha $rcpalpha beta $rcpbeta"

#In case RCP, as much as possible

set BWRTT [expr $link_rate * 1000000000.0 * $mean_link_delay * 2.0]
set queueSize [expr int (ceil ($BWRTT / (1000.0 * 8.0))) ]
Queue set limit_ $queueSize
puts "LOG: queueSize $queueSize packets"

############# Topoplgy #########################
set n0    [$ns node]
set n1    [$ns node]

$ns duplex-link $n0 $n1 [set link_rate]Gb $mean_link_delay DropTail/RCP
set bnecklink [$ns link $n0 $n1] 

#############################################################
#Only for RCP
#must set capacity for each queue to get load information
#############################################################
set l0 [$ns link $n0 $n1]
puts "LINK L0 : $l0"
set q0 [$l0 queue]
$q0 set-link-capacity [expr $link_rate * 125000000.0]
set l1 [$ns link $n1 $n0]
puts "LINK L1 : $l1"
set q1 [$l1 queue]
$q1 set-link-capacity [expr $link_rate * 125000000.0]
$q0 set print_status_ 1
set rcplog [open rcpStatus-N$numFlows.tr w]
$q0 attach $rcplog
$q1 set print_status_ 0
#############################################################

set sim_end 50

for { set i 0 } { $i < $numFlows } { incr i } {
    
    set agent_pair($i) [new RCP_pair]

    $agent_pair($i) setup $n0 $n1
    $agent_pair($i) setfid $i

    if {$i < $numFlows} {
      $ns at 0.0 "$agent_pair($i) start 15000000" 
      $ns at $sim_end "$agent_pair($i) stop"
    }  else {

    }
}

#############  Queue Monitor   #########################
set qf [open queue-$numFlows.tr w]
set qm [$ns monitor-queue $n0 $n1 $qf 0.01]
$bnecklink queue-sample-timeout
#$bnecklink start-tracing

$ns at $sim_end "finish"

proc finish {} {
    global ns
    global sim_start
    global rcplog
    global qf

    $ns flush-trace
    close $qf
    close $rcplog

    #set t [clock seconds]
    #puts "#Simulation Finished"
    #puts "#Time [expr $t - $sim_start] sec"
    #puts "#Date [clock format [clock seconds]]"
puts "running nam..."
	exec nam out.nam &
	exit 0
    exit 0
}

$ns run
