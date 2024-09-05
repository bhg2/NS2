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
set val(nn)     31        ;# number of mobilenodes
set val(rp)     DSDV     ;# routing protocol
set val(x)      1000            ;# X dimension of topography
set val(y)      1000           ;# Y dimension of topography
set val(stop)   10.0 ;# time of simulation end

#===================================
#               ??????                         
#===================================

#??trace file
set ns            [new Simulator]	;#??ns simulator
set tracefd       [open mac_802_11_node_31_ftp_31_cbr_33_ping_33.tr w]	;#??trace file
set namtrace       [open mac_802_11_node_31_ftp_31_cbr_33_ping_33.nam w]	;#????nam trace file

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
$node_(0) set X_ 448
$node_(0) set Y_ 748
$node_(0) set Z_ 0.0
$ns initial_node_pos $node_(0) 20

#???1?Node
set node_(1) [$ns node]
$node_(1) set X_ 640
$node_(1) set Y_ 748
$node_(1) set Z_ 0.0
$ns initial_node_pos $node_(1) 20

#???2?Node
set node_(2) [$ns node]
$node_(2) set X_ 560
$node_(2) set Y_ 596
$node_(2) set Z_ 0.0
$ns initial_node_pos $node_(2) 20

#???3?Node
set node_(3) [$ns node]
$node_(3) set X_ 740
$node_(3) set Y_ 592
$node_(3) set Z_ 0.0
$ns initial_node_pos $node_(3) 20

#???4?Node
set node_(4) [$ns node]
$node_(4) set X_ 870
$node_(4) set Y_ 732
$node_(4) set Z_ 0.0
$ns initial_node_pos $node_(4) 20

#???5?Node
set node_(5) [$ns node]
$node_(5) set X_ 928
$node_(5) set Y_ 620
$node_(5) set Z_ 0.0
$ns initial_node_pos $node_(5) 20

#???6?Node
set node_(6) [$ns node]
$node_(6) set X_ 792
$node_(6) set Y_ 468
$node_(6) set Z_ 0.0
$ns initial_node_pos $node_(6) 20

#???7?Node
set node_(7) [$ns node]
$node_(7) set X_ 626
$node_(7) set Y_ 448
$node_(7) set Z_ 0.0
$ns initial_node_pos $node_(7) 20

#???8?Node
set node_(8) [$ns node]
$node_(8) set X_ 474
$node_(8) set Y_ 444
$node_(8) set Z_ 0.0
$ns initial_node_pos $node_(8) 20

#???9?Node
set node_(9) [$ns node]
$node_(9) set X_ 362
$node_(9) set Y_ 578
$node_(9) set Z_ 0.0
$ns initial_node_pos $node_(9) 20

#???10?Node
set node_(10) [$ns node]
$node_(10) set X_ 1014
$node_(10) set Y_ 492
$node_(10) set Z_ 0.0
$ns initial_node_pos $node_(10) 20

#???11?Node
set node_(11) [$ns node]
$node_(11) set X_ 1082
$node_(11) set Y_ 654
$node_(11) set Z_ 0.0
$ns initial_node_pos $node_(11) 20

#???12?Node
set node_(12) [$ns node]
$node_(12) set X_ 1186
$node_(12) set Y_ 792
$node_(12) set Z_ 0.0
$ns initial_node_pos $node_(12) 20

#???13?Node
set node_(13) [$ns node]
$node_(13) set X_ 1194
$node_(13) set Y_ 608
$node_(13) set Z_ 0.0
$ns initial_node_pos $node_(13) 20

#???14?Node
set node_(14) [$ns node]
$node_(14) set X_ 1040
$node_(14) set Y_ 806
$node_(14) set Z_ 0.0
$ns initial_node_pos $node_(14) 20

#???15?Node
set node_(15) [$ns node]
$node_(15) set X_ 788
$node_(15) set Y_ 880
$node_(15) set Z_ 0.0
$ns initial_node_pos $node_(15) 20

#???16?Node
set node_(16) [$ns node]
$node_(16) set X_ 936
$node_(16) set Y_ 916
$node_(16) set Z_ 0.0
$ns initial_node_pos $node_(16) 20

#???17?Node
set node_(17) [$ns node]
$node_(17) set X_ 618
$node_(17) set Y_ 930
$node_(17) set Z_ 0.0
$ns initial_node_pos $node_(17) 20

#???18?Node
set node_(18) [$ns node]
$node_(18) set X_ 790
$node_(18) set Y_ 1042
$node_(18) set Z_ 0.0
$ns initial_node_pos $node_(18) 20

#???19?Node
set node_(19) [$ns node]
$node_(19) set X_ 1234
$node_(19) set Y_ 946
$node_(19) set Z_ 0.0
$ns initial_node_pos $node_(19) 20

#???20?Node
set node_(20) [$ns node]
$node_(20) set X_ 1104
$node_(20) set Y_ 1040
$node_(20) set Z_ 0.0
$ns initial_node_pos $node_(20) 20

#???21?Node
set node_(21) [$ns node]
$node_(21) set X_ 946
$node_(21) set Y_ 1090
$node_(21) set Z_ 0.0
$ns initial_node_pos $node_(21) 20

#???22?Node
set node_(22) [$ns node]
$node_(22) set X_ 1310
$node_(22) set Y_ 586
$node_(22) set Z_ 0.0
$ns initial_node_pos $node_(22) 20

#???23?Node
set node_(23) [$ns node]
$node_(23) set X_ 1242
$node_(23) set Y_ 450
$node_(23) set Z_ 0.0
$ns initial_node_pos $node_(23) 20

#???24?Node
set node_(24) [$ns node]
$node_(24) set X_ 936
$node_(24) set Y_ 316
$node_(24) set Z_ 0.0
$ns initial_node_pos $node_(24) 20

#???25?Node
set node_(25) [$ns node]
$node_(25) set X_ 1146
$node_(25) set Y_ 306
$node_(25) set Z_ 0.0
$ns initial_node_pos $node_(25) 20

#???26?Node
set node_(26) [$ns node]
$node_(26) set X_ 680
$node_(26) set Y_ 286
$node_(26) set Z_ 0.0
$ns initial_node_pos $node_(26) 20

#???27?Node
set node_(27) [$ns node]
$node_(27) set X_ 444
$node_(27) set Y_ 306
$node_(27) set Z_ 0.0
$ns initial_node_pos $node_(27) 20

#???28?Node
set node_(28) [$ns node]
$node_(28) set X_ 818
$node_(28) set Y_ 200
$node_(28) set Z_ 0.0
$ns initial_node_pos $node_(28) 20

