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
set val(nn)     35        ;# number of mobilenodes
set val(rp)     DSDV     ;# routing protocol
set val(x)      1000            ;# X dimension of topography
set val(y)      1000           ;# Y dimension of topography
set val(stop)   10.0 ;# time of simulation end

#===================================
#               ??????                         
#===================================

#??trace file
set ns            [new Simulator]	;#??ns simulator
set tracefd       [open mac_802_11_node_35_ftp_10_cbr_10_ping_10.tr w]	;#??trace file
set namtrace       [open mac_802_11_node_35_ftp_10_cbr_10_ping_10.nam w]	;#????nam trace file

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
$node_(0) set X_ 126
$node_(0) set Y_ 1010
$node_(0) set Z_ 0.0
$ns initial_node_pos $node_(0) 20

#???1?Node
set node_(1) [$ns node]
$node_(1) set X_ 364
$node_(1) set Y_ 1018
$node_(1) set Z_ 0.0
$ns initial_node_pos $node_(1) 20

#???2?Node
set node_(2) [$ns node]
$node_(2) set X_ 612
$node_(2) set Y_ 1020
$node_(2) set Z_ 0.0
$ns initial_node_pos $node_(2) 20

#???3?Node
set node_(3) [$ns node]
$node_(3) set X_ 780
$node_(3) set Y_ 1018
$node_(3) set Z_ 0.0
$ns initial_node_pos $node_(3) 20

#???4?Node
set node_(4) [$ns node]
$node_(4) set X_ 960
$node_(4) set Y_ 1020
$node_(4) set Z_ 0.0
$ns initial_node_pos $node_(4) 20

#???5?Node
set node_(5) [$ns node]
$node_(5) set X_ 1180
$node_(5) set Y_ 1020
$node_(5) set Z_ 0.0
$ns initial_node_pos $node_(5) 20

#???6?Node
set node_(6) [$ns node]
$node_(6) set X_ 1372
$node_(6) set Y_ 1020
$node_(6) set Z_ 0.0
$ns initial_node_pos $node_(6) 20

#???7?Node
set node_(7) [$ns node]
$node_(7) set X_ 1534
$node_(7) set Y_ 1026
$node_(7) set Z_ 0.0
$ns initial_node_pos $node_(7) 20

#???8?Node
set node_(8) [$ns node]
$node_(8) set X_ 1720
$node_(8) set Y_ 1020
$node_(8) set Z_ 0.0
$ns initial_node_pos $node_(8) 20

#???9?Node
set node_(9) [$ns node]
$node_(9) set X_ 1920
$node_(9) set Y_ 1012
$node_(9) set Z_ 0.0
$ns initial_node_pos $node_(9) 20

#???10?Node
set node_(10) [$ns node]
$node_(10) set X_ 154
$node_(10) set Y_ 582
$node_(10) set Z_ 0.0
$ns initial_node_pos $node_(10) 20

#???11?Node
set node_(11) [$ns node]
$node_(11) set X_ 334
$node_(11) set Y_ 578
$node_(11) set Z_ 0.0
$ns initial_node_pos $node_(11) 20

#???12?Node
set node_(12) [$ns node]
$node_(12) set X_ 496
$node_(12) set Y_ 578
$node_(12) set Z_ 0.0
$ns initial_node_pos $node_(12) 20

#???13?Node
set node_(13) [$ns node]
$node_(13) set X_ 652
$node_(13) set Y_ 578
$node_(13) set Z_ 0.0
$ns initial_node_pos $node_(13) 20

#???14?Node
set node_(14) [$ns node]
$node_(14) set X_ 822
$node_(14) set Y_ 578
$node_(14) set Z_ 0.0
$ns initial_node_pos $node_(14) 20

#???15?Node
set node_(15) [$ns node]
$node_(15) set X_ 964
$node_(15) set Y_ 578
$node_(15) set Z_ 0.0
$ns initial_node_pos $node_(15) 20

#???16?Node
set node_(16) [$ns node]
$node_(16) set X_ 1126
$node_(16) set Y_ 578
$node_(16) set Z_ 0.0
$ns initial_node_pos $node_(16) 20

#???17?Node
set node_(17) [$ns node]
$node_(17) set X_ 1322
$node_(17) set Y_ 578
$node_(17) set Z_ 0.0
$ns initial_node_pos $node_(17) 20

#???18?Node
set node_(18) [$ns node]
$node_(18) set X_ 1532
$node_(18) set Y_ 578
$node_(18) set Z_ 0.0
$ns initial_node_pos $node_(18) 20

#???19?Node
set node_(19) [$ns node]
$node_(19) set X_ 1730
$node_(19) set Y_ 582
$node_(19) set Z_ 0.0
$ns initial_node_pos $node_(19) 20

