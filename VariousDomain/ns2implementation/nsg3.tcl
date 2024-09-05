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
set val(nn)     10        ;# number of mobilenodes
set val(rp)     AODV     ;# routing protocol
set val(x)      1000            ;# X dimension of topography
set val(y)      1000           ;# Y dimension of topography
set val(stop)   10.0 ;# time of simulation end

#===================================
#               ??????                         
#===================================

#??trace file
set ns            [new Simulator]	;#??ns simulator
set tracefd       [open mac_802_11_node_10_ftp_5_cbr_7_ping_13.tr w]	;#??trace file
set namtrace       [open mac_802_11_node_10_ftp_5_cbr_7_ping_13.nam w]	;#????nam trace file

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
$node_(0) set X_ 262
$node_(0) set Y_ 918
$node_(0) set Z_ 0.0
$ns initial_node_pos $node_(0) 20

#???1?Node
set node_(1) [$ns node]
$node_(1) set X_ 594
$node_(1) set Y_ 928
$node_(1) set Z_ 0.0
$ns initial_node_pos $node_(1) 20

#???2?Node
set node_(2) [$ns node]
$node_(2) set X_ 970
$node_(2) set Y_ 926
$node_(2) set Z_ 0.0
$ns initial_node_pos $node_(2) 20

#???3?Node
set node_(3) [$ns node]
$node_(3) set X_ 592
$node_(3) set Y_ 684
$node_(3) set Z_ 0.0
$ns initial_node_pos $node_(3) 20

#???4?Node
set node_(4) [$ns node]
$node_(4) set X_ 844
$node_(4) set Y_ 426
$node_(4) set Z_ 0.0
$ns initial_node_pos $node_(4) 20

#???5?Node
set node_(6) [$ns node]
$node_(6) set X_ 832
$node_(6) set Y_ 722
$node_(6) set Z_ 0.0
$ns initial_node_pos $node_(6) 20

#???6?Node
set node_(7) [$ns node]
$node_(7) set X_ 1038
$node_(7) set Y_ 698
$node_(7) set Z_ 0.0
$ns initial_node_pos $node_(7) 20

#???7?Node
set node_(8) [$ns node]
$node_(8) set X_ 1040
$node_(8) set Y_ 602
$node_(8) set Z_ 0.0
$ns initial_node_pos $node_(8) 20

#???8?Node
set node_(9) [$ns node]
$node_(9) set X_ 724
$node_(9) set Y_ 388
$node_(9) set Z_ 0.0
$ns initial_node_pos $node_(9) 20

#???9?Node
set node_(10) [$ns node]
$node_(10) set X_ 528
$node_(10) set Y_ 452
$node_(10) set Z_ 0.0
$ns initial_node_pos $node_(10) 20

#===================================
#             ??Movement           
#===================================

$ns at 1.0 " $node_(0) setdest 594.0 930.0 2.0 " 
$ns at 1.3 " $node_(1) setdest 968.0 928.0 2.0 " 
$ns at 1.0 " $node_(3) setdest 842.0 422.0 2.0 " 
$ns at 1.0 " $node_(3) setdest 264.0 916.0 2.0 " 
$ns at 1.0 " $node_(8) setdest 844.0 426.0 2.0 " 
$ns at 1.0 " $node_(9) setdest 590.0 678.0 2.0 " 
$ns at 1.0 " $node_(10) setdest 262.0 918.0 2.0 " 
#===================================
#               ????                                 
#===================================

#???0???(FTP-TCP)
set tcp0 [new Agent/TCP/Newreno]
$tcp0 set class_ 2
set sink0 [new Agent/TCPSink]
$ns attach-agent $node_(0) $tcp0
$ns attach-agent $node_(0) $sink0
$ns connect $tcp0 $sink0
set ftp0 [new Application/FTP]
$ftp0 attach-agent $tcp0
$ns at 1.0 "$ftp0 start"
$ns at 2.0 "$ftp0 stop"

#???1???(Ping)
set ping_a(1) [new Agent/Ping]
$ns attach-agent $node_(0) $ping_a(1)
set ping_b(1) [new Agent/Ping]
$ns attach-agent $node_(0) $ping_b(1)
$ns connect $ping_a(1) $ping_b(1)	;#????Ping Agents
$ns at 1.0 "$ping_a(1) send"	;#??Ping???