#???29?Node
set node_(29) [$ns node]
$node_(29) set X_ 994
$node_(29) set Y_ 192
$node_(29) set Z_ 0.0
$ns initial_node_pos $node_(29) 20

#???30?Node
set node_(30) [$ns node]
$node_(30) set X_ 1200
$node_(30) set Y_ 148
$node_(30) set Z_ 0.0
$ns initial_node_pos $node_(30) 20

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
$ns attach-agent $node_(0) $udp1
set null1 [new Agent/Null]
$ns attach-agent $node_(1) $null1
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

#???2???(Ping)
set ping_a(2) [new Agent/Ping]
$ns attach-agent $node_(0) $ping_a(2)
set ping_b(2) [new Agent/Ping]
$ns attach-agent $node_(1) $ping_b(2)
$ns connect $ping_a(2) $ping_b(2)	;#????Ping Agents
$ns at 1.0 "$ping_a(2) send"	;#??Ping???

#???3???(FTP-TCP)
set tcp3 [new Agent/TCP/Newreno]
$tcp3 set class_ 2
set sink3 [new Agent/TCPSink]
$ns attach-agent $node_(1) $tcp3
$ns attach-agent $node_(2) $sink3
$ns connect $tcp3 $sink3
set ftp3 [new Application/FTP]
$ftp3 attach-agent $tcp3
$ns at 1.0 "$ftp3 start"
$ns at 2.0 "$ftp3 stop"

#???4???(CBR-UDP)
set udp4 [new Agent/UDP]
$ns attach-agent $node_(1) $udp4
set null4 [new Agent/Null]
$ns attach-agent $node_(2) $null4
$ns connect $udp4 $null4
$udp4 set fid_ 2	;#?NAM??UDP?????????
set cbr4 [new Application/Traffic/CBR]	;#?UDP??????CBR????
$cbr4 attach-agent $udp4
$cbr4 set type_ CBR
$cbr4 set packet_size_ 1000;#??????
$cbr4 set rate_ 512Kb ;#??????
$cbr4 set random_ false
$ns at 1.0 "$cbr4 start"
$ns at 2.0 "$cbr4 stop"

#???5???(Ping)
set ping_a(5) [new Agent/Ping]
$ns attach-agent $node_(1) $ping_a(5)
set ping_b(5) [new Agent/Ping]
$ns attach-agent $node_(2) $ping_b(5)
$ns connect $ping_a(5) $ping_b(5)	;#????Ping Agents
$ns at 1.0 "$ping_a(5) send"	;#??Ping???

#???6???(FTP-TCP)
set tcp6 [new Agent/TCP/Newreno]
$tcp6 set class_ 2
set sink6 [new Agent/TCPSink]
$ns attach-agent $node_(2) $tcp6
$ns attach-agent $node_(3) $sink6
$ns connect $tcp6 $sink6
set ftp6 [new Application/FTP]
$ftp6 attach-agent $tcp6
$ns at 1.0 "$ftp6 start"
$ns at 2.0 "$ftp6 stop"

#???7???(CBR-UDP)
set udp7 [new Agent/UDP]
$ns attach-agent $node_(2) $udp7
set null7 [new Agent/Null]
$ns attach-agent $node_(3) $null7
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

#???8???(Ping)
set ping_a(8) [new Agent/Ping]
$ns attach-agent $node_(2) $ping_a(8)
set ping_b(8) [new Agent/Ping]
$ns attach-agent $node_(3) $ping_b(8)
$ns connect $ping_a(8) $ping_b(8)	;#????Ping Agents
$ns at 1.0 "$ping_a(8) send"	;#??Ping???

#???9???(FTP-TCP)
set tcp9 [new Agent/TCP/Newreno]
$tcp9 set class_ 2
set sink9 [new Agent/TCPSink]
$ns attach-agent $node_(3) $tcp9
$ns attach-agent $node_(4) $sink9
$ns connect $tcp9 $sink9
set ftp9 [new Application/FTP]
$ftp9 attach-agent $tcp9
$ns at 1.0 "$ftp9 start"
$ns at 2.0 "$ftp9 stop"

#???10???(CBR-UDP)
set udp10 [new Agent/UDP]
$ns attach-agent $node_(3) $udp10
set null10 [new Agent/Null]
$ns attach-agent $node_(4) $null10
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
$ns attach-agent $node_(3) $ping_a(11)
set ping_b(11) [new Agent/Ping]
$ns attach-agent $node_(4) $ping_b(11)
$ns connect $ping_a(11) $ping_b(11)	;#????Ping Agents
$ns at 1.0 "$ping_a(11) send"	;#??Ping???

#???12???(FTP-TCP)
set tcp12 [new Agent/TCP/Newreno]
$tcp12 set class_ 2
set sink12 [new Agent/TCPSink]
$ns attach-agent $node_(4) $tcp12
$ns attach-agent $node_(5) $sink12
$ns connect $tcp12 $sink12
set ftp12 [new Application/FTP]
$ftp12 attach-agent $tcp12
$ns at 1.0 "$ftp12 start"
$ns at 2.0 "$ftp12 stop"

#???13???(CBR-UDP)
set udp13 [new Agent/UDP]
$ns attach-agent $node_(4) $udp13
set null13 [new Agent/Null]
$ns attach-agent $node_(5) $null13
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

#???14???(Ping)
set ping_a(14) [new Agent/Ping]
$ns attach-agent $node_(4) $ping_a(14)
set ping_b(14) [new Agent/Ping]
$ns attach-agent $node_(5) $ping_b(14)
$ns connect $ping_a(14) $ping_b(14)	;#????Ping Agents
$ns at 1.0 "$ping_a(14) send"	;#??Ping???

#???15???(FTP-TCP)
set tcp15 [new Agent/TCP/Newreno]
$tcp15 set class_ 2
set sink15 [new Agent/TCPSink]
$ns attach-agent $node_(5) $tcp15
$ns attach-agent $node_(6) $sink15
$ns connect $tcp15 $sink15
set ftp15 [new Application/FTP]
$ftp15 attach-agent $tcp15
$ns at 1.0 "$ftp15 start"
$ns at 2.0 "$ftp15 stop"

#???16???(CBR-UDP)
set udp16 [new Agent/UDP]
$ns attach-agent $node_(5) $udp16
set null16 [new Agent/Null]
$ns attach-agent $node_(6) $null16
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

#???17???(Ping)
set ping_a(17) [new Agent/Ping]
$ns attach-agent $node_(5) $ping_a(17)
set ping_b(17) [new Agent/Ping]
$ns attach-agent $node_(6) $ping_b(17)
$ns connect $ping_a(17) $ping_b(17)	;#????Ping Agents
$ns at 1.0 "$ping_a(17) send"	;#??Ping???

