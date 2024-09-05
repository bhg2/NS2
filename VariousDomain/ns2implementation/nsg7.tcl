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
set val(nn)     12        ;# number of mobilenodes
set val(rp)     TORA     ;# routing protocol
set val(x)      1000            ;# X dimension of topography
set val(y)      1000           ;# Y dimension of topography
set val(stop)   10.0 ;# time of simulation end

#===================================
#               ??????                         
#===================================

#??trace file
set ns            [new Simulator]	;#??ns simulator
set tracefd       [open mac_802_11_node_12_ftp_13_cbr_9_ping_9.tr w]	;#??trace file
set namtrace       [open mac_802_11_node_12_ftp_13_cbr_9_ping_9.nam w]	;#????nam trace file

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
$node_(0) set X_ 162
$node_(0) set Y_ 986
$node_(0) set Z_ 0.0
$ns initial_node_pos $node_(0) 20

#???1?Node
set node_(1) [$ns node]
$node_(1) set X_ 354
$node_(1) set Y_ 982
$node_(1) set Z_ 0.0
$ns initial_node_pos $node_(1) 20

#???2?Node
set node_(2) [$ns node]
$node_(2) set X_ 244
$node_(2) set Y_ 884
$node_(2) set Z_ 0.0
$ns initial_node_pos $node_(2) 20

#???3?Node
set node_(3) [$ns node]
$node_(3) set X_ 482
$node_(3) set Y_ 984
$node_(3) set Z_ 0.0
$ns initial_node_pos $node_(3) 20

#???4?Node
set node_(4) [$ns node]
$node_(4) set X_ 380
$node_(4) set Y_ 894
$node_(4) set Z_ 0.0
$ns initial_node_pos $node_(4) 20

#???5?Node
set node_(5) [$ns node]
$node_(5) set X_ 310
$node_(5) set Y_ 816
$node_(5) set Z_ 0.0
$ns initial_node_pos $node_(5) 20

#???6?Node
set node_(6) [$ns node]
$node_(6) set X_ 430
$node_(6) set Y_ 812
$node_(6) set Z_ 0.0
$ns initial_node_pos $node_(6) 20

#???7?Node
set node_(7) [$ns node]
$node_(7) set X_ 548
$node_(7) set Y_ 840
$node_(7) set Z_ 0.0
$ns initial_node_pos $node_(7) 20

#???8?Node
set node_(8) [$ns node]
$node_(8) set X_ 442
$node_(8) set Y_ 752
$node_(8) set Z_ 0.0
$ns initial_node_pos $node_(8) 20

#???9?Node
set node_(9) [$ns node]
$node_(9) set X_ 288
$node_(9) set Y_ 712
$node_(9) set Z_ 0.0
$ns initial_node_pos $node_(9) 20

#???10?Node
set node_(10) [$ns node]
$node_(10) set X_ 148
$node_(10) set Y_ 780
$node_(10) set Z_ 0.0
$ns initial_node_pos $node_(10) 20

#???11?Node
set node_(11) [$ns node]
$node_(11) set X_ 538
$node_(11) set Y_ 842
$node_(11) set Z_ 0.0
$ns initial_node_pos $node_(11) 20

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

#???1???(FTP-TCP)
set tcp1 [new Agent/TCP/Newreno]
$tcp1 set class_ 2
set sink1 [new Agent/TCPSink]
$ns attach-agent $node_(1) $tcp1
$ns attach-agent $node_(3) $sink1
$ns connect $tcp1 $sink1
set ftp1 [new Application/FTP]
$ftp1 attach-agent $tcp1
$ns at 1.0 "$ftp1 start"
$ns at 2.0 "$ftp1 stop"

#???2???(FTP-TCP)
set tcp2 [new Agent/TCP/Newreno]
$tcp2 set class_ 2
set sink2 [new Agent/TCPSink]
$ns attach-agent $node_(1) $tcp2
$ns attach-agent $node_(2) $sink2
$ns connect $tcp2 $sink2
set ftp2 [new Application/FTP]
$ftp2 attach-agent $tcp2
$ns at 1.0 "$ftp2 start"
$ns at 2.0 "$ftp2 stop"

#???3???(FTP-TCP)
set tcp3 [new Agent/TCP/Newreno]
$tcp3 set class_ 2
set sink3 [new Agent/TCPSink]
$ns attach-agent $node_(2) $tcp3
$ns attach-agent $node_(4) $sink3
$ns connect $tcp3 $sink3
set ftp3 [new Application/FTP]
$ftp3 attach-agent $tcp3
$ns at 1.0 "$ftp3 start"
$ns at 2.0 "$ftp3 stop"