#???2???(CBR-UDP)
set udp2 [new Agent/UDP]
$ns attach-agent $node_(0) $udp2
set null2 [new Agent/Null]
$ns attach-agent $node_(0) $null2
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
$ns attach-agent $node_(0) $ping_b(3)
$ns connect $ping_a(3) $ping_b(3)	;#????Ping Agents
$ns at 1.0 "$ping_a(3) send"	;#??Ping???

#???4???(Ping)
set ping_a(4) [new Agent/Ping]
$ns attach-agent $node_(0) $ping_a(4)
set ping_b(4) [new Agent/Ping]
$ns attach-agent $node_(0) $ping_b(4)
$ns connect $ping_a(4) $ping_b(4)	;#????Ping Agents
$ns at 1.0 "$ping_a(4) send"	;#??Ping???

#???5???(Ping)
set ping_a(5) [new Agent/Ping]
$ns attach-agent $node_(0) $ping_a(5)
set ping_b(5) [new Agent/Ping]
$ns attach-agent $node_(0) $ping_b(5)
$ns connect $ping_a(5) $ping_b(5)	;#????Ping Agents
$ns at 1.0 "$ping_a(5) send"	;#??Ping???

#???6???(Ping)
set ping_a(6) [new Agent/Ping]
$ns attach-agent $node_(1) $ping_a(6)
set ping_b(6) [new Agent/Ping]
$ns attach-agent $node_(2) $ping_b(6)
$ns connect $ping_a(6) $ping_b(6)	;#????Ping Agents
$ns at 1.0 "$ping_a(6) send"	;#??Ping???

#???7???(CBR-UDP)
set udp7 [new Agent/UDP]
$ns attach-agent $node_(0) $udp7
set null7 [new Agent/Null]
$ns attach-agent $node_(0) $null7
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
$ns attach-agent $node_(0) $udp8
set null8 [new Agent/Null]
$ns attach-agent $node_(0) $null8
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
$ns attach-agent $node_(3) $udp9
set null9 [new Agent/Null]
$ns attach-agent $node_(2) $null9
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

#???10???(Ping)
set ping_a(10) [new Agent/Ping]
$ns attach-agent $node_(0) $ping_a(10)
set ping_b(10) [new Agent/Ping]
$ns attach-agent $node_(0) $ping_b(10)
$ns connect $ping_a(10) $ping_b(10)	;#????Ping Agents
$ns at 1.0 "$ping_a(10) send"	;#??Ping???

#???11???(Ping)
set ping_a(11) [new Agent/Ping]
$ns attach-agent $node_(0) $ping_a(11)
set ping_b(11) [new Agent/Ping]
$ns attach-agent $node_(0) $ping_b(11)
$ns connect $ping_a(11) $ping_b(11)	;#????Ping Agents
$ns at 1.0 "$ping_a(11) send"	;#??Ping???

#???12???(Ping)
set ping_a(12) [new Agent/Ping]
$ns attach-agent $node_(0) $ping_a(12)
set ping_b(12) [new Agent/Ping]
$ns attach-agent $node_(0) $ping_b(12)
$ns connect $ping_a(12) $ping_b(12)	;#????Ping Agents
$ns at 1.0 "$ping_a(12) send"	;#??Ping???

#???13???(CBR-UDP)
set udp13 [new Agent/UDP]
$ns attach-agent $node_(0) $udp13
set null13 [new Agent/Null]
$ns attach-agent $node_(0) $null13
$ns connect $udp13 $null13
$udp13 set fid_ 2	;#?NAM??UDP?????????
set cbr13 [new Application/Traffic/CBR]	;#?UDP??????CBR????
$cbr13 attach-agent $udp13
$cbr13 set type_ CBR
$cbr13 set packet_size_ 1000;#??????
$cbr13 set rate_ 512Kb ;#??????
$cbr13 set random_ false
$ns at 1.0 "$cbr13 start"
$ns at 2.0 "$cbr13 stop"

#???14???(FTP-TCP)
set tcp14 [new Agent/TCP/Newreno]
$tcp14 set class_ 2
set sink14 [new Agent/TCPSink]
$ns attach-agent $node_(0) $tcp14
$ns attach-agent $node_(0) $sink14
$ns connect $tcp14 $sink14
set ftp14 [new Application/FTP]
$ftp14 attach-agent $tcp14
$ns at 1.0 "$ftp14 start"
$ns at 2.0 "$ftp14 stop"

#???15???(FTP-TCP)
set tcp15 [new Agent/TCP/Newreno]
$tcp15 set class_ 2
set sink15 [new Agent/TCPSink]
$ns attach-agent $node_(3) $tcp15
$ns attach-agent $node_(2) $sink15
$ns connect $tcp15 $sink15
set ftp15 [new Application/FTP]
$ftp15 attach-agent $tcp15
$ns at 1.0 "$ftp15 start"
$ns at 2.0 "$ftp15 stop"