#???18???(FTP-TCP)
set tcp18 [new Agent/TCP/Newreno]
$tcp18 set class_ 2
set sink18 [new Agent/TCPSink]
$ns attach-agent $node_(6) $tcp18
$ns attach-agent $node_(7) $sink18
$ns connect $tcp18 $sink18
set ftp18 [new Application/FTP]
$ftp18 attach-agent $tcp18
$ns at 1.0 "$ftp18 start"
$ns at 2.0 "$ftp18 stop"

#???19???(FTP-TCP)
set tcp19 [new Agent/TCP/Newreno]
$tcp19 set class_ 2
set sink19 [new Agent/TCPSink]
$ns attach-agent $node_(7) $tcp19
$ns attach-agent $node_(8) $sink19
$ns connect $tcp19 $sink19
set ftp19 [new Application/FTP]
$ftp19 attach-agent $tcp19
$ns at 1.0 "$ftp19 start"
$ns at 2.0 "$ftp19 stop"

#???20???(FTP-TCP)
set tcp20 [new Agent/TCP/Newreno]
$tcp20 set class_ 2
set sink20 [new Agent/TCPSink]
$ns attach-agent $node_(8) $tcp20
$ns attach-agent $node_(9) $sink20
$ns connect $tcp20 $sink20
set ftp20 [new Application/FTP]
$ftp20 attach-agent $tcp20
$ns at 1.0 "$ftp20 start"
$ns at 2.0 "$ftp20 stop"

#???21???(CBR-UDP)
set udp21 [new Agent/UDP]
$ns attach-agent $node_(6) $udp21
set null21 [new Agent/Null]
$ns attach-agent $node_(7) $null21
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

#???22???(CBR-UDP)
set udp22 [new Agent/UDP]
$ns attach-agent $node_(7) $udp22
set null22 [new Agent/Null]
$ns attach-agent $node_(8) $null22
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
$ns attach-agent $node_(8) $udp23
set null23 [new Agent/Null]
$ns attach-agent $node_(9) $null23
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
$ns attach-agent $node_(6) $ping_a(24)
set ping_b(24) [new Agent/Ping]
$ns attach-agent $node_(7) $ping_b(24)
$ns connect $ping_a(24) $ping_b(24)	;#????Ping Agents
$ns at 1.0 "$ping_a(24) send"	;#??Ping???

#???25???(Ping)
set ping_a(25) [new Agent/Ping]
$ns attach-agent $node_(8) $ping_a(25)
set ping_b(25) [new Agent/Ping]
$ns attach-agent $node_(9) $ping_b(25)
$ns connect $ping_a(25) $ping_b(25)	;#????Ping Agents
$ns at 1.0 "$ping_a(25) send"	;#??Ping???

#???26???(FTP-TCP)
set tcp26 [new Agent/TCP/Newreno]
$tcp26 set class_ 2
set sink26 [new Agent/TCPSink]
$ns attach-agent $node_(9) $tcp26
$ns attach-agent $node_(10) $sink26
$ns connect $tcp26 $sink26
set ftp26 [new Application/FTP]
$ftp26 attach-agent $tcp26
$ns at 1.0 "$ftp26 start"
$ns at 2.0 "$ftp26 stop"

#???27???(CBR-UDP)
set udp27 [new Agent/UDP]
$ns attach-agent $node_(9) $udp27
set null27 [new Agent/Null]
$ns attach-agent $node_(10) $null27
$ns connect $udp27 $null27
$udp27 set fid_ 2	;#?NAM??UDP?????????
set cbr27 [new Application/Traffic/CBR]	;#?UDP??????CBR????
$cbr27 attach-agent $udp27
$cbr27 set type_ CBR
$cbr27 set packet_size_ 1000;#??????
$cbr27 set rate_ 512Kb ;#??????
$cbr27 set random_ false
$ns at 1.0 "$cbr27 start"
$ns at 2.0 "$cbr27 stop"

#???28???(Ping)
set ping_a(28) [new Agent/Ping]
$ns attach-agent $node_(9) $ping_a(28)
set ping_b(28) [new Agent/Ping]
$ns attach-agent $node_(10) $ping_b(28)
$ns connect $ping_a(28) $ping_b(28)	;#????Ping Agents
$ns at 1.0 "$ping_a(28) send"	;#??Ping???

#???29???(FTP-TCP)
set tcp29 [new Agent/TCP/Newreno]
$tcp29 set class_ 2
set sink29 [new Agent/TCPSink]
$ns attach-agent $node_(10) $tcp29
$ns attach-agent $node_(11) $sink29
$ns connect $tcp29 $sink29
set ftp29 [new Application/FTP]
$ftp29 attach-agent $tcp29
$ns at 1.0 "$ftp29 start"
$ns at 2.0 "$ftp29 stop"

#???30???(CBR-UDP)
set udp30 [new Agent/UDP]
$ns attach-agent $node_(10) $udp30
set null30 [new Agent/Null]
$ns attach-agent $node_(11) $null30
$ns connect $udp30 $null30
$udp30 set fid_ 2	;#?NAM??UDP?????????
set cbr30 [new Application/Traffic/CBR]	;#?UDP??????CBR????
$cbr30 attach-agent $udp30
$cbr30 set type_ CBR
$cbr30 set packet_size_ 1000;#??????
$cbr30 set rate_ 512Kb ;#??????
$cbr30 set random_ false
$ns at 1.0 "$cbr30 start"
$ns at 2.0 "$cbr30 stop"

#???31???(Ping)
set ping_a(31) [new Agent/Ping]
$ns attach-agent $node_(10) $ping_a(31)
set ping_b(31) [new Agent/Ping]
$ns attach-agent $node_(11) $ping_b(31)
$ns connect $ping_a(31) $ping_b(31)	;#????Ping Agents
$ns at 1.0 "$ping_a(31) send"	;#??Ping???

#???32???(FTP-TCP)
set tcp32 [new Agent/TCP/Newreno]
$tcp32 set class_ 2
set sink32 [new Agent/TCPSink]
$ns attach-agent $node_(11) $tcp32
$ns attach-agent $node_(12) $sink32
$ns connect $tcp32 $sink32
set ftp32 [new Application/FTP]
$ftp32 attach-agent $tcp32
$ns at 1.0 "$ftp32 start"
$ns at 2.0 "$ftp32 stop"

#???33???(FTP-TCP)
set tcp33 [new Agent/TCP/Newreno]
$tcp33 set class_ 2
set sink33 [new Agent/TCPSink]
$ns attach-agent $node_(12) $tcp33
$ns attach-agent $node_(13) $sink33
$ns connect $tcp33 $sink33
set ftp33 [new Application/FTP]
$ftp33 attach-agent $tcp33
$ns at 1.0 "$ftp33 start"
$ns at 2.0 "$ftp33 stop"

