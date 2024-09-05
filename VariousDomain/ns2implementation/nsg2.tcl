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
set val(nn)     34        ;# number of mobilenodes
set val(rp)     DSR     ;# routing protocol
set val(x)      1000            ;# X dimension of topography
set val(y)      1000           ;# Y dimension of topography
set val(stop)   10.0 ;# time of simulation end

#===================================
#               ??????                         
#===================================

#??trace file
set ns            [new Simulator]	;#??ns simulator
set tracefd       [open mac_802_11_node_34_ftp_0_cbr_6_ping_5.tr w]	;#??trace file
set namtrace       [open mac_802_11_node_34_ftp_0_cbr_6_ping_5.nam w]	;#????nam trace file

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
$node_(0) set X_ 142
$node_(0) set Y_ 940
$node_(0) set Z_ 0.0
$ns initial_node_pos $node_(0) 20

#???1?Node
set node_(1) [$ns node]
$node_(1) set X_ 298
$node_(1) set Y_ 942
$node_(1) set Z_ 0.0
$ns initial_node_pos $node_(1) 20

#???2?Node
set node_(2) [$ns node]
$node_(2) set X_ 538
$node_(2) set Y_ 950
$node_(2) set Z_ 0.0
$ns initial_node_pos $node_(2) 20

#???3?Node
set node_(3) [$ns node]
$node_(3) set X_ 308
$node_(3) set Y_ 944
$node_(3) set Z_ 0.0
$ns initial_node_pos $node_(3) 20

#???4?Node
set node_(4) [$ns node]
$node_(4) set X_ 294
$node_(4) set Y_ 952
$node_(4) set Z_ 0.0
$ns initial_node_pos $node_(4) 20

#???5?Node
set node_(5) [$ns node]
$node_(5) set X_ 292
$node_(5) set Y_ 892
$node_(5) set Z_ 0.0
$ns initial_node_pos $node_(5) 20

#???6?Node
set node_(6) [$ns node]
$node_(6) set X_ 574
$node_(6) set Y_ 818
$node_(6) set Z_ 0.0
$ns initial_node_pos $node_(6) 20

#???7?Node
set node_(7) [$ns node]
$node_(7) set X_ 626
$node_(7) set Y_ 610
$node_(7) set Z_ 0.0
$ns initial_node_pos $node_(7) 20

#???8?Node
set node_(10) [$ns node]
$node_(10) set X_ 224
$node_(10) set Y_ 542
$node_(10) set Z_ 0.0
$ns initial_node_pos $node_(10) 20

#???9?Node
set node_(11) [$ns node]
$node_(11) set X_ 546
$node_(11) set Y_ 380
$node_(11) set Z_ 0.0
$ns initial_node_pos $node_(11) 20

#???10?Node
set node_(12) [$ns node]
$node_(12) set X_ 630
$node_(12) set Y_ 598
$node_(12) set Z_ 0.0
$ns initial_node_pos $node_(12) 20

#???11?Node
set node_(13) [$ns node]
$node_(13) set X_ 168
$node_(13) set Y_ 50
$node_(13) set Z_ 0.0
$ns initial_node_pos $node_(13) 20

#???12?Node
set node_(14) [$ns node]
$node_(14) set X_ 766
$node_(14) set Y_ 410
$node_(14) set Z_ 0.0
$ns initial_node_pos $node_(14) 20

#???13?Node
set node_(15) [$ns node]
$node_(15) set X_ 714
$node_(15) set Y_ 226
$node_(15) set Z_ 0.0
$ns initial_node_pos $node_(15) 20

#???14?Node
set node_(16) [$ns node]
$node_(16) set X_ 848
$node_(16) set Y_ 568
$node_(16) set Z_ 0.0
$ns initial_node_pos $node_(16) 20

#???15?Node
set node_(17) [$ns node]
$node_(17) set X_ 736
$node_(17) set Y_ 584
$node_(17) set Z_ 0.0
$ns initial_node_pos $node_(17) 20

#???16?Node
set node_(18) [$ns node]
$node_(18) set X_ 766
$node_(18) set Y_ 420
$node_(18) set Z_ 0.0
$ns initial_node_pos $node_(18) 20

#???17?Node
set node_(19) [$ns node]
$node_(19) set X_ 768
$node_(19) set Y_ 450
$node_(19) set Z_ 0.0
$ns initial_node_pos $node_(19) 20

#???18?Node
set node_(20) [$ns node]
$node_(20) set X_ 790
$node_(20) set Y_ 652
$node_(20) set Z_ 0.0
$ns initial_node_pos $node_(20) 20

#???19?Node
set node_(21) [$ns node]
$node_(21) set X_ 710
$node_(21) set Y_ 752
$node_(21) set Z_ 0.0
$ns initial_node_pos $node_(21) 20

