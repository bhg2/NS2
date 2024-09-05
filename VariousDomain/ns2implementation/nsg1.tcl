# This script is created by P.L. Wu <wupl@cse.nsysu.edu.tw>
#===================================
#              ??????                           
#===================================

set val(chan)   Channel/WirelessChannel    ;# channel type
set val(prop)   Propagation/TwoRayGround   ;# radio-propagation model
set val(netif)  Phy/WirelessPhy            ;# network interface type
set val(mac)    Mac/802_11            ;# MAC type
set val(ifq)    Queue/DropTail/PriQueue    ;# interface queue type
set val(ll)     LL                         ;# link layer type
set val(ant)    Antenna/OmniAntenna        ;# antenna model
set val(ifqlen) 50                         ;# max packet in ifq
set val(nn)     8        ;# number of mobilenodes
set val(rp)     AODV     ;# routing protocol
set val(x)      1000            ;# X dimension of topography
set val(y)      1000           ;# Y dimension of topography
set val(stop)   10.0 ;# time of simulation end

#===================================
#               ??????                         
#===================================

#??trace file
set ns            [new Simulator]	;#??ns simulator
set tracefd       [open mac_802_11_node_6_ftp_1_cbr_2_ping_6.tr w]	;#??trace file
set namtrace       [open mac_802_11_node_6_ftp_1_cbr_2_ping_6.nam w]	;#????nam trace file

$ns trace-all $tracefd
$ns namtrace-all-wireless $namtrace $val(x) $val(y)

set topo       [new Topography]	    ;#??topography object
$topo load_flatgrid $val(x) $val(y)

create-god $val(nn)

#??channel
set chan0 [new $val(chan)]

#===================================
#        ??MobileNode???                      
#===================================

#??MobileNode???
$ns node-config -adhocRouting $val(rp) \
                -llType $val(ll) \
                -macType $val(mac) \
                -ifqType $val(ifq) \
                -ifqLen $val(ifqlen) \
                -antType $val(ant) \
                -propType $val(prop) \
                -phyType $val(netif) \
                -channel $chan0 \
                -topoInstance $topo \
                -agentTrace OFF \
                -routerTrace OFF \
                -macTrace ON \
                -movementTrace OFF

#===================================
#             ??Node              
#===================================

#???0?Node
set node_(0) [$ns node]
$node_(0) set X_ 520
$node_(0) set Y_ 864
$node_(0) set Z_ 0.0
$ns initial_node_pos $node_(0) 20

#???1?Node
set node_(1) [$ns node]
$node_(1) set X_ 414
$node_(1) set Y_ 704
$node_(1) set Z_ 0.0
$ns initial_node_pos $node_(1) 20

#???2?Node
set node_(2) [$ns node]
$node_(2) set X_ 732
$node_(2) set Y_ 806
$node_(2) set Z_ 0.0
$ns initial_node_pos $node_(2) 20

#???3?Node
set node_(3) [$ns node]
$node_(3) set X_ 536
$node_(3) set Y_ 742
$node_(3) set Z_ 0.0
$ns initial_node_pos $node_(3) 20

#???4?Node
set node_(4) [$ns node]
$node_(4) set X_ 570
$node_(4) set Y_ 588
$node_(4) set Z_ 0.0
$ns initial_node_pos $node_(4) 20

#???5?Node
set node_(5) [$ns node]
$node_(5) set X_ 744
$node_(5) set Y_ 626
$node_(5) set Z_ 0.0
$ns initial_node_pos $node_(5) 20


#???6?Node
set node_(6) [$ns node]
$node_(6) set X_ 780
$node_(6) set Y_ 650
$node_(6) set Z_ 0.0
$ns initial_node_pos $node_(6) 20


#???7?Node
set node_(7) [$ns node]
$node_(7) set X_ 430
$node_(7) set Y_ 743
$node_(7) set Z_ 0.0
$ns initial_node_pos $node_(7) 20


#===================================
#             ??Movement           
#===================================

#===================================
#               ????                                 
#===================================

#???0???(FTP-TCP)
set tcp0 [new Agent/TCP/Newreno]
$tcp0 set class_ 2
set sink0 [new Agent/TCPSink]
$ns attach-agent $node_(0) $tcp0
$ns attach-agent $node_(1) $sink0
$ns connect $tcp0 $sink0
set ftp0 [new Application/FTP]
$ftp0 attach-agent $tcp0
$ns at 1.0 "$ftp0 start"
$ns at 2.0 "$ftp0 stop"