#???34???(FTP-TCP)
set tcp34 [new Agent/TCP/Newreno]
$tcp34 set class_ 2
set sink34 [new Agent/TCPSink]
$ns attach-agent $node_(13) $tcp34
$ns attach-agent $node_(14) $sink34
$ns connect $tcp34 $sink34
set ftp34 [new Application/FTP]
$ftp34 attach-agent $tcp34
$ns at 1.0 "$ftp34 start"
$ns at 2.0 "$ftp34 stop"

#???35???(CBR-UDP)
set udp35 [new Agent/UDP]
$ns attach-agent $node_(11) $udp35
set null35 [new Agent/Null]
$ns attach-agent $node_(12) $null35
$ns connect $udp35 $null35
$udp35 set fid_ 2	;#?NAM??UDP?????????
set cbr35 [new Application/Traffic/CBR]	;#?UDP??????CBR????
$cbr35 attach-agent $udp35
$cbr35 set type_ CBR
$cbr35 set packet_size_ 1000;#??????
$cbr35 set rate_ 512Kb ;#??????
$cbr35 set random_ false
$ns at 1.0 "$cbr35 start"
$ns at 2.0 "$cbr35 stop"

#???36???(CBR-UDP)
set udp36 [new Agent/UDP]
$ns attach-agent $node_(12) $udp36
set null36 [new Agent/Null]
$ns attach-agent $node_(13) $null36
$ns connect $udp36 $null36
$udp36 set fid_ 2	;#?NAM??UDP?????????
set cbr36 [new Application/Traffic/CBR]	;#?UDP??????CBR????
$cbr36 attach-agent $udp36
$cbr36 set type_ CBR
$cbr36 set packet_size_ 1000;#??????
$cbr36 set rate_ 512Kb ;#??????
$cbr36 set random_ false
$ns at 1.0 "$cbr36 start"
$ns at 2.0 "$cbr36 stop"

#???37???(CBR-UDP)
set udp37 [new Agent/UDP]
$ns attach-agent $node_(13) $udp37
set null37 [new Agent/Null]
$ns attach-agent $node_(14) $null37
$ns connect $udp37 $null37
$udp37 set fid_ 2	;#?NAM??UDP?????????
set cbr37 [new Application/Traffic/CBR]	;#?UDP??????CBR????
$cbr37 attach-agent $udp37
$cbr37 set type_ CBR
$cbr37 set packet_size_ 1000;#??????
$cbr37 set rate_ 512Kb ;#??????
$cbr37 set random_ false
$ns at 1.0 "$cbr37 start"
$ns at 2.0 "$cbr37 stop"

#???38???(Ping)
set ping_a(38) [new Agent/Ping]
$ns attach-agent $node_(11) $ping_a(38)
set ping_b(38) [new Agent/Ping]
$ns attach-agent $node_(12) $ping_b(38)
$ns connect $ping_a(38) $ping_b(38)	;#????Ping Agents
$ns at 1.0 "$ping_a(38) send"	;#??Ping???

#???39???(Ping)
set ping_a(39) [new Agent/Ping]
$ns attach-agent $node_(12) $ping_a(39)
set ping_b(39) [new Agent/Ping]
$ns attach-agent $node_(13) $ping_b(39)
$ns connect $ping_a(39) $ping_b(39)	;#????Ping Agents
$ns at 1.0 "$ping_a(39) send"	;#??Ping???

#???40???(Ping)
set ping_a(40) [new Agent/Ping]
$ns attach-agent $node_(13) $ping_a(40)
set ping_b(40) [new Agent/Ping]
$ns attach-agent $node_(14) $ping_b(40)
$ns connect $ping_a(40) $ping_b(40)	;#????Ping Agents
$ns at 1.0 "$ping_a(40) send"	;#??Ping???

#???41???(FTP-TCP)
set tcp41 [new Agent/TCP/Newreno]
$tcp41 set class_ 2
set sink41 [new Agent/TCPSink]
$ns attach-agent $node_(14) $tcp41
$ns attach-agent $node_(15) $sink41
$ns connect $tcp41 $sink41
set ftp41 [new Application/FTP]
$ftp41 attach-agent $tcp41
$ns at 1.0 "$ftp41 start"
$ns at 2.0 "$ftp41 stop"

#???42???(FTP-TCP)
set tcp42 [new Agent/TCP/Newreno]
$tcp42 set class_ 2
set sink42 [new Agent/TCPSink]
$ns attach-agent $node_(15) $tcp42
$ns attach-agent $node_(16) $sink42
$ns connect $tcp42 $sink42
set ftp42 [new Application/FTP]
$ftp42 attach-agent $tcp42
$ns at 1.0 "$ftp42 start"
$ns at 2.0 "$ftp42 stop"

#???43???(FTP-TCP)
set tcp43 [new Agent/TCP/Newreno]
$tcp43 set class_ 2
set sink43 [new Agent/TCPSink]
$ns attach-agent $node_(16) $tcp43
$ns attach-agent $node_(17) $sink43
$ns connect $tcp43 $sink43
set ftp43 [new Application/FTP]
$ftp43 attach-agent $tcp43
$ns at 1.0 "$ftp43 start"
$ns at 2.0 "$ftp43 stop"

#???44???(CBR-UDP)
set udp44 [new Agent/UDP]
$ns attach-agent $node_(14) $udp44
set null44 [new Agent/Null]
$ns attach-agent $node_(15) $null44
$ns connect $udp44 $null44
$udp44 set fid_ 2	;#?NAM??UDP?????????
set cbr44 [new Application/Traffic/CBR]	;#?UDP??????CBR????
$cbr44 attach-agent $udp44
$cbr44 set type_ CBR
$cbr44 set packet_size_ 1000;#??????
$cbr44 set rate_ 512Kb ;#??????
$cbr44 set random_ false
$ns at 1.0 "$cbr44 start"
$ns at 2.0 "$cbr44 stop"

#???45???(CBR-UDP)
set udp45 [new Agent/UDP]
$ns attach-agent $node_(15) $udp45
set null45 [new Agent/Null]
$ns attach-agent $node_(16) $null45
$ns connect $udp45 $null45
$udp45 set fid_ 2	;#?NAM??UDP?????????
set cbr45 [new Application/Traffic/CBR]	;#?UDP??????CBR????
$cbr45 attach-agent $udp45
$cbr45 set type_ CBR
$cbr45 set packet_size_ 1000;#??????
$cbr45 set rate_ 512Kb ;#??????
$cbr45 set random_ false
$ns at 1.0 "$cbr45 start"
$ns at 2.0 "$cbr45 stop"