#???16???(FTP-TCP)
set tcp16 [new Agent/TCP/Newreno]
$tcp16 set class_ 2
set sink16 [new Agent/TCPSink]
$ns attach-agent $node_(0) $tcp16
$ns attach-agent $node_(0) $sink16
$ns connect $tcp16 $sink16
set ftp16 [new Application/FTP]
$ftp16 attach-agent $tcp16
$ns at 1.0 "$ftp16 start"
$ns at 2.0 "$ftp16 stop"

#???17???(FTP-TCP)
set tcp17 [new Agent/TCP/Newreno]
$tcp17 set class_ 2
set sink17 [new Agent/TCPSink]
$ns attach-agent $node_(0) $tcp17
$ns attach-agent $node_(0) $sink17
$ns connect $tcp17 $sink17
set ftp17 [new Application/FTP]
$ftp17 attach-agent $tcp17
$ns at 1.0 "$ftp17 start"
$ns at 2.0 "$ftp17 stop"

#???18???(Ping)
set ping_a(18) [new Agent/Ping]
$ns attach-agent $node_(0) $ping_a(18)
set ping_b(18) [new Agent/Ping]
$ns attach-agent $node_(0) $ping_b(18)
$ns connect $ping_a(18) $ping_b(18)	;#????Ping Agents
$ns at 1.0 "$ping_a(18) send"	;#??Ping???

#???19???(Ping)
set ping_a(19) [new Agent/Ping]
$ns attach-agent $node_(6) $ping_a(19)
set ping_b(19) [new Agent/Ping]
$ns attach-agent $node_(4) $ping_b(19)
$ns connect $ping_a(19) $ping_b(19)	;#????Ping Agents
$ns at 1.0 "$ping_a(19) send"	;#??Ping???

#???20???(Ping)
set ping_a(20) [new Agent/Ping]
$ns attach-agent $node_(0) $ping_a(20)
set ping_b(20) [new Agent/Ping]
$ns attach-agent $node_(0) $ping_b(20)
$ns connect $ping_a(20) $ping_b(20)	;#????Ping Agents
$ns at 1.0 "$ping_a(20) send"	;#??Ping???

#???21???(Ping)
set ping_a(21) [new Agent/Ping]
$ns attach-agent $node_(0) $ping_a(21)
set ping_b(21) [new Agent/Ping]
$ns attach-agent $node_(0) $ping_b(21)
$ns connect $ping_a(21) $ping_b(21)	;#????Ping Agents
$ns at 1.0 "$ping_a(21) send"	;#??Ping???

#???22???(CBR-UDP)
set udp22 [new Agent/UDP]
$ns attach-agent $node_(0) $udp22
set null22 [new Agent/Null]
$ns attach-agent $node_(0) $null22
$ns connect $udp22 $null22
$udp22 set fid_ 2	;#?NAM??UDP?????????
set cbr22 [new Application/Traffic/CBR]	;#?UDP??????CBR????
$cbr22 attach-agent $udp22
$cbr22 set type_ CBR
$cbr22 set packet_size_ 1000;#??????
$cbr22 set rate_ 512Kb ;#??????
$cbr22 set random_ false
$ns at 1.0 "$cbr22 start"
$ns at 2.0 "$cbr22 stop"

#???23???(CBR-UDP)
set udp23 [new Agent/UDP]
$ns attach-agent $node_(3) $udp23
set null23 [new Agent/Null]
$ns attach-agent $node_(10) $null23
$ns connect $udp23 $null23
$udp23 set fid_ 2	;#?NAM??UDP?????????
set cbr23 [new Application/Traffic/CBR]	;#?UDP??????CBR????
$cbr23 attach-agent $udp23
$cbr23 set type_ CBR
$cbr23 set packet_size_ 1000;#??????
$cbr23 set rate_ 512Kb ;#??????
$cbr23 set random_ false
$ns at 1.0 "$cbr23 start"
$ns at 2.0 "$cbr23 stop"

#???24???(Ping)
set ping_a(24) [new Agent/Ping]
$ns attach-agent $node_(0) $ping_a(24)
set ping_b(24) [new Agent/Ping]
$ns attach-agent $node_(0) $ping_b(24)
$ns connect $ping_a(24) $ping_b(24)	;#????Ping Agents
$ns at 1.0 "$ping_a(24) send"	;#??Ping???

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