#???20?Node
set node_(22) [$ns node]
$node_(22) set X_ 610
$node_(22) set Y_ 874
$node_(22) set Z_ 0.0
$ns initial_node_pos $node_(22) 20

#???21?Node
set node_(23) [$ns node]
$node_(23) set X_ 370
$node_(23) set Y_ 640
$node_(23) set Z_ 0.0
$ns initial_node_pos $node_(23) 20

#???22?Node
set node_(24) [$ns node]
$node_(24) set X_ 452
$node_(24) set Y_ 630
$node_(24) set Z_ 0.0
$ns initial_node_pos $node_(24) 20

#???23?Node
set node_(25) [$ns node]
$node_(25) set X_ 396
$node_(25) set Y_ 756
$node_(25) set Z_ 0.0
$ns initial_node_pos $node_(25) 20

#???24?Node
set node_(26) [$ns node]
$node_(26) set X_ 242
$node_(26) set Y_ 742
$node_(26) set Z_ 0.0
$ns initial_node_pos $node_(26) 20

#???25?Node
set node_(27) [$ns node]
$node_(27) set X_ 284
$node_(27) set Y_ 284
$node_(27) set Z_ 0.0
$ns initial_node_pos $node_(27) 20

#???26?Node
set node_(28) [$ns node]
$node_(28) set X_ 370
$node_(28) set Y_ 372
$node_(28) set Z_ 0.0
$ns initial_node_pos $node_(28) 20

#???27?Node
set node_(29) [$ns node]
$node_(29) set X_ 246
$node_(29) set Y_ 368
$node_(29) set Z_ 0.0
$ns initial_node_pos $node_(29) 20

#???28?Node
set node_(30) [$ns node]
$node_(30) set X_ 630
$node_(30) set Y_ 190
$node_(30) set Z_ 0.0
$ns initial_node_pos $node_(30) 20

#???29?Node
set node_(31) [$ns node]
$node_(31) set X_ 534
$node_(31) set Y_ 168
$node_(31) set Z_ 0.0
$ns initial_node_pos $node_(31) 20

#???30?Node
set node_(32) [$ns node]
$node_(32) set X_ 408
$node_(32) set Y_ 88
$node_(32) set Z_ 0.0
$ns initial_node_pos $node_(32) 20

#???31?Node
set node_(33) [$ns node]
$node_(33) set X_ 834
$node_(33) set Y_ 560
$node_(33) set Z_ 0.0
$ns initial_node_pos $node_(33) 20

#???32?Node
set node_(34) [$ns node]
$node_(34) set X_ 736
$node_(34) set Y_ 300
$node_(34) set Z_ 0.0
$ns initial_node_pos $node_(34) 20

#???33?Node
set node_(35) [$ns node]
$node_(35) set X_ 538
$node_(35) set Y_ 508
$node_(35) set Z_ 0.0
$ns initial_node_pos $node_(35) 20

#===================================
#             ??Movement           
#===================================

$ns at 1.0 " $node_(0) setdest 290.0 944.0 20.0 " 
$ns at 1.0 " $node_(0) setdest 138.0 940.0 20.0 " 
$ns at 1.0 " $node_(0) setdest 222.0 542.0 20.0 " 
$ns at 1.0 " $node_(0) setdest 136.0 938.0 20.0 " 
$ns at 1.0 " $node_(7) setdest 224.0 536.0 20.0 " 
$ns at 1.0 " $node_(7) setdest 626.0 608.0 20.0 " 
$ns at 1.0 " $node_(10) setdest 142.0 944.0 2.0 " 
$ns at 1.0 " $node_(34) setdest 142.0 936.0 20.0 " 
#===================================
#               ????                                 
#===================================

#???0???(CBR-UDP)
set udp0 [new Agent/UDP]
$ns attach-agent $node_(0) $udp0
set null0 [new Agent/Null]
$ns attach-agent $node_(10) $null0
$ns connect $udp0 $null0
$udp0 set fid_ 2	;#?NAM??UDP?????????
set cbr0 [new Application/Traffic/CBR]	;#?UDP??????CBR????
$cbr0 attach-agent $udp0
$cbr0 set type_ CBR
$cbr0 set packet_size_ 1000;#??????
$cbr0 set rate_ 64Kb ;#??????
$cbr0 set random_ false
$ns at 1.0 "$cbr0 start"
$ns at 20.0 "$cbr0 stop"