#???46???(CBR-UDP)
set udp46 [new Agent/UDP]
$ns attach-agent $node_(16) $udp46
set null46 [new Agent/Null]
$ns attach-agent $node_(17) $null46
$ns connect $udp46 $null46
$udp46 set fid_ 2	;#?NAM??UDP?????????
set cbr46 [new Application/Traffic/CBR]	;#?UDP??????CBR????
$cbr46 attach-agent $udp46
$cbr46 set type_ CBR
$cbr46 set packet_size_ 1000;#??????
$cbr46 set rate_ 512Kb ;#??????
$cbr46 set random_ false
$ns at 1.0 "$cbr46 start"
$ns at 2.0 "$cbr46 stop"

#???47???(Ping)
set ping_a(47) [new Agent/Ping]
$ns attach-agent $node_(14) $ping_a(47)
set ping_b(47) [new Agent/Ping]
$ns attach-agent $node_(15) $ping_b(47)
$ns connect $ping_a(47) $ping_b(47)	;#????Ping Agents
$ns at 1.0 "$ping_a(47) send"	;#??Ping???

#???48???(Ping)
set ping_a(48) [new Agent/Ping]
$ns attach-agent $node_(15) $ping_a(48)
set ping_b(48) [new Agent/Ping]
$ns attach-agent $node_(16) $ping_b(48)
$ns connect $ping_a(48) $ping_b(48)	;#????Ping Agents
$ns at 1.0 "$ping_a(48) send"	;#??Ping???

#???49???(Ping)
set ping_a(49) [new Agent/Ping]
$ns attach-agent $node_(16) $ping_a(49)
set ping_b(49) [new Agent/Ping]
$ns attach-agent $node_(17) $ping_b(49)
$ns connect $ping_a(49) $ping_b(49)	;#????Ping Agents
$ns at 1.0 "$ping_a(49) send"	;#??Ping???

#???50???(FTP-TCP)
set tcp50 [new Agent/TCP/Newreno]
$tcp50 set class_ 2
set sink50 [new Agent/TCPSink]
$ns attach-agent $node_(17) $tcp50
$ns attach-agent $node_(18) $sink50
$ns connect $tcp50 $sink50
set ftp50 [new Application/FTP]
$ftp50 attach-agent $tcp50
$ns at 1.0 "$ftp50 start"
$ns at 2.0 "$ftp50 stop"

#???51???(FTP-TCP)
set tcp51 [new Agent/TCP/Newreno]
$tcp51 set class_ 2
set sink51 [new Agent/TCPSink]
$ns attach-agent $node_(18) $tcp51
$ns attach-agent $node_(19) $sink51
$ns connect $tcp51 $sink51
set ftp51 [new Application/FTP]
$ftp51 attach-agent $tcp51
$ns at 1.0 "$ftp51 start"
$ns at 2.0 "$ftp51 stop"

#???52???(FTP-TCP)
set tcp52 [new Agent/TCP/Newreno]
$tcp52 set class_ 2
set sink52 [new Agent/TCPSink]
$ns attach-agent $node_(19) $tcp52
$ns attach-agent $node_(20) $sink52
$ns connect $tcp52 $sink52
set ftp52 [new Application/FTP]
$ftp52 attach-agent $tcp52
$ns at 1.0 "$ftp52 start"
$ns at 2.0 "$ftp52 stop"

#???53???(FTP-TCP)
set tcp53 [new Agent/TCP/Newreno]
$tcp53 set class_ 2
set sink53 [new Agent/TCPSink]
$ns attach-agent $node_(20) $tcp53
$ns attach-agent $node_(21) $sink53
$ns connect $tcp53 $sink53
set ftp53 [new Application/FTP]
$ftp53 attach-agent $tcp53
$ns at 1.0 "$ftp53 start"
$ns at 2.0 "$ftp53 stop"

#???54???(CBR-UDP)
set udp54 [new Agent/UDP]
$ns attach-agent $node_(21) $udp54
set null54 [new Agent/Null]
$ns attach-agent $node_(18) $null54
$ns connect $udp54 $null54
$udp54 set fid_ 2	;#?NAM??UDP?????????
set cbr54 [new Application/Traffic/CBR]	;#?UDP??????CBR????
$cbr54 attach-agent $udp54
$cbr54 set type_ CBR
$cbr54 set packet_size_ 1000;#??????
$cbr54 set rate_ 512Kb ;#??????
$cbr54 set random_ false
$ns at 1.0 "$cbr54 start"
$ns at 2.0 "$cbr54 stop"

#???55???(CBR-UDP)
set udp55 [new Agent/UDP]
$ns attach-agent $node_(18) $udp55
set null55 [new Agent/Null]
$ns attach-agent $node_(19) $null55
$ns connect $udp55 $null55
$udp55 set fid_ 2	;#?NAM??UDP?????????
set cbr55 [new Application/Traffic/CBR]	;#?UDP??????CBR????
$cbr55 attach-agent $udp55
$cbr55 set type_ CBR
$cbr55 set packet_size_ 1000;#??????
$cbr55 set rate_ 512Kb ;#??????
$cbr55 set random_ false
$ns at 1.0 "$cbr55 start"
$ns at 2.0 "$cbr55 stop"

#???56???(CBR-UDP)
set udp56 [new Agent/UDP]
$ns attach-agent $node_(19) $udp56
set null56 [new Agent/Null]
$ns attach-agent $node_(20) $null56
$ns connect $udp56 $null56
$udp56 set fid_ 2	;#?NAM??UDP?????????
set cbr56 [new Application/Traffic/CBR]	;#?UDP??????CBR????
$cbr56 attach-agent $udp56
$cbr56 set type_ CBR
$cbr56 set packet_size_ 1000;#??????
$cbr56 set rate_ 512Kb ;#??????
$cbr56 set random_ false
$ns at 1.0 "$cbr56 start"
$ns at 2.0 "$cbr56 stop"

#???57???(CBR-UDP)
set udp57 [new Agent/UDP]
$ns attach-agent $node_(20) $udp57
set null57 [new Agent/Null]
$ns attach-agent $node_(21) $null57
$ns connect $udp57 $null57
$udp57 set fid_ 2	;#?NAM??UDP?????????
set cbr57 [new Application/Traffic/CBR]	;#?UDP??????CBR????
$cbr57 attach-agent $udp57
$cbr57 set type_ CBR
$cbr57 set packet_size_ 1000;#??????
$cbr57 set rate_ 512Kb ;#??????
$cbr57 set random_ false
$ns at 1.0 "$cbr57 start"
$ns at 2.0 "$cbr57 stop"