#???20?Node
set node_(20) [$ns node]
$node_(20) set X_ 1900
$node_(20) set Y_ 582
$node_(20) set Z_ 0.0
$ns initial_node_pos $node_(20) 20

#???21?Node
set node_(21) [$ns node]
$node_(21) set X_ 2044
$node_(21) set Y_ 582
$node_(21) set Z_ 0.0
$ns initial_node_pos $node_(21) 20

#???22?Node
set node_(22) [$ns node]
$node_(22) set X_ 160
$node_(22) set Y_ 170
$node_(22) set Z_ 0.0
$ns initial_node_pos $node_(22) 20

#???23?Node
set node_(23) [$ns node]
$node_(23) set X_ 318
$node_(23) set Y_ 178
$node_(23) set Z_ 0.0
$ns initial_node_pos $node_(23) 20

#???24?Node
set node_(24) [$ns node]
$node_(24) set X_ 448
$node_(24) set Y_ 160
$node_(24) set Z_ 0.0
$ns initial_node_pos $node_(24) 20

#???25?Node
set node_(25) [$ns node]
$node_(25) set X_ 670
$node_(25) set Y_ 160
$node_(25) set Z_ 0.0
$ns initial_node_pos $node_(25) 20

#???26?Node
set node_(26) [$ns node]
$node_(26) set X_ 844
$node_(26) set Y_ 160
$node_(26) set Z_ 0.0
$ns initial_node_pos $node_(26) 20

#???27?Node
set node_(27) [$ns node]
$node_(27) set X_ 1040
$node_(27) set Y_ 160
$node_(27) set Z_ 0.0
$ns initial_node_pos $node_(27) 20

#???28?Node
set node_(28) [$ns node]
$node_(28) set X_ 1210
$node_(28) set Y_ 160
$node_(28) set Z_ 0.0
$ns initial_node_pos $node_(28) 20

#???29?Node
set node_(29) [$ns node]
$node_(29) set X_ 1400
$node_(29) set Y_ 160
$node_(29) set Z_ 0.0
$ns initial_node_pos $node_(29) 20

#???30?Node
set node_(30) [$ns node]
$node_(30) set X_ 1560
$node_(30) set Y_ 160
$node_(30) set Z_ 0.0
$ns initial_node_pos $node_(30) 20

#???31?Node
set node_(31) [$ns node]
$node_(31) set X_ 1698
$node_(31) set Y_ 172
$node_(31) set Z_ 0.0
$ns initial_node_pos $node_(31) 20

#???32?Node
set node_(32) [$ns node]
$node_(32) set X_ 1824
$node_(32) set Y_ 174
$node_(32) set Z_ 0.0
$ns initial_node_pos $node_(32) 20

#???33?Node
set node_(33) [$ns node]
$node_(33) set X_ 1940
$node_(33) set Y_ 174
$node_(33) set Z_ 0.0
$ns initial_node_pos $node_(33) 20

#???34?Node
set node_(34) [$ns node]
$node_(34) set X_ 2052
$node_(34) set Y_ 176
$node_(34) set Z_ 0.0
$ns initial_node_pos $node_(34) 20

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
$ns attach-agent $node_(27) $tcp0
$ns attach-agent $node_(31) $sink0
$ns connect $tcp0 $sink0
set ftp0 [new Application/FTP]
$ftp0 attach-agent $tcp0
$ns at 1.0 "$ftp0 start"
$ns at 2.0 "$ftp0 stop"

#???1???(FTP-TCP)
set tcp1 [new Agent/TCP/Newreno]
$tcp1 set class_ 2
set sink1 [new Agent/TCPSink]
$ns attach-agent $node_(29) $tcp1
$ns attach-agent $node_(2) $sink1
$ns connect $tcp1 $sink1
set ftp1 [new Application/FTP]
$ftp1 attach-agent $tcp1
$ns at 1.0 "$ftp1 start"
$ns at 2.0 "$ftp1 stop"

#???2???(FTP-TCP)
set tcp2 [new Agent/TCP/Newreno]
$tcp2 set class_ 2
set sink2 [new Agent/TCPSink]
$ns attach-agent $node_(6) $tcp2
$ns attach-agent $node_(25) $sink2
$ns connect $tcp2 $sink2
set ftp2 [new Application/FTP]
$ftp2 attach-agent $tcp2
$ns at 1.0 "$ftp2 start"
$ns at 2.0 "$ftp2 stop"

#???3???(FTP-TCP)
set tcp3 [new Agent/TCP/Newreno]
$tcp3 set class_ 2
set sink3 [new Agent/TCPSink]
$ns attach-agent $node_(20) $tcp3
$ns attach-agent $node_(14) $sink3
$ns connect $tcp3 $sink3
set ftp3 [new Application/FTP]
$ftp3 attach-agent $tcp3
$ns at 1.0 "$ftp3 start"
$ns at 2.0 "$ftp3 stop"

