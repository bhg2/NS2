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
set val(nn)     13        ;# number of mobilenodes
set val(rp)     AODV     ;# routing protocol
set val(x)      1000            ;# X dimension of topography
set val(y)      1000           ;# Y dimension of topography
set val(stop)   10.0 ;# time of simulation end

#===================================
#               ??????                         
#===================================

#??trace file
set ns            [new Simulator]	;#??ns simulator
set tracefd       [open mac_802_11_node_13_ftp_2_cbr_7_ping_4.tr w]	;#??trace file
set namtrace       [open mac_802_11_node_13_ftp_2_cbr_7_ping_4.nam w]	;#????nam trace file

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
$node_(0) set X_ 304
$node_(0) set Y_ 770
$node_(0) set Z_ 0.0
$ns initial_node_pos $node_(0) 20

#???1?Node
set node_(1) [$ns node]
$node_(1) set X_ 434
$node_(1) set Y_ 772
$node_(1) set Z_ 0.0
$ns initial_node_pos $node_(1) 20

#???2?Node
set node_(2) [$ns node]
$node_(2) set X_ 532
$node_(2) set Y_ 776
$node_(2) set Z_ 0.0
$ns initial_node_pos $node_(2) 20

#???3?Node
set node_(3) [$ns node]
$node_(3) set X_ 708
$node_(3) set Y_ 776
$node_(3) set Z_ 0.0
$ns initial_node_pos $node_(3) 20

#???4?Node
set node_(4) [$ns node]
$node_(4) set X_ 888
$node_(4) set Y_ 780
$node_(4) set Z_ 0.0
$ns initial_node_pos $node_(4) 20

#???5?Node
set node_(5) [$ns node]
$node_(5) set X_ 1094
$node_(5) set Y_ 794
$node_(5) set Z_ 0.0
$ns initial_node_pos $node_(5) 20

#???6?Node
set node_(6) [$ns node]
$node_(6) set X_ 1230
$node_(6) set Y_ 790
$node_(6) set Z_ 0.0
$ns initial_node_pos $node_(6) 20

#???7?Node
set node_(7) [$ns node]
$node_(7) set X_ 1372
$node_(7) set Y_ 794
$node_(7) set Z_ 0.0
$ns initial_node_pos $node_(7) 20

#???8?Node
set node_(8) [$ns node]
$node_(8) set X_ 1552
$node_(8) set Y_ 790
$node_(8) set Z_ 0.0
$ns initial_node_pos $node_(8) 20

#???9?Node
set node_(9) [$ns node]
$node_(9) set X_ 1694
$node_(9) set Y_ 798
$node_(9) set Z_ 0.0
$ns initial_node_pos $node_(9) 20

#???10?Node
set node_(10) [$ns node]
$node_(10) set X_ 1858
$node_(10) set Y_ 812
$node_(10) set Z_ 0.0
$ns initial_node_pos $node_(10) 20

#???11?Node
set node_(11) [$ns node]
$node_(11) set X_ 1718
$node_(11) set Y_ 802
$node_(11) set Z_ 0.0
$ns initial_node_pos $node_(11) 20

#???12?Node
set node_(12) [$ns node]
$node_(12) set X_ 324
$node_(12) set Y_ 504
$node_(12) set Z_ 0.0
$ns initial_node_pos $node_(12) 20

#===================================
#             ??Movement           
#===================================

$ns at 1.0 " $node_(0) setdest 324.0 510.0 2.0 " 
$ns at 1.0 " $node_(12) setdest 1854.0 808.0 2.0 " 
#===================================
#               ????                                 
#===================================

#???0???(CBR-UDP)
set udp0 [new Agent/UDP]
$ns attach-agent $node_(0) $udp0
set null0 [new Agent/Null]
$ns attach-agent $node_(1) $null0
$ns connect $udp0 $null0
$udp0 set fid_ 2	;#?NAM??UDP?????????
set cbr0 [new Application/Traffic/CBR]	;#?UDP??????CBR????
$cbr0 attach-agent $udp0
$cbr0 set type_ CBR
$cbr0 set packet_size_ 1000;#??????
$cbr0 set rate_ 512Kb ;#??????
$cbr0 set random_ false
$ns at 1.0 "$cbr0 start"
$ns at 2.0 "$cbr0 stop"

#???1???(Ping)
set ping_a(1) [new Agent/Ping]
$ns attach-agent $node_(0) $ping_a(1)
set ping_b(1) [new Agent/Ping]
$ns attach-agent $node_(1) $ping_b(1)
$ns connect $ping_a(1) $ping_b(1)	;#????Ping Agents
$ns at 1.0 "$ping_a(1) send"	;#??Ping???

#???2???(FTP-TCP)
set tcp2 [new Agent/TCP/Newreno]
$tcp2 set class_ 2
set sink2 [new Agent/TCPSink]
$ns attach-agent $node_(3) $tcp2
$ns attach-agent $node_(5) $sink2
$ns connect $tcp2 $sink2
set ftp2 [new Application/FTP]
$ftp2 attach-agent $tcp2
$ns at 1.0 "$ftp2 start"
$ns at 2.0 "$ftp2 stop"

#???3???(CBR-UDP)
set udp3 [new Agent/UDP]
$ns attach-agent $node_(5) $udp3
set null3 [new Agent/Null]
$ns attach-agent $node_(7) $null3
$ns connect $udp3 $null3
$udp3 set fid_ 2	;#?NAM??UDP?????????
set cbr3 [new Application/Traffic/CBR]	;#?UDP??????CBR????
$cbr3 attach-agent $udp3
$cbr3 set type_ CBR
$cbr3 set packet_size_ 1000;#??????
$cbr3 set rate_ 512Kb ;#??????
$cbr3 set random_ false
$ns at 1.0 "$cbr3 start"
$ns at 2.0 "$cbr3 stop"