#???58???(Ping)
set ping_a(58) [new Agent/Ping]
$ns attach-agent $node_(21) $ping_a(58)
set ping_b(58) [new Agent/Ping]
$ns attach-agent $node_(18) $ping_b(58)
$ns connect $ping_a(58) $ping_b(58)	;#????Ping Agents
$ns at 1.0 "$ping_a(58) send"	;#??Ping???

#???59???(Ping)
set ping_a(59) [new Agent/Ping]
$ns attach-agent $node_(18) $ping_a(59)
set ping_b(59) [new Agent/Ping]
$ns attach-agent $node_(19) $ping_b(59)
$ns connect $ping_a(59) $ping_b(59)	;#????Ping Agents
$ns at 1.0 "$ping_a(59) send"	;#??Ping???

#???60???(Ping)
set ping_a(60) [new Agent/Ping]
$ns attach-agent $node_(19) $ping_a(60)
set ping_b(60) [new Agent/Ping]
$ns attach-agent $node_(20) $ping_b(60)
$ns connect $ping_a(60) $ping_b(60)	;#????Ping Agents
$ns at 1.0 "$ping_a(60) send"	;#??Ping???

#???61???(Ping)
set ping_a(61) [new Agent/Ping]
$ns attach-agent $node_(20) $ping_a(61)
set ping_b(61) [new Agent/Ping]
$ns attach-agent $node_(21) $ping_b(61)
$ns connect $ping_a(61) $ping_b(61)	;#????Ping Agents
$ns at 1.0 "$ping_a(61) send"	;#??Ping???

#???62???(CBR-UDP)
set udp62 [new Agent/UDP]
$ns attach-agent $node_(17) $udp62
set null62 [new Agent/Null]
$ns attach-agent $node_(18) $null62
$ns connect $udp62 $null62
$udp62 set fid_ 2	;#?NAM??UDP?????????
set cbr62 [new Application/Traffic/CBR]	;#?UDP??????CBR????
$cbr62 attach-agent $udp62
$cbr62 set type_ CBR
$cbr62 set packet_size_ 1000;#??????
$cbr62 set rate_ 512Kb ;#??????
$cbr62 set random_ false
$ns at 1.0 "$cbr62 start"
$ns at 2.0 "$cbr62 stop"

#???63???(Ping)
set ping_a(63) [new Agent/Ping]
$ns attach-agent $node_(17) $ping_a(63)
set ping_b(63) [new Agent/Ping]
$ns attach-agent $node_(18) $ping_b(63)
$ns connect $ping_a(63) $ping_b(63)	;#????Ping Agents
$ns at 1.0 "$ping_a(63) send"	;#??Ping???

#???64???(FTP-TCP)
set tcp64 [new Agent/TCP/Newreno]
$tcp64 set class_ 2
set sink64 [new Agent/TCPSink]
$ns attach-agent $node_(21) $tcp64
$ns attach-agent $node_(22) $sink64
$ns connect $tcp64 $sink64
set ftp64 [new Application/FTP]
$ftp64 attach-agent $tcp64
$ns at 1.0 "$ftp64 start"
$ns at 2.0 "$ftp64 stop"

#???65???(FTP-TCP)
set tcp65 [new Agent/TCP/Newreno]
$tcp65 set class_ 2
set sink65 [new Agent/TCPSink]
$ns attach-agent $node_(22) $tcp65
$ns attach-agent $node_(23) $sink65
$ns connect $tcp65 $sink65
set ftp65 [new Application/FTP]
$ftp65 attach-agent $tcp65
$ns at 1.0 "$ftp65 start"
$ns at 2.0 "$ftp65 stop"

#???66???(FTP-TCP)
set tcp66 [new Agent/TCP/Newreno]
$tcp66 set class_ 2
set sink66 [new Agent/TCPSink]
$ns attach-agent $node_(23) $tcp66
$ns attach-agent $node_(24) $sink66
$ns connect $tcp66 $sink66
set ftp66 [new Application/FTP]
$ftp66 attach-agent $tcp66
$ns at 1.0 "$ftp66 start"
$ns at 2.0 "$ftp66 stop"

#???67???(FTP-TCP)
set tcp67 [new Agent/TCP/Newreno]
$tcp67 set class_ 2
set sink67 [new Agent/TCPSink]
$ns attach-agent $node_(24) $tcp67
$ns attach-agent $node_(25) $sink67
$ns connect $tcp67 $sink67
set ftp67 [new Application/FTP]
$ftp67 attach-agent $tcp67
$ns at 1.0 "$ftp67 start"
$ns at 2.0 "$ftp67 stop"

#???68???(FTP-TCP)
set tcp68 [new Agent/TCP/Newreno]
$tcp68 set class_ 2
set sink68 [new Agent/TCPSink]
$ns attach-agent $node_(20) $tcp68
$ns attach-agent $node_(21) $sink68
$ns connect $tcp68 $sink68
set ftp68 [new Application/FTP]
$ftp68 attach-agent $tcp68
$ns at 1.0 "$ftp68 start"
$ns at 2.0 "$ftp68 stop"

#???69???(CBR-UDP)
set udp69 [new Agent/UDP]
$ns attach-agent $node_(20) $udp69
set null69 [new Agent/Null]
$ns attach-agent $node_(21) $null69
$ns connect $udp69 $null69
$udp69 set fid_ 2	;#?NAM??UDP?????????
set cbr69 [new Application/Traffic/CBR]	;#?UDP??????CBR????
$cbr69 attach-agent $udp69
$cbr69 set type_ CBR
$cbr69 set packet_size_ 1000;#??????
$cbr69 set rate_ 512Kb ;#??????
$cbr69 set random_ false
$ns at 1.0 "$cbr69 start"
$ns at 2.0 "$cbr69 stop"

#???70???(CBR-UDP)
set udp70 [new Agent/UDP]
$ns attach-agent $node_(21) $udp70
set null70 [new Agent/Null]
$ns attach-agent $node_(22) $null70
$ns connect $udp70 $null70
$udp70 set fid_ 2	;#?NAM??UDP?????????
set cbr70 [new Application/Traffic/CBR]	;#?UDP??????CBR????
$cbr70 attach-agent $udp70
$cbr70 set type_ CBR
$cbr70 set packet_size_ 1000;#??????
$cbr70 set rate_ 512Kb ;#??????
$cbr70 set random_ false
$ns at 1.0 "$cbr70 start"
$ns at 2.0 "$cbr70 stop"