#???4???(FTP-TCP)
set tcp4 [new Agent/TCP/Newreno]
$tcp4 set class_ 2
set sink4 [new Agent/TCPSink]
$ns attach-agent $node_(4) $tcp4
$ns attach-agent $node_(5) $sink4
$ns connect $tcp4 $sink4
set ftp4 [new Application/FTP]
$ftp4 attach-agent $tcp4
$ns at 1.0 "$ftp4 start"
$ns at 2.0 "$ftp4 stop"

#???5???(FTP-TCP)
set tcp5 [new Agent/TCP/Newreno]
$tcp5 set class_ 2
set sink5 [new Agent/TCPSink]
$ns attach-agent $node_(5) $tcp5
$ns attach-agent $node_(6) $sink5
$ns connect $tcp5 $sink5
set ftp5 [new Application/FTP]
$ftp5 attach-agent $tcp5
$ns at 1.0 "$ftp5 start"
$ns at 2.0 "$ftp5 stop"

#???6???(FTP-TCP)
set tcp6 [new Agent/TCP/Newreno]
$tcp6 set class_ 2
set sink6 [new Agent/TCPSink]
$ns attach-agent $node_(6) $tcp6
$ns attach-agent $node_(7) $sink6
$ns connect $tcp6 $sink6
set ftp6 [new Application/FTP]
$ftp6 attach-agent $tcp6
$ns at 1.0 "$ftp6 start"
$ns at 2.0 "$ftp6 stop"

#???7???(FTP-TCP)
set tcp7 [new Agent/TCP/Newreno]
$tcp7 set class_ 2
set sink7 [new Agent/TCPSink]
$ns attach-agent $node_(7) $tcp7
$ns attach-agent $node_(8) $sink7
$ns connect $tcp7 $sink7
set ftp7 [new Application/FTP]
$ftp7 attach-agent $tcp7
$ns at 1.0 "$ftp7 start"
$ns at 2.0 "$ftp7 stop"

#???8???(FTP-TCP)
set tcp8 [new Agent/TCP/Newreno]
$tcp8 set class_ 2
set sink8 [new Agent/TCPSink]
$ns attach-agent $node_(8) $tcp8
$ns attach-agent $node_(9) $sink8
$ns connect $tcp8 $sink8
set ftp8 [new Application/FTP]
$ftp8 attach-agent $tcp8
$ns at 1.0 "$ftp8 start"
$ns at 2.0 "$ftp8 stop"

#???9???(FTP-TCP)
set tcp9 [new Agent/TCP/Newreno]
$tcp9 set class_ 2
set sink9 [new Agent/TCPSink]
$ns attach-agent $node_(9) $tcp9
$ns attach-agent $node_(10) $sink9
$ns connect $tcp9 $sink9
set ftp9 [new Application/FTP]
$ftp9 attach-agent $tcp9
$ns at 1.0 "$ftp9 start"
$ns at 2.0 "$ftp9 stop"

#???10???(FTP-TCP)
set tcp10 [new Agent/TCP/Newreno]
$tcp10 set class_ 2
set sink10 [new Agent/TCPSink]
$ns attach-agent $node_(10) $tcp10
$ns attach-agent $node_(0) $sink10
$ns connect $tcp10 $sink10
set ftp10 [new Application/FTP]
$ftp10 attach-agent $tcp10
$ns at 1.0 "$ftp10 start"
$ns at 2.0 "$ftp10 stop"

#???11???(FTP-TCP)
set tcp11 [new Agent/TCP/Newreno]
$tcp11 set class_ 2
set sink11 [new Agent/TCPSink]
$ns attach-agent $node_(0) $tcp11
$ns attach-agent $node_(10) $sink11
$ns connect $tcp11 $sink11
set ftp11 [new Application/FTP]
$ftp11 attach-agent $tcp11
$ns at 1.0 "$ftp11 start"
$ns at 2.0 "$ftp11 stop"

#???12???(FTP-TCP)
set tcp12 [new Agent/TCP/Newreno]
$tcp12 set class_ 2
set sink12 [new Agent/TCPSink]
$ns attach-agent $node_(10) $tcp12
$ns attach-agent $node_(0) $sink12
$ns connect $tcp12 $sink12
set ftp12 [new Application/FTP]
$ftp12 attach-agent $tcp12
$ns at 1.0 "$ftp12 start"
$ns at 2.0 "$ftp12 stop"

#???13???(CBR-UDP)
set udp13 [new Agent/UDP]
$ns attach-agent $node_(0) $udp13
set null13 [new Agent/Null]
$ns attach-agent $node_(1) $null13
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