#???1???(CBR-UDP)
set udp1 [new Agent/UDP]
$ns attach-agent $node_(3) $udp1
set null1 [new Agent/Null]
$ns attach-agent $node_(2) $null1
$ns connect $udp1 $null1
$udp1 set fid_ 2	;#?NAM??UDP?????????
set cbr1 [new Application/Traffic/CBR]	;#?UDP??????CBR????
$cbr1 attach-agent $udp1
$cbr1 set type_ CBR
$cbr1 set packet_size_ 1000;#??????
$cbr1 set rate_ 512Kb ;#??????
$cbr1 set random_ false
$ns at 1.0 "$cbr1 start"
$ns at 2.0 "$cbr1 stop"

#???2???(CBR-UDP)
set udp2 [new Agent/UDP]
$ns attach-agent $node_(2) $udp2
set null2 [new Agent/Null]
$ns attach-agent $node_(3) $null2
$ns connect $udp2 $null2
$udp2 set fid_ 2	;#?NAM??UDP?????????
set cbr2 [new Application/Traffic/CBR]	;#?UDP??????CBR????
$cbr2 attach-agent $udp2
$cbr2 set type_ CBR
$cbr2 set packet_size_ 1000;#??????
$cbr2 set rate_ 512Kb ;#??????
$cbr2 set random_ false
$ns at 1.0 "$cbr2 start"
$ns at 2.0 "$cbr2 stop"

#???3???(Ping)
set ping_a(3) [new Agent/Ping]
$ns attach-agent $node_(0) $ping_a(3)
set ping_b(3) [new Agent/Ping]
$ns attach-agent $node_(1) $ping_b(3)
$ns connect $ping_a(3) $ping_b(3)	;#????Ping Agents
$ns at 1.0 "$ping_a(3) send"	;#??Ping???

#???4???(Ping)
set ping_a(4) [new Agent/Ping]
$ns attach-agent $node_(1) $ping_a(4)
set ping_b(4) [new Agent/Ping]
$ns attach-agent $node_(4) $ping_b(4)
$ns connect $ping_a(4) $ping_b(4)	;#????Ping Agents
$ns at 1.0 "$ping_a(4) send"	;#??Ping???

#???5???(Ping)
set ping_a(5) [new Agent/Ping]
$ns attach-agent $node_(4) $ping_a(5)
set ping_b(5) [new Agent/Ping]
$ns attach-agent $node_(5) $ping_b(5)
$ns connect $ping_a(5) $ping_b(5)	;#????Ping Agents
$ns at 1.0 "$ping_a(5) send"	;#??Ping???

#???6???(Ping)
set ping_a(6) [new Agent/Ping]
$ns attach-agent $node_(5) $ping_a(6)
set ping_b(6) [new Agent/Ping]
$ns attach-agent $node_(2) $ping_b(6)
$ns connect $ping_a(6) $ping_b(6)	;#????Ping Agents
$ns at 1.0 "$ping_a(6) send"	;#??Ping???

#???7???(Ping)
set ping_a(7) [new Agent/Ping]
$ns attach-agent $node_(2) $ping_a(7)
set ping_b(7) [new Agent/Ping]
$ns attach-agent $node_(0) $ping_b(7)
$ns connect $ping_a(7) $ping_b(7)	;#????Ping Agents
$ns at 1.0 "$ping_a(7) send"	;#??Ping???

#???8???(Ping)
set ping_a(8) [new Agent/Ping]
$ns attach-agent $node_(2) $ping_a(8)
set ping_b(8) [new Agent/Ping]
$ns attach-agent $node_(3) $ping_b(8)
$ns connect $ping_a(8) $ping_b(8)	;#????Ping Agents
$ns at 1.0 "$ping_a(8) send"	;#??Ping???

#===================================
#              ????                                   
#===================================

#??Ping???recv function
Agent/Ping instproc recv {from rtt} {
    $self instvar node_
    puts "node [$node_ id] received ping answer from $from with round-trip-time $rtt ms."
}

# ??MobileNode?????
for {set i 0} {$i < $val(nn) } { incr i } {
    $ns at $val(stop) "$node_($i) reset";
}

# ??nam????
$ns at $val(stop) "$ns nam-end-wireless $val(stop)"
$ns at $val(stop) "stop"
$ns at 10.1 "puts \"end simulation\" ; $ns halt"

# ???????stop function
proc stop {} {
    global ns tracefd namtrace
    $ns flush-trace
    close $tracefd
    close $namtrace
}

$ns run