#???71???(CBR-UDP)
set udp71 [new Agent/UDP]
$ns attach-agent $node_(22) $udp71
set null71 [new Agent/Null]
$ns attach-agent $node_(23) $null71
$ns connect $udp71 $null71
$udp71 set fid_ 2	;#?NAM??UDP?????????
set cbr71 [new Application/Traffic/CBR]	;#?UDP??????CBR????
$cbr71 attach-agent $udp71
$cbr71 set type_ CBR
$cbr71 set packet_size_ 1000;#??????
$cbr71 set rate_ 512Kb ;#??????
$cbr71 set random_ false
$ns at 1.0 "$cbr71 start"
$ns at 2.0 "$cbr71 stop"

#???72???(CBR-UDP)
set udp72 [new Agent/UDP]
$ns attach-agent $node_(23) $udp72
set null72 [new Agent/Null]
$ns attach-agent $node_(24) $null72
$ns connect $udp72 $null72
$udp72 set fid_ 2	;#?NAM??UDP?????????
set cbr72 [new Application/Traffic/CBR]	;#?UDP??????CBR????
$cbr72 attach-agent $udp72
$cbr72 set type_ CBR
$cbr72 set packet_size_ 1000;#??????
$cbr72 set rate_ 512Kb ;#??????
$cbr72 set random_ false
$ns at 1.0 "$cbr72 start"
$ns at 2.0 "$cbr72 stop"

#???73???(CBR-UDP)
set udp73 [new Agent/UDP]
$ns attach-agent $node_(24) $udp73
set null73 [new Agent/Null]
$ns attach-agent $node_(25) $null73
$ns connect $udp73 $null73
$udp73 set fid_ 2	;#?NAM??UDP?????????
set cbr73 [new Application/Traffic/CBR]	;#?UDP??????CBR????
$cbr73 attach-agent $udp73
$cbr73 set type_ CBR
$cbr73 set packet_size_ 1000;#??????
$cbr73 set rate_ 512Kb ;#??????
$cbr73 set random_ false
$ns at 1.0 "$cbr73 start"
$ns at 2.0 "$cbr73 stop"

#???74???(Ping)
set ping_a(74) [new Agent/Ping]
$ns attach-agent $node_(20) $ping_a(74)
set ping_b(74) [new Agent/Ping]
$ns attach-agent $node_(21) $ping_b(74)
$ns connect $ping_a(74) $ping_b(74)	;#????Ping Agents
$ns at 1.0 "$ping_a(74) send"	;#??Ping???

#???75???(Ping)
set ping_a(75) [new Agent/Ping]
$ns attach-agent $node_(21) $ping_a(75)
set ping_b(75) [new Agent/Ping]
$ns attach-agent $node_(22) $ping_b(75)
$ns connect $ping_a(75) $ping_b(75)	;#????Ping Agents
$ns at 1.0 "$ping_a(75) send"	;#??Ping???

#???76???(Ping)
set ping_a(76) [new Agent/Ping]
$ns attach-agent $node_(22) $ping_a(76)
set ping_b(76) [new Agent/Ping]
$ns attach-agent $node_(23) $ping_b(76)
$ns connect $ping_a(76) $ping_b(76)	;#????Ping Agents
$ns at 1.0 "$ping_a(76) send"	;#??Ping???

#???77???(Ping)
set ping_a(77) [new Agent/Ping]
$ns attach-agent $node_(23) $ping_a(77)
set ping_b(77) [new Agent/Ping]
$ns attach-agent $node_(24) $ping_b(77)
$ns connect $ping_a(77) $ping_b(77)	;#????Ping Agents
$ns at 1.0 "$ping_a(77) send"	;#??Ping???

#???78???(Ping)
set ping_a(78) [new Agent/Ping]
$ns attach-agent $node_(24) $ping_a(78)
set ping_b(78) [new Agent/Ping]
$ns attach-agent $node_(25) $ping_b(78)
$ns connect $ping_a(78) $ping_b(78)	;#????Ping Agents
$ns at 1.0 "$ping_a(78) send"	;#??Ping???

#???79???(FTP-TCP)
set tcp79 [new Agent/TCP/Newreno]
$tcp79 set class_ 2
set sink79 [new Agent/TCPSink]
$ns attach-agent $node_(25) $tcp79
$ns attach-agent $node_(26) $sink79
$ns connect $tcp79 $sink79
set ftp79 [new Application/FTP]
$ftp79 attach-agent $tcp79
$ns at 1.0 "$ftp79 start"
$ns at 2.0 "$ftp79 stop"

#???80???(FTP-TCP)
set tcp80 [new Agent/TCP/Newreno]
$tcp80 set class_ 2
set sink80 [new Agent/TCPSink]
$ns attach-agent $node_(26) $tcp80
$ns attach-agent $node_(27) $sink80
$ns connect $tcp80 $sink80
set ftp80 [new Application/FTP]
$ftp80 attach-agent $tcp80
$ns at 1.0 "$ftp80 start"
$ns at 2.0 "$ftp80 stop"

#???81???(FTP-TCP)
set tcp81 [new Agent/TCP/Newreno]
$tcp81 set class_ 2
set sink81 [new Agent/TCPSink]
$ns attach-agent $node_(27) $tcp81
$ns attach-agent $node_(28) $sink81
$ns connect $tcp81 $sink81
set ftp81 [new Application/FTP]
$ftp81 attach-agent $tcp81
$ns at 1.0 "$ftp81 start"
$ns at 2.0 "$ftp81 stop"

#???82???(FTP-TCP)
set tcp82 [new Agent/TCP/Newreno]
$tcp82 set class_ 2
set sink82 [new Agent/TCPSink]
$ns attach-agent $node_(28) $tcp82
$ns attach-agent $node_(29) $sink82
$ns connect $tcp82 $sink82
set ftp82 [new Application/FTP]
$ftp82 attach-agent $tcp82
$ns at 1.0 "$ftp82 start"
$ns at 2.0 "$ftp82 stop"

#???83???(FTP-TCP)
set tcp83 [new Agent/TCP/Newreno]
$tcp83 set class_ 2
set sink83 [new Agent/TCPSink]
$ns attach-agent $node_(29) $tcp83
$ns attach-agent $node_(30) $sink83
$ns connect $tcp83 $sink83
set ftp83 [new Application/FTP]
$ftp83 attach-agent $tcp83
$ns at 1.0 "$ftp83 start"
$ns at 2.0 "$ftp83 stop"