#???4???(FTP-TCP)
set tcp4 [new Agent/TCP/Newreno]
$tcp4 set class_ 2
set sink4 [new Agent/TCPSink]
$ns attach-agent $node_(20) $tcp4
$ns attach-agent $node_(6) $sink4
$ns connect $tcp4 $sink4
set ftp4 [new Application/FTP]
$ftp4 attach-agent $tcp4
$ns at 1.0 "$ftp4 start"
$ns at 2.0 "$ftp4 stop"

#???5???(FTP-TCP)
set tcp5 [new Agent/TCP/Newreno]
$tcp5 set class_ 2
set sink5 [new Agent/TCPSink]
$ns attach-agent $node_(20) $tcp5
$ns attach-agent $node_(4) $sink5
$ns connect $tcp5 $sink5
set ftp5 [new Application/FTP]
$ftp5 attach-agent $tcp5
$ns at 1.0 "$ftp5 start"
$ns at 2.0 "$ftp5 stop"

#???6???(FTP-TCP)
set tcp6 [new Agent/TCP/Newreno]
$tcp6 set class_ 2
set sink6 [new Agent/TCPSink]
$ns attach-agent $node_(11) $tcp6
$ns attach-agent $node_(15) $sink6
$ns connect $tcp6 $sink6
set ftp6 [new Application/FTP]
$ftp6 attach-agent $tcp6
$ns at 1.0 "$ftp6 start"
$ns at 2.0 "$ftp6 stop"

#???7???(FTP-TCP)
set tcp7 [new Agent/TCP/Newreno]
$tcp7 set class_ 2
set sink7 [new Agent/TCPSink]
$ns attach-agent $node_(24) $tcp7
$ns attach-agent $node_(5) $sink7
$ns connect $tcp7 $sink7
set ftp7 [new Application/FTP]
$ftp7 attach-agent $tcp7
$ns at 1.0 "$ftp7 start"
$ns at 2.0 "$ftp7 stop"

#???8???(FTP-TCP)
set tcp8 [new Agent/TCP/Newreno]
$tcp8 set class_ 2
set sink8 [new Agent/TCPSink]
$ns attach-agent $node_(15) $tcp8
$ns attach-agent $node_(0) $sink8
$ns connect $tcp8 $sink8
set ftp8 [new Application/FTP]
$ftp8 attach-agent $tcp8
$ns at 1.0 "$ftp8 start"
$ns at 2.0 "$ftp8 stop"

#???9???(FTP-TCP)
set tcp9 [new Agent/TCP/Newreno]
$tcp9 set class_ 2
set sink9 [new Agent/TCPSink]
$ns attach-agent $node_(5) $tcp9
$ns attach-agent $node_(27) $sink9
$ns connect $tcp9 $sink9
set ftp9 [new Application/FTP]
$ftp9 attach-agent $tcp9
$ns at 1.0 "$ftp9 start"
$ns at 2.0 "$ftp9 stop"

#???10???(CBR-UDP)
set udp10 [new Agent/UDP]
$ns attach-agent $node_(27) $udp10
set null10 [new Agent/Null]
$ns attach-agent $node_(33) $null10
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

#???11???(CBR-UDP)
set udp11 [new Agent/UDP]
$ns attach-agent $node_(14) $udp11
set null11 [new Agent/Null]
$ns attach-agent $node_(19) $null11
$ns connect $udp11 $null11
$udp11 set fid_ 2	;#?NAM??UDP?????????
set cbr11 [new Application/Traffic/CBR]	;#?UDP??????CBR????
$cbr11 attach-agent $udp11
$cbr11 set type_ CBR
$cbr11 set packet_size_ 1000;#??????
$cbr11 set rate_ 512Kb ;#??????
$cbr11 set random_ false
$ns at 1.0 "$cbr11 start"
$ns at 2.0 "$cbr11 stop"

#???12???(CBR-UDP)
set udp12 [new Agent/UDP]
$ns attach-agent $node_(15) $udp12
set null12 [new Agent/Null]
$ns attach-agent $node_(30) $null12
$ns connect $udp12 $null12
$udp12 set fid_ 2	;#?NAM??UDP?????????
set cbr12 [new Application/Traffic/CBR]	;#?UDP??????CBR????
$cbr12 attach-agent $udp12
$cbr12 set type_ CBR
$cbr12 set packet_size_ 1000;#??????
$cbr12 set rate_ 512Kb ;#??????
$cbr12 set random_ false
$ns at 1.0 "$cbr12 start"
$ns at 2.0 "$cbr12 stop"