#???1???(CBR-UDP)
set udp1 [new Agent/UDP]
$ns attach-agent $node_(11) $udp1
set null1 [new Agent/Null]
$ns attach-agent $node_(10) $null1
$ns connect $udp1 $null1
$udp1 set fid_ 2	;#?NAM??UDP?????????
set cbr1 [new Application/Traffic/CBR]	;#?UDP??????CBR????
$cbr1 attach-agent $udp1
$cbr1 set type_ CBR
$cbr1 set packet_size_ 1000;#??????
$cbr1 set rate_ 64Kb ;#??????
$cbr1 set random_ false
$ns at 1.0 "$cbr1 start"
$ns at 20.0 "$cbr1 stop"

#???2???(Ping)
set ping_a(2) [new Agent/Ping]
$ns attach-agent $node_(13) $ping_a(2)
set ping_b(2) [new Agent/Ping]
$ns attach-agent $node_(11) $ping_b(2)
$ns connect $ping_a(2) $ping_b(2)	;#????Ping Agents
$ns at 1.0 "$ping_a(2) send"	;#??Ping???

#???3???(Ping)
set ping_a(3) [new Agent/Ping]
$ns attach-agent $node_(13) $ping_a(3)
set ping_b(3) [new Agent/Ping]
$ns attach-agent $node_(10) $ping_b(3)
$ns connect $ping_a(3) $ping_b(3)	;#????Ping Agents
$ns at 1.0 "$ping_a(3) send"	;#??Ping???

#???4???(Ping)
set ping_a(4) [new Agent/Ping]
$ns attach-agent $node_(15) $ping_a(4)
set ping_b(4) [new Agent/Ping]
$ns attach-agent $node_(14) $ping_b(4)
$ns connect $ping_a(4) $ping_b(4)	;#????Ping Agents
$ns at 1.0 "$ping_a(4) send"	;#??Ping???

#???5???(CBR-UDP)
set udp5 [new Agent/UDP]
$ns attach-agent $node_(13) $udp5
set null5 [new Agent/Null]
$ns attach-agent $node_(11) $null5
$ns connect $udp5 $null5
$udp5 set fid_ 2	;#?NAM??UDP?????????
set cbr5 [new Application/Traffic/CBR]	;#?UDP??????CBR????
$cbr5 attach-agent $udp5
$cbr5 set type_ CBR
$cbr5 set packet_size_ 1000;#??????
$cbr5 set rate_ 64Kb ;#??????
$cbr5 set random_ false
$ns at 1.0 "$cbr5 start"
$ns at 20.0 "$cbr5 stop"

#???6???(CBR-UDP)
set udp6 [new Agent/UDP]
$ns attach-agent $node_(0) $udp6
set null6 [new Agent/Null]
$ns attach-agent $node_(0) $null6
$ns connect $udp6 $null6
$udp6 set fid_ 2	;#?NAM??UDP?????????
set cbr6 [new Application/Traffic/CBR]	;#?UDP??????CBR????
$cbr6 attach-agent $udp6
$cbr6 set type_ CBR
$cbr6 set packet_size_ 1000;#??????
$cbr6 set rate_ 64Kb ;#??????
$cbr6 set random_ false
$ns at 1.0 "$cbr6 start"
$ns at 20.0 "$cbr6 stop"

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
$cbr7 set rate_ 64Kb ;#??????
$cbr7 set random_ false
$ns at 1.0 "$cbr7 start"
$ns at 20.0 "$cbr7 stop"

#???8???(CBR-UDP)
set udp8 [new Agent/UDP]
$ns attach-agent $node_(5) $udp8
set null8 [new Agent/Null]
$ns attach-agent $node_(5) $null8
$ns connect $udp8 $null8
$udp8 set fid_ 2	;#?NAM??UDP?????????
set cbr8 [new Application/Traffic/CBR]	;#?UDP??????CBR????
$cbr8 attach-agent $udp8
$cbr8 set type_ CBR
$cbr8 set packet_size_ 1000;#??????
$cbr8 set rate_ 64Kb ;#??????
$cbr8 set random_ false
$ns at 1.0 "$cbr8 start"
$ns at 20.0 "$cbr8 stop"

#???9???(Ping)
set ping_a(9) [new Agent/Ping]
$ns attach-agent $node_(34) $ping_a(9)
set ping_b(9) [new Agent/Ping]
$ns attach-agent $node_(0) $ping_b(9)
$ns connect $ping_a(9) $ping_b(9)	;#????Ping Agents
$ns at 1.0 "$ping_a(9) send"	;#??Ping???

#???10???(Ping)
set ping_a(10) [new Agent/Ping]
$ns attach-agent $node_(5) $ping_a(10)
set ping_b(10) [new Agent/Ping]
$ns attach-agent $node_(5) $ping_b(10)
$ns connect $ping_a(10) $ping_b(10)	;#????Ping Agents
$ns at 1.0 "$ping_a(10) send"	;#??Ping???

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