#???14???(CBR-UDP)
set udp14 [new Agent/UDP]
$ns attach-agent $node_(1) $udp14
set null14 [new Agent/Null]
$ns attach-agent $node_(3) $null14
$ns connect $udp14 $null14
$udp14 set fid_ 2	;#?NAM??UDP?????????
set cbr14 [new Application/Traffic/CBR]	;#?UDP??????CBR????
$cbr14 attach-agent $udp14
$cbr14 set type_ CBR
$cbr14 set packet_size_ 1000;#??????
$cbr14 set rate_ 512Kb ;#??????
$cbr14 set random_ false
$ns at 1.0 "$cbr14 start"
$ns at 2.0 "$cbr14 stop"

#???15???(CBR-UDP)
set udp15 [new Agent/UDP]
$ns attach-agent $node_(1) $udp15
set null15 [new Agent/Null]
$ns attach-agent $node_(2) $null15
$ns connect $udp15 $null15
$udp15 set fid_ 2	;#?NAM??UDP?????????
set cbr15 [new Application/Traffic/CBR]	;#?UDP??????CBR????
$cbr15 attach-agent $udp15
$cbr15 set type_ CBR
$cbr15 set packet_size_ 1000;#??????
$cbr15 set rate_ 512Kb ;#??????
$cbr15 set random_ false
$ns at 1.0 "$cbr15 start"
$ns at 2.0 "$cbr15 stop"

#???16???(CBR-UDP)
set udp16 [new Agent/UDP]
$ns attach-agent $node_(2) $udp16
set null16 [new Agent/Null]
$ns attach-agent $node_(4) $null16
$ns connect $udp16 $null16
$udp16 set fid_ 2	;#?NAM??UDP?????????
set cbr16 [new Application/Traffic/CBR]	;#?UDP??????CBR????
$cbr16 attach-agent $udp16
$cbr16 set type_ CBR
$cbr16 set packet_size_ 1000;#??????
$cbr16 set rate_ 512Kb ;#??????
$cbr16 set random_ false
$ns at 1.0 "$cbr16 start"
$ns at 2.0 "$cbr16 stop"

#???17???(CBR-UDP)
set udp17 [new Agent/UDP]
$ns attach-agent $node_(4) $udp17
set null17 [new Agent/Null]
$ns attach-agent $node_(5) $null17
$ns connect $udp17 $null17
$udp17 set fid_ 2	;#?NAM??UDP?????????
set cbr17 [new Application/Traffic/CBR]	;#?UDP??????CBR????
$cbr17 attach-agent $udp17
$cbr17 set type_ CBR
$cbr17 set packet_size_ 1000;#??????
$cbr17 set rate_ 512Kb ;#??????
$cbr17 set random_ false
$ns at 1.0 "$cbr17 start"
$ns at 2.0 "$cbr17 stop"

#???18???(CBR-UDP)
set udp18 [new Agent/UDP]
$ns attach-agent $node_(6) $udp18
set null18 [new Agent/Null]
$ns attach-agent $node_(7) $null18
$ns connect $udp18 $null18
$udp18 set fid_ 2	;#?NAM??UDP?????????
set cbr18 [new Application/Traffic/CBR]	;#?UDP??????CBR????
$cbr18 attach-agent $udp18
$cbr18 set type_ CBR
$cbr18 set packet_size_ 1000;#??????
$cbr18 set rate_ 512Kb ;#??????
$cbr18 set random_ false
$ns at 1.0 "$cbr18 start"
$ns at 2.0 "$cbr18 stop"

#???19???(CBR-UDP)
set udp19 [new Agent/UDP]
$ns attach-agent $node_(8) $udp19
set null19 [new Agent/Null]
$ns attach-agent $node_(7) $null19
$ns connect $udp19 $null19
$udp19 set fid_ 2	;#?NAM??UDP?????????
set cbr19 [new Application/Traffic/CBR]	;#?UDP??????CBR????
$cbr19 attach-agent $udp19
$cbr19 set type_ CBR
$cbr19 set packet_size_ 1000;#??????
$cbr19 set rate_ 512Kb ;#??????
$cbr19 set random_ false
$ns at 1.0 "$cbr19 start"
$ns at 2.0 "$cbr19 stop"