#???84???(CBR-UDP)
set udp84 [new Agent/UDP]
$ns attach-agent $node_(30) $udp84
set null84 [new Agent/Null]
$ns attach-agent $node_(25) $null84
$ns connect $udp84 $null84
$udp84 set fid_ 2	;#?NAM??UDP?????????
set cbr84 [new Application/Traffic/CBR]	;#?UDP??????CBR????
$cbr84 attach-agent $udp84
$cbr84 set type_ CBR
$cbr84 set packet_size_ 1000;#??????
$cbr84 set rate_ 512Kb ;#??????
$cbr84 set random_ false
$ns at 1.0 "$cbr84 start"
$ns at 2.0 "$cbr84 stop"

#???85???(CBR-UDP)
set udp85 [new Agent/UDP]
$ns attach-agent $node_(25) $udp85
set null85 [new Agent/Null]
$ns attach-agent $node_(26) $null85
$ns connect $udp85 $null85
$udp85 set fid_ 2	;#?NAM??UDP?????????
set cbr85 [new Application/Traffic/CBR]	;#?UDP??????CBR????
$cbr85 attach-agent $udp85
$cbr85 set type_ CBR
$cbr85 set packet_size_ 1000;#??????
$cbr85 set rate_ 512Kb ;#??????
$cbr85 set random_ false
$ns at 1.0 "$cbr85 start"
$ns at 2.0 "$cbr85 stop"

#???86???(CBR-UDP)
set udp86 [new Agent/UDP]
$ns attach-agent $node_(26) $udp86
set null86 [new Agent/Null]
$ns attach-agent $node_(27) $null86
$ns connect $udp86 $null86
$udp86 set fid_ 2	;#?NAM??UDP?????????
set cbr86 [new Application/Traffic/CBR]	;#?UDP??????CBR????
$cbr86 attach-agent $udp86
$cbr86 set type_ CBR
$cbr86 set packet_size_ 1000;#??????
$cbr86 set rate_ 512Kb ;#??????
$cbr86 set random_ false
$ns at 1.0 "$cbr86 start"
$ns at 2.0 "$cbr86 stop"

#???87???(CBR-UDP)
set udp87 [new Agent/UDP]
$ns attach-agent $node_(27) $udp87
set null87 [new Agent/Null]
$ns attach-agent $node_(28) $null87
$ns connect $udp87 $null87
$udp87 set fid_ 2	;#?NAM??UDP?????????
set cbr87 [new Application/Traffic/CBR]	;#?UDP??????CBR????
$cbr87 attach-agent $udp87
$cbr87 set type_ CBR
$cbr87 set packet_size_ 1000;#??????
$cbr87 set rate_ 512Kb ;#??????
$cbr87 set random_ false
$ns at 1.0 "$cbr87 start"
$ns at 2.0 "$cbr87 stop"

#???88???(CBR-UDP)
set udp88 [new Agent/UDP]
$ns attach-agent $node_(28) $udp88
set null88 [new Agent/Null]
$ns attach-agent $node_(29) $null88
$ns connect $udp88 $null88
$udp88 set fid_ 2	;#?NAM??UDP?????????
set cbr88 [new Application/Traffic/CBR]	;#?UDP??????CBR????
$cbr88 attach-agent $udp88
$cbr88 set type_ CBR
$cbr88 set packet_size_ 1000;#??????
$cbr88 set rate_ 512Kb ;#??????
$cbr88 set random_ false
$ns at 1.0 "$cbr88 start"
$ns at 2.0 "$cbr88 stop"

#???89???(CBR-UDP)
set udp89 [new Agent/UDP]
$ns attach-agent $node_(29) $udp89
set null89 [new Agent/Null]
$ns attach-agent $node_(30) $null89
$ns connect $udp89 $null89
$udp89 set fid_ 2	;#?NAM??UDP?????????
set cbr89 [new Application/Traffic/CBR]	;#?UDP??????CBR????
$cbr89 attach-agent $udp89
$cbr89 set type_ CBR
$cbr89 set packet_size_ 1000;#??????
$cbr89 set rate_ 512Kb ;#??????
$cbr89 set random_ false
$ns at 1.0 "$cbr89 start"
$ns at 2.0 "$cbr89 stop"

#???90???(Ping)
set ping_a(90) [new Agent/Ping]
$ns attach-agent $node_(25) $ping_a(90)
set ping_b(90) [new Agent/Ping]
$ns attach-agent $node_(24) $ping_b(90)
$ns connect $ping_a(90) $ping_b(90)	;#????Ping Agents
$ns at 1.0 "$ping_a(90) send"	;#??Ping???

#???91???(Ping)
set ping_a(91) [new Agent/Ping]
$ns attach-agent $node_(25) $ping_a(91)
set ping_b(91) [new Agent/Ping]
$ns attach-agent $node_(26) $ping_b(91)
$ns connect $ping_a(91) $ping_b(91)	;#????Ping Agents
$ns at 1.0 "$ping_a(91) send"	;#??Ping???

#???92???(Ping)
set ping_a(92) [new Agent/Ping]
$ns attach-agent $node_(26) $ping_a(92)
set ping_b(92) [new Agent/Ping]
$ns attach-agent $node_(27) $ping_b(92)
$ns connect $ping_a(92) $ping_b(92)	;#????Ping Agents
$ns at 1.0 "$ping_a(92) send"	;#??Ping???

#???93???(Ping)
set ping_a(93) [new Agent/Ping]
$ns attach-agent $node_(27) $ping_a(93)
set ping_b(93) [new Agent/Ping]
$ns attach-agent $node_(28) $ping_b(93)
$ns connect $ping_a(93) $ping_b(93)	;#????Ping Agents
$ns at 1.0 "$ping_a(93) send"	;#??Ping???

#???94???(Ping)
set ping_a(94) [new Agent/Ping]
$ns attach-agent $node_(28) $ping_a(94)
set ping_b(94) [new Agent/Ping]
$ns attach-agent $node_(29) $ping_b(94)
$ns connect $ping_a(94) $ping_b(94)	;#????Ping Agents
$ns at 1.0 "$ping_a(94) send"	;#??Ping???

#???95???(Ping)
set ping_a(95) [new Agent/Ping]
$ns attach-agent $node_(29) $ping_a(95)
set ping_b(95) [new Agent/Ping]
$ns attach-agent $node_(30) $ping_b(95)
$ns connect $ping_a(95) $ping_b(95)	;#????Ping Agents
$ns at 1.0 "$ping_a(95) send"	;#??Ping???

#???96???(Ping)
set ping_a(96) [new Agent/Ping]
$ns attach-agent $node_(9) $ping_a(96)
set ping_b(96) [new Agent/Ping]
$ns attach-agent $node_(21) $ping_b(96)
$ns connect $ping_a(96) $ping_b(96)	;#????Ping Agents
$ns at 1.0 "$ping_a(96) send"	;#??Ping???

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