#???4???(FTP-TCP)
set tcp4 [new Agent/TCP/Newreno]
$tcp4 set class_ 2
set sink4 [new Agent/TCPSink]
$ns attach-agent $node_(7) $tcp4
$ns attach-agent $node_(8) $sink4
$ns connect $tcp4 $sink4
set ftp4 [new Application/FTP]
$ftp4 attach-agent $tcp4
$ns at 1.0 "$ftp4 start"
$ns at 2.0 "$ftp4 stop"

#???5???(Ping)
set ping_a(5) [new Agent/Ping]
$ns attach-agent $node_(8) $ping_a(5)
set ping_b(5) [new Agent/Ping]
$ns attach-agent $node_(9) $ping_b(5)
$ns connect $ping_a(5) $ping_b(5)	;#????Ping Agents
$ns at 1.0 "$ping_a(5) send"	;#??Ping???

#???6???(CBR-UDP)
set udp6 [new Agent/UDP]
$ns attach-agent $node_(0) $udp6
set null6 [new Agent/Null]
$ns attach-agent $node_(12) $null6
$ns connect $udp6 $null6
$udp6 set fid_ 2	;#?NAM??UDP?????????
set cbr6 [new Application/Traffic/CBR]	;#?UDP??????CBR????
$cbr6 attach-agent $udp6
$cbr6 set type_ CBR
$cbr6 set packet_size_ 1000;#??????
$cbr6 set rate_ 512Kb ;#??????
$cbr6 set random_ false
$ns at 1.0 "$cbr6 start"
$ns at 2.0 "$cbr6 stop"

#???7???(CBR-UDP)
set udp7 [new Agent/UDP]
$ns attach-agent $node_(12) $udp7
set null7 [new Agent/Null]
$ns attach-agent $node_(10) $null7
$ns connect $udp7 $null7
$udp7 set fid_ 2	;#?NAM??UDP?????????
set cbr7 [new Application/Traffic/CBR]	;#?UDP??????CBR????
$cbr7 attach-agent $udp7
$cbr7 set type_ CBR
$cbr7 set packet_size_ 1000;#??????
$cbr7 set rate_ 512Kb ;#??????
$cbr7 set random_ false
$ns at 1.0 "$cbr7 start"
$ns at 2.0 "$cbr7 stop"

#???8???(CBR-UDP)
set udp8 [new Agent/UDP]
$ns attach-agent $node_(12) $udp8
set null8 [new Agent/Null]
$ns attach-agent $node_(10) $null8
$ns connect $udp8 $null8
$udp8 set fid_ 2	;#?NAM??UDP?????????
set cbr8 [new Application/Traffic/CBR]	;#?UDP??????CBR????
$cbr8 attach-agent $udp8
$cbr8 set type_ CBR
$cbr8 set packet_size_ 1000;#??????
$cbr8 set rate_ 512Kb ;#??????
$cbr8 set random_ false
$ns at 1.0 "$cbr8 start"
$ns at 2.0 "$cbr8 stop"

#???9???(CBR-UDP)
set udp9 [new Agent/UDP]
$ns attach-agent $node_(10) $udp9
set null9 [new Agent/Null]
$ns attach-agent $node_(12) $null9
$ns connect $udp9 $null9
$udp9 set fid_ 2	;#?NAM??UDP?????????
set cbr9 [new Application/Traffic/CBR]	;#?UDP??????CBR????
$cbr9 attach-agent $udp9
$cbr9 set type_ CBR
$cbr9 set packet_size_ 1000;#??????
$cbr9 set rate_ 512Kb ;#??????
$cbr9 set random_ false
$ns at 1.0 "$cbr9 start"
$ns at 2.0 "$cbr9 stop"

#???10???(CBR-UDP)
set udp10 [new Agent/UDP]
$ns attach-agent $node_(12) $udp10
set null10 [new Agent/Null]
$ns attach-agent $node_(10) $null10
$ns connect $udp10 $null10
$udp10 set fid_ 2	;#?NAM??UDP?????????
set cbr10 [new Application/Traffic/CBR]	;#?UDP??????CBR????
$cbr10 attach-agent $udp10
$cbr10 set type_ CBR
$cbr10 set packet_size_ 1000;#??????
$cbr10 set rate_ 512Kb ;#??????
$cbr10 set random_ false
$ns at 1.0 "$cbr10 start"
$ns at 2.0 "$cbr10 stop"

#???11???(Ping)
set ping_a(11) [new Agent/Ping]
$ns attach-agent $node_(6) $ping_a(11)
set ping_b(11) [new Agent/Ping]
$ns attach-agent $node_(6) $ping_b(11)
$ns connect $ping_a(11) $ping_b(11)	;#????Ping Agents
$ns at 1.0 "$ping_a(11) send"	;#??Ping???

#???12???(Ping)
set ping_a(12) [new Agent/Ping]
$ns attach-agent $node_(6) $ping_a(12)
set ping_b(12) [new Agent/Ping]
$ns attach-agent $node_(6) $ping_b(12)
$ns connect $ping_a(12) $ping_b(12)	;#????Ping Agents
$ns at 1.0 "$ping_a(12) send"	;#??Ping???

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