#???13???(CBR-UDP)
set udp13 [new Agent/UDP]
$ns attach-agent $node_(4) $udp13
set null13 [new Agent/Null]
$ns attach-agent $node_(4) $null13
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
$ns attach-agent $node_(19) $udp14
set null14 [new Agent/Null]
$ns attach-agent $node_(30) $null14
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
$ns attach-agent $node_(13) $udp15
set null15 [new Agent/Null]
$ns attach-agent $node_(19) $null15
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
$ns attach-agent $node_(33) $udp16
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
$ns attach-agent $node_(10) $udp17
set null17 [new Agent/Null]
$ns attach-agent $node_(17) $null17
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
$ns attach-agent $node_(22) $udp18
set null18 [new Agent/Null]
$ns attach-agent $node_(15) $null18
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
$ns attach-agent $node_(29) $udp19
set null19 [new Agent/Null]
$ns attach-agent $node_(5) $null19
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

#???20???(Ping)
set ping_a(20) [new Agent/Ping]
$ns attach-agent $node_(32) $ping_a(20)
set ping_b(20) [new Agent/Ping]
$ns attach-agent $node_(7) $ping_b(20)
$ns connect $ping_a(20) $ping_b(20)	;#????Ping Agents
$ns at 1.0 "$ping_a(20) send"	;#??Ping???

#???21???(Ping)
set ping_a(21) [new Agent/Ping]
$ns attach-agent $node_(12) $ping_a(21)
set ping_b(21) [new Agent/Ping]
$ns attach-agent $node_(32) $ping_b(21)
$ns connect $ping_a(21) $ping_b(21)	;#????Ping Agents
$ns at 1.0 "$ping_a(21) send"	;#??Ping???

#???22???(Ping)
set ping_a(22) [new Agent/Ping]
$ns attach-agent $node_(32) $ping_a(22)
set ping_b(22) [new Agent/Ping]
$ns attach-agent $node_(17) $ping_b(22)
$ns connect $ping_a(22) $ping_b(22)	;#????Ping Agents
$ns at 1.0 "$ping_a(22) send"	;#??Ping???

#???23???(Ping)
set ping_a(23) [new Agent/Ping]
$ns attach-agent $node_(22) $ping_a(23)
set ping_b(23) [new Agent/Ping]
$ns attach-agent $node_(33) $ping_b(23)
$ns connect $ping_a(23) $ping_b(23)	;#????Ping Agents
$ns at 1.0 "$ping_a(23) send"	;#??Ping???

#???24???(Ping)
set ping_a(24) [new Agent/Ping]
$ns attach-agent $node_(25) $ping_a(24)
set ping_b(24) [new Agent/Ping]
$ns attach-agent $node_(31) $ping_b(24)
$ns connect $ping_a(24) $ping_b(24)	;#????Ping Agents
$ns at 1.0 "$ping_a(24) send"	;#??Ping???

#???25???(Ping)
set ping_a(25) [new Agent/Ping]
$ns attach-agent $node_(2) $ping_a(25)
set ping_b(25) [new Agent/Ping]
$ns attach-agent $node_(20) $ping_b(25)
$ns connect $ping_a(25) $ping_b(25)	;#????Ping Agents
$ns at 1.0 "$ping_a(25) send"	;#??Ping???

#???26???(Ping)
set ping_a(26) [new Agent/Ping]
$ns attach-agent $node_(12) $ping_a(26)
set ping_b(26) [new Agent/Ping]
$ns attach-agent $node_(10) $ping_b(26)
$ns connect $ping_a(26) $ping_b(26)	;#????Ping Agents
$ns at 1.0 "$ping_a(26) send"	;#??Ping???

#???27???(Ping)
set ping_a(27) [new Agent/Ping]
$ns attach-agent $node_(15) $ping_a(27)
set ping_b(27) [new Agent/Ping]
$ns attach-agent $node_(19) $ping_b(27)
$ns connect $ping_a(27) $ping_b(27)	;#????Ping Agents
$ns at 1.0 "$ping_a(27) send"	;#??Ping???

#???28???(Ping)
set ping_a(28) [new Agent/Ping]
$ns attach-agent $node_(20) $ping_a(28)
set ping_b(28) [new Agent/Ping]
$ns attach-agent $node_(29) $ping_b(28)
$ns connect $ping_a(28) $ping_b(28)	;#????Ping Agents
$ns at 1.0 "$ping_a(28) send"	;#??Ping???

#???29???(Ping)
set ping_a(29) [new Agent/Ping]
$ns attach-agent $node_(16) $ping_a(29)
set ping_b(29) [new Agent/Ping]
$ns attach-agent $node_(26) $ping_b(29)
$ns connect $ping_a(29) $ping_b(29)	;#????Ping Agents
$ns at 1.0 "$ping_a(29) send"	;#??Ping???

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