#???20???(CBR-UDP)
set udp20 [new Agent/UDP]
$ns attach-agent $node_(8) $udp20
set null20 [new Agent/Null]
$ns attach-agent $node_(9) $null20
$ns connect $udp20 $null20
$udp20 set fid_ 2	;#?NAM??UDP?????????
set cbr20 [new Application/Traffic/CBR]	;#?UDP??????CBR????
$cbr20 attach-agent $udp20
$cbr20 set type_ CBR
$cbr20 set packet_size_ 1000;#??????
$cbr20 set rate_ 512Kb ;#??????
$cbr20 set random_ false
$ns at 1.0 "$cbr20 start"
$ns at 2.0 "$cbr20 stop"

#???21???(CBR-UDP)
set udp21 [new Agent/UDP]
$ns attach-agent $node_(9) $udp21
set null21 [new Agent/Null]
$ns attach-agent $node_(10) $null21
$ns connect $udp21 $null21
$udp21 set fid_ 2	;#?NAM??UDP?????????
set cbr21 [new Application/Traffic/CBR]	;#?UDP??????CBR????
$cbr21 attach-agent $udp21
$cbr21 set type_ CBR
$cbr21 set packet_size_ 1000;#??????
$cbr21 set rate_ 512Kb ;#??????
$cbr21 set random_ false
$ns at 1.0 "$cbr21 start"
$ns at 2.0 "$cbr21 stop"

#???22???(Ping)
set ping_a(22) [new Agent/Ping]
$ns attach-agent $node_(0) $ping_a(22)
set ping_b(22) [new Agent/Ping]
$ns attach-agent $node_(1) $ping_b(22)
$ns connect $ping_a(22) $ping_b(22)	;#????Ping Agents
$ns at 1.0 "$ping_a(22) send"	;#??Ping???

#???23???(Ping)
set ping_a(23) [new Agent/Ping]
$ns attach-agent $node_(1) $ping_a(23)
set ping_b(23) [new Agent/Ping]
$ns attach-agent $node_(3) $ping_b(23)
$ns connect $ping_a(23) $ping_b(23)	;#????Ping Agents
$ns at 1.0 "$ping_a(23) send"	;#??Ping???

#???24???(Ping)
set ping_a(24) [new Agent/Ping]
$ns attach-agent $node_(1) $ping_a(24)
set ping_b(24) [new Agent/Ping]
$ns attach-agent $node_(2) $ping_b(24)
$ns connect $ping_a(24) $ping_b(24)	;#????Ping Agents
$ns at 1.0 "$ping_a(24) send"	;#??Ping???

#???25???(Ping)
set ping_a(25) [new Agent/Ping]
$ns attach-agent $node_(2) $ping_a(25)
set ping_b(25) [new Agent/Ping]
$ns attach-agent $node_(4) $ping_b(25)
$ns connect $ping_a(25) $ping_b(25)	;#????Ping Agents
$ns at 1.0 "$ping_a(25) send"	;#??Ping???

#???26???(Ping)
set ping_a(26) [new Agent/Ping]
$ns attach-agent $node_(4) $ping_a(26)
set ping_b(26) [new Agent/Ping]
$ns attach-agent $node_(5) $ping_b(26)
$ns connect $ping_a(26) $ping_b(26)	;#????Ping Agents
$ns at 1.0 "$ping_a(26) send"	;#??Ping???

#???27???(Ping)
set ping_a(27) [new Agent/Ping]
$ns attach-agent $node_(7) $ping_a(27)
set ping_b(27) [new Agent/Ping]
$ns attach-agent $node_(8) $ping_b(27)
$ns connect $ping_a(27) $ping_b(27)	;#????Ping Agents
$ns at 1.0 "$ping_a(27) send"	;#??Ping???

#???28???(Ping)
set ping_a(28) [new Agent/Ping]
$ns attach-agent $node_(8) $ping_a(28)
set ping_b(28) [new Agent/Ping]
$ns attach-agent $node_(9) $ping_b(28)
$ns connect $ping_a(28) $ping_b(28)	;#????Ping Agents
$ns at 1.0 "$ping_a(28) send"	;#??Ping???

#???29???(Ping)
set ping_a(29) [new Agent/Ping]
$ns attach-agent $node_(9) $ping_a(29)
set ping_b(29) [new Agent/Ping]
$ns attach-agent $node_(10) $ping_b(29)
$ns connect $ping_a(29) $ping_b(29)	;#????Ping Agents
$ns at 1.0 "$ping_a(29) send"	;#??Ping???

#???30???(Ping)
set ping_a(30) [new Agent/Ping]
$ns attach-agent $node_(1) $ping_a(30)
set ping_b(30) [new Agent/Ping]
$ns attach-agent $node_(1) $ping_b(30)
$ns connect $ping_a(30) $ping_b(30)	;#????Ping Agents
$ns at 1.0 "$ping_a(30) send"	;#??Ping???

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
