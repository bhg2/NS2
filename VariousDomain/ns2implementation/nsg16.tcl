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
set val(nn)     40        ;# number of mobilenodes
set val(rp)     AODV     ;# routing protocol
set val(x)      1000            ;# X dimension of topography
set val(y)      1000           ;# Y dimension of topography
set val(stop)   10.0 ;# time of simulation end

#===================================
#               ??????                         
#===================================

#??trace file
set ns            [new Simulator]	;#??ns simulator
set tracefd       [open mac_802_11_node_40_ftp_37_cbr_39_ping_39.tr w]	;#??trace file
set namtrace       [open mac_802_11_node_40_ftp_37_cbr_39_ping_39.nam w]	;#????nam trace file

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
$node_(0) set X_ 64
$node_(0) set Y_ 1038
$node_(0) set Z_ 0.0
$ns initial_node_pos $node_(0) 20

#???1?Node
set node_(1) [$ns node]
$node_(1) set X_ 262
$node_(1) set Y_ 1050
$node_(1) set Z_ 0.0
$ns initial_node_pos $node_(1) 20

#???2?Node
set node_(2) [$ns node]
$node_(2) set X_ 456
$node_(2) set Y_ 1052
$node_(2) set Z_ 0.0
$ns initial_node_pos $node_(2) 20

#???3?Node
set node_(3) [$ns node]
$node_(3) set X_ 688
$node_(3) set Y_ 1054
$node_(3) set Z_ 0.0
$ns initial_node_pos $node_(3) 20

#???4?Node
set node_(4) [$ns node]
$node_(4) set X_ 890
$node_(4) set Y_ 1066
$node_(4) set Z_ 0.0
$ns initial_node_pos $node_(4) 20

#???5?Node
set node_(5) [$ns node]
$node_(5) set X_ 1078
$node_(5) set Y_ 1062
$node_(5) set Z_ 0.0
$ns initial_node_pos $node_(5) 20

#???6?Node
set node_(6) [$ns node]
$node_(6) set X_ 1322
$node_(6) set Y_ 1046
$node_(6) set Z_ 0.0
$ns initial_node_pos $node_(6) 20

#???7?Node
set node_(7) [$ns node]
$node_(7) set X_ 1534
$node_(7) set Y_ 1042
$node_(7) set Z_ 0.0
$ns initial_node_pos $node_(7) 20

#???8?Node
set node_(8) [$ns node]
$node_(8) set X_ 1764
$node_(8) set Y_ 1048
$node_(8) set Z_ 0.0
$ns initial_node_pos $node_(8) 20

#???9?Node
set node_(9) [$ns node]
$node_(9) set X_ 1962
$node_(9) set Y_ 1044
$node_(9) set Z_ 0.0
$ns initial_node_pos $node_(9) 20

#???10?Node
set node_(10) [$ns node]
$node_(10) set X_ 2082
$node_(10) set Y_ 1050
$node_(10) set Z_ 0.0
$ns initial_node_pos $node_(10) 20

#???11?Node
set node_(11) [$ns node]
$node_(11) set X_ 130
$node_(11) set Y_ 726
$node_(11) set Z_ 0.0
$ns initial_node_pos $node_(11) 20

#???12?Node
set node_(12) [$ns node]
$node_(12) set X_ 316
$node_(12) set Y_ 730
$node_(12) set Z_ 0.0
$ns initial_node_pos $node_(12) 20

#???13?Node
set node_(13) [$ns node]
$node_(13) set X_ 466
$node_(13) set Y_ 726
$node_(13) set Z_ 0.0
$ns initial_node_pos $node_(13) 20

#???14?Node
set node_(14) [$ns node]
$node_(14) set X_ 658
$node_(14) set Y_ 718
$node_(14) set Z_ 0.0
$ns initial_node_pos $node_(14) 20

#???15?Node
set node_(15) [$ns node]
$node_(15) set X_ 826
$node_(15) set Y_ 724
$node_(15) set Z_ 0.0
$ns initial_node_pos $node_(15) 20

#???16?Node
set node_(16) [$ns node]
$node_(16) set X_ 932
$node_(16) set Y_ 726
$node_(16) set Z_ 0.0
$ns initial_node_pos $node_(16) 20

#???17?Node
set node_(17) [$ns node]
$node_(17) set X_ 1072
$node_(17) set Y_ 716
$node_(17) set Z_ 0.0
$ns initial_node_pos $node_(17) 20

#???18?Node
set node_(18) [$ns node]
$node_(18) set X_ 1234
$node_(18) set Y_ 724
$node_(18) set Z_ 0.0
$ns initial_node_pos $node_(18) 20

#???19?Node
set node_(19) [$ns node]
$node_(19) set X_ 1376
$node_(19) set Y_ 728
$node_(19) set Z_ 0.0
$ns initial_node_pos $node_(19) 20

#???20?Node
set node_(20) [$ns node]
$node_(20) set X_ 1546
$node_(20) set Y_ 728
$node_(20) set Z_ 0.0
$ns initial_node_pos $node_(20) 20

#???21?Node
set node_(21) [$ns node]
$node_(21) set X_ 1684
$node_(21) set Y_ 728
$node_(21) set Z_ 0.0
$ns initial_node_pos $node_(21) 20

#???22?Node
set node_(22) [$ns node]
$node_(22) set X_ 1820
$node_(22) set Y_ 718
$node_(22) set Z_ 0.0
$ns initial_node_pos $node_(22) 20

#???23?Node
set node_(23) [$ns node]
$node_(23) set X_ 1960
$node_(23) set Y_ 706
$node_(23) set Z_ 0.0
$ns initial_node_pos $node_(23) 20

#???24?Node
set node_(24) [$ns node]
$node_(24) set X_ 2064
$node_(24) set Y_ 728
$node_(24) set Z_ 0.0
$ns initial_node_pos $node_(24) 20

#???25?Node
set node_(27) [$ns node]
$node_(27) set X_ 170
$node_(27) set Y_ 338
$node_(27) set Z_ 0.0
$ns initial_node_pos $node_(27) 20

#???26?Node
set node_(29) [$ns node]
$node_(29) set X_ 348
$node_(29) set Y_ 340
$node_(29) set Z_ 0.0
$ns initial_node_pos $node_(29) 20

#???27?Node
set node_(30) [$ns node]
$node_(30) set X_ 522
$node_(30) set Y_ 346
$node_(30) set Z_ 0.0
$ns initial_node_pos $node_(30) 20

#???28?Node
set node_(31) [$ns node]
$node_(31) set X_ 618
$node_(31) set Y_ 348
$node_(31) set Z_ 0.0
$ns initial_node_pos $node_(31) 20

#???29?Node
set node_(32) [$ns node]
$node_(32) set X_ 776
$node_(32) set Y_ 350
$node_(32) set Z_ 0.0
$ns initial_node_pos $node_(32) 20

#???30?Node
set node_(33) [$ns node]
$node_(33) set X_ 908
$node_(33) set Y_ 350
$node_(33) set Z_ 0.0
$ns initial_node_pos $node_(33) 20

#???31?Node
set node_(34) [$ns node]
$node_(34) set X_ 1006
$node_(34) set Y_ 350
$node_(34) set Z_ 0.0
$ns initial_node_pos $node_(34) 20

#???32?Node
set node_(35) [$ns node]
$node_(35) set X_ 1138
$node_(35) set Y_ 348
$node_(35) set Z_ 0.0
$ns initial_node_pos $node_(35) 20

#???33?Node
set node_(36) [$ns node]
$node_(36) set X_ 1242
$node_(36) set Y_ 352
$node_(36) set Z_ 0.0
$ns initial_node_pos $node_(36) 20

#???34?Node
set node_(37) [$ns node]
$node_(37) set X_ 1378
$node_(37) set Y_ 348
$node_(37) set Z_ 0.0
$ns initial_node_pos $node_(37) 20

#???35?Node
set node_(38) [$ns node]
$node_(38) set X_ 1504
$node_(38) set Y_ 352
$node_(38) set Z_ 0.0
$ns initial_node_pos $node_(38) 20

#???36?Node
set node_(39) [$ns node]
$node_(39) set X_ 1636
$node_(39) set Y_ 352
$node_(39) set Z_ 0.0
$ns initial_node_pos $node_(39) 20

#???37?Node
set node_(40) [$ns node]
$node_(40) set X_ 1770
$node_(40) set Y_ 352
$node_(40) set Z_ 0.0
$ns initial_node_pos $node_(40) 20

#???38?Node
set node_(41) [$ns node]
$node_(41) set X_ 1948
$node_(41) set Y_ 352
$node_(41) set Z_ 0.0
$ns initial_node_pos $node_(41) 20

#???39?Node
set node_(42) [$ns node]
$node_(42) set X_ 2064
$node_(42) set Y_ 366
$node_(42) set Z_ 0.0
$ns initial_node_pos $node_(42) 20

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
$ns attach-agent $node_(4) $ping_a(11)
set ping_b(11) [new Agent/Ping]
$ns attach-agent $node_(5) $ping_b(11)
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

#???19???(CBR-UDP)
set udp19 [new Agent/UDP]
$ns attach-agent $node_(6) $udp19
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

#???20???(Ping)
set ping_a(20) [new Agent/Ping]
$ns attach-agent $node_(6) $ping_a(20)
set ping_b(20) [new Agent/Ping]
$ns attach-agent $node_(7) $ping_b(20)
$ns connect $ping_a(20) $ping_b(20)	;#????Ping Agents
$ns at 1.0 "$ping_a(20) send"	;#??Ping???

#???21???(FTP-TCP)
set tcp21 [new Agent/TCP/Newreno]
$tcp21 set class_ 2
set sink21 [new Agent/TCPSink]
$ns attach-agent $node_(7) $tcp21
$ns attach-agent $node_(8) $sink21
$ns connect $tcp21 $sink21
set ftp21 [new Application/FTP]
$ftp21 attach-agent $tcp21
$ns at 1.0 "$ftp21 start"
$ns at 2.0 "$ftp21 stop"

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

#???23???(Ping)
set ping_a(23) [new Agent/Ping]
$ns attach-agent $node_(7) $ping_a(23)
set ping_b(23) [new Agent/Ping]
$ns attach-agent $node_(8) $ping_b(23)
$ns connect $ping_a(23) $ping_b(23)	;#????Ping Agents
$ns at 1.0 "$ping_a(23) send"	;#??Ping???

#???24???(FTP-TCP)
set tcp24 [new Agent/TCP/Newreno]
$tcp24 set class_ 2
set sink24 [new Agent/TCPSink]
$ns attach-agent $node_(8) $tcp24
$ns attach-agent $node_(9) $sink24
$ns connect $tcp24 $sink24
set ftp24 [new Application/FTP]
$ftp24 attach-agent $tcp24
$ns at 1.0 "$ftp24 start"
$ns at 2.0 "$ftp24 stop"

#???25???(CBR-UDP)
set udp25 [new Agent/UDP]
$ns attach-agent $node_(8) $udp25
set null25 [new Agent/Null]
$ns attach-agent $node_(9) $null25
$ns connect $udp25 $null25
$udp25 set fid_ 2	;#?NAM??UDP?????????
set cbr25 [new Application/Traffic/CBR]	;#?UDP??????CBR????
$cbr25 attach-agent $udp25
$cbr25 set type_ CBR
$cbr25 set packet_size_ 1000;#??????
$cbr25 set rate_ 512Kb ;#??????
$cbr25 set random_ false
$ns at 1.0 "$cbr25 start"
$ns at 2.0 "$cbr25 stop"

#???26???(Ping)
set ping_a(26) [new Agent/Ping]
$ns attach-agent $node_(8) $ping_a(26)
set ping_b(26) [new Agent/Ping]
$ns attach-agent $node_(9) $ping_b(26)
$ns connect $ping_a(26) $ping_b(26)	;#????Ping Agents
$ns at 1.0 "$ping_a(26) send"	;#??Ping???

#???27???(FTP-TCP)
set tcp27 [new Agent/TCP/Newreno]
$tcp27 set class_ 2
set sink27 [new Agent/TCPSink]
$ns attach-agent $node_(9) $tcp27
$ns attach-agent $node_(10) $sink27
$ns connect $tcp27 $sink27
set ftp27 [new Application/FTP]
$ftp27 attach-agent $tcp27
$ns at 1.0 "$ftp27 start"
$ns at 2.0 "$ftp27 stop"

#???28???(CBR-UDP)
set udp28 [new Agent/UDP]
$ns attach-agent $node_(9) $udp28
set null28 [new Agent/Null]
$ns attach-agent $node_(10) $null28
$ns connect $udp28 $null28
$udp28 set fid_ 2	;#?NAM??UDP?????????
set cbr28 [new Application/Traffic/CBR]	;#?UDP??????CBR????
$cbr28 attach-agent $udp28
$cbr28 set type_ CBR
$cbr28 set packet_size_ 1000;#??????
$cbr28 set rate_ 512Kb ;#??????
$cbr28 set random_ false
$ns at 1.0 "$cbr28 start"
$ns at 2.0 "$cbr28 stop"

#???29???(Ping)
set ping_a(29) [new Agent/Ping]
$ns attach-agent $node_(9) $ping_a(29)
set ping_b(29) [new Agent/Ping]
$ns attach-agent $node_(10) $ping_b(29)
$ns connect $ping_a(29) $ping_b(29)	;#????Ping Agents
$ns at 1.0 "$ping_a(29) send"	;#??Ping???

#???30???(FTP-TCP)
set tcp30 [new Agent/TCP/Newreno]
$tcp30 set class_ 2
set sink30 [new Agent/TCPSink]
$ns attach-agent $node_(11) $tcp30
$ns attach-agent $node_(12) $sink30
$ns connect $tcp30 $sink30
set ftp30 [new Application/FTP]
$ftp30 attach-agent $tcp30
$ns at 1.0 "$ftp30 start"
$ns at 2.0 "$ftp30 stop"

#???31???(FTP-TCP)
set tcp31 [new Agent/TCP/Newreno]
$tcp31 set class_ 2
set sink31 [new Agent/TCPSink]
$ns attach-agent $node_(12) $tcp31
$ns attach-agent $node_(13) $sink31
$ns connect $tcp31 $sink31
set ftp31 [new Application/FTP]
$ftp31 attach-agent $tcp31
$ns at 1.0 "$ftp31 start"
$ns at 2.0 "$ftp31 stop"

#???32???(FTP-TCP)
set tcp32 [new Agent/TCP/Newreno]
$tcp32 set class_ 2
set sink32 [new Agent/TCPSink]
$ns attach-agent $node_(13) $tcp32
$ns attach-agent $node_(14) $sink32
$ns connect $tcp32 $sink32
set ftp32 [new Application/FTP]
$ftp32 attach-agent $tcp32
$ns at 1.0 "$ftp32 start"
$ns at 2.0 "$ftp32 stop"

#???33???(FTP-TCP)
set tcp33 [new Agent/TCP/Newreno]
$tcp33 set class_ 2
set sink33 [new Agent/TCPSink]
$ns attach-agent $node_(14) $tcp33
$ns attach-agent $node_(15) $sink33
$ns connect $tcp33 $sink33
set ftp33 [new Application/FTP]
$ftp33 attach-agent $tcp33
$ns at 1.0 "$ftp33 start"
$ns at 2.0 "$ftp33 stop"

#???34???(FTP-TCP)
set tcp34 [new Agent/TCP/Newreno]
$tcp34 set class_ 2
set sink34 [new Agent/TCPSink]
$ns attach-agent $node_(15) $tcp34
$ns attach-agent $node_(16) $sink34
$ns connect $tcp34 $sink34
set ftp34 [new Application/FTP]
$ftp34 attach-agent $tcp34
$ns at 1.0 "$ftp34 start"
$ns at 2.0 "$ftp34 stop"

#???35???(FTP-TCP)
set tcp35 [new Agent/TCP/Newreno]
$tcp35 set class_ 2
set sink35 [new Agent/TCPSink]
$ns attach-agent $node_(16) $tcp35
$ns attach-agent $node_(17) $sink35
$ns connect $tcp35 $sink35
set ftp35 [new Application/FTP]
$ftp35 attach-agent $tcp35
$ns at 1.0 "$ftp35 start"
$ns at 2.0 "$ftp35 stop"

#???36???(FTP-TCP)
set tcp36 [new Agent/TCP/Newreno]
$tcp36 set class_ 2
set sink36 [new Agent/TCPSink]
$ns attach-agent $node_(17) $tcp36
$ns attach-agent $node_(18) $sink36
$ns connect $tcp36 $sink36
set ftp36 [new Application/FTP]
$ftp36 attach-agent $tcp36
$ns at 1.0 "$ftp36 start"
$ns at 2.0 "$ftp36 stop"

#???37???(FTP-TCP)
set tcp37 [new Agent/TCP/Newreno]
$tcp37 set class_ 2
set sink37 [new Agent/TCPSink]
$ns attach-agent $node_(18) $tcp37
$ns attach-agent $node_(19) $sink37
$ns connect $tcp37 $sink37
set ftp37 [new Application/FTP]
$ftp37 attach-agent $tcp37
$ns at 1.0 "$ftp37 start"
$ns at 2.0 "$ftp37 stop"

#???38???(FTP-TCP)
set tcp38 [new Agent/TCP/Newreno]
$tcp38 set class_ 2
set sink38 [new Agent/TCPSink]
$ns attach-agent $node_(19) $tcp38
$ns attach-agent $node_(20) $sink38
$ns connect $tcp38 $sink38
set ftp38 [new Application/FTP]
$ftp38 attach-agent $tcp38
$ns at 1.0 "$ftp38 start"
$ns at 2.0 "$ftp38 stop"

#???39???(FTP-TCP)
set tcp39 [new Agent/TCP/Newreno]
$tcp39 set class_ 2
set sink39 [new Agent/TCPSink]
$ns attach-agent $node_(20) $tcp39
$ns attach-agent $node_(21) $sink39
$ns connect $tcp39 $sink39
set ftp39 [new Application/FTP]
$ftp39 attach-agent $tcp39
$ns at 1.0 "$ftp39 start"
$ns at 2.0 "$ftp39 stop"

#???40???(FTP-TCP)
set tcp40 [new Agent/TCP/Newreno]
$tcp40 set class_ 2
set sink40 [new Agent/TCPSink]
$ns attach-agent $node_(21) $tcp40
$ns attach-agent $node_(22) $sink40
$ns connect $tcp40 $sink40
set ftp40 [new Application/FTP]
$ftp40 attach-agent $tcp40
$ns at 1.0 "$ftp40 start"
$ns at 2.0 "$ftp40 stop"

#???41???(FTP-TCP)
set tcp41 [new Agent/TCP/Newreno]
$tcp41 set class_ 2
set sink41 [new Agent/TCPSink]
$ns attach-agent $node_(22) $tcp41
$ns attach-agent $node_(23) $sink41
$ns connect $tcp41 $sink41
set ftp41 [new Application/FTP]
$ftp41 attach-agent $tcp41
$ns at 1.0 "$ftp41 start"
$ns at 2.0 "$ftp41 stop"

#???42???(FTP-TCP)
set tcp42 [new Agent/TCP/Newreno]
$tcp42 set class_ 2
set sink42 [new Agent/TCPSink]
$ns attach-agent $node_(23) $tcp42
$ns attach-agent $node_(24) $sink42
$ns connect $tcp42 $sink42
set ftp42 [new Application/FTP]
$ftp42 attach-agent $tcp42
$ns at 1.0 "$ftp42 start"
$ns at 2.0 "$ftp42 stop"

#???43???(CBR-UDP)
set udp43 [new Agent/UDP]
$ns attach-agent $node_(24) $udp43
set null43 [new Agent/Null]
$ns attach-agent $node_(11) $null43
$ns connect $udp43 $null43
$udp43 set fid_ 2	;#?NAM??UDP?????????
set cbr43 [new Application/Traffic/CBR]	;#?UDP??????CBR????
$cbr43 attach-agent $udp43
$cbr43 set type_ CBR
$cbr43 set packet_size_ 1000;#??????
$cbr43 set rate_ 512Kb ;#??????
$cbr43 set random_ false
$ns at 1.0 "$cbr43 start"
$ns at 2.0 "$cbr43 stop"

#???44???(CBR-UDP)
set udp44 [new Agent/UDP]
$ns attach-agent $node_(11) $udp44
set null44 [new Agent/Null]
$ns attach-agent $node_(12) $null44
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
$ns attach-agent $node_(12) $udp45
set null45 [new Agent/Null]
$ns attach-agent $node_(13) $null45
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
$ns attach-agent $node_(13) $udp46
set null46 [new Agent/Null]
$ns attach-agent $node_(14) $null46
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

#???47???(CBR-UDP)
set udp47 [new Agent/UDP]
$ns attach-agent $node_(14) $udp47
set null47 [new Agent/Null]
$ns attach-agent $node_(15) $null47
$ns connect $udp47 $null47
$udp47 set fid_ 2	;#?NAM??UDP?????????
set cbr47 [new Application/Traffic/CBR]	;#?UDP??????CBR????
$cbr47 attach-agent $udp47
$cbr47 set type_ CBR
$cbr47 set packet_size_ 1000;#??????
$cbr47 set rate_ 512Kb ;#??????
$cbr47 set random_ false
$ns at 1.0 "$cbr47 start"
$ns at 2.0 "$cbr47 stop"

#???48???(CBR-UDP)
set udp48 [new Agent/UDP]
$ns attach-agent $node_(15) $udp48
set null48 [new Agent/Null]
$ns attach-agent $node_(16) $null48
$ns connect $udp48 $null48
$udp48 set fid_ 2	;#?NAM??UDP?????????
set cbr48 [new Application/Traffic/CBR]	;#?UDP??????CBR????
$cbr48 attach-agent $udp48
$cbr48 set type_ CBR
$cbr48 set packet_size_ 1000;#??????
$cbr48 set rate_ 512Kb ;#??????
$cbr48 set random_ false
$ns at 1.0 "$cbr48 start"
$ns at 2.0 "$cbr48 stop"

#???49???(CBR-UDP)
set udp49 [new Agent/UDP]
$ns attach-agent $node_(16) $udp49
set null49 [new Agent/Null]
$ns attach-agent $node_(17) $null49
$ns connect $udp49 $null49
$udp49 set fid_ 2	;#?NAM??UDP?????????
set cbr49 [new Application/Traffic/CBR]	;#?UDP??????CBR????
$cbr49 attach-agent $udp49
$cbr49 set type_ CBR
$cbr49 set packet_size_ 1000;#??????
$cbr49 set rate_ 512Kb ;#??????
$cbr49 set random_ false
$ns at 1.0 "$cbr49 start"
$ns at 2.0 "$cbr49 stop"

#???50???(CBR-UDP)
set udp50 [new Agent/UDP]
$ns attach-agent $node_(17) $udp50
set null50 [new Agent/Null]
$ns attach-agent $node_(18) $null50
$ns connect $udp50 $null50
$udp50 set fid_ 2	;#?NAM??UDP?????????
set cbr50 [new Application/Traffic/CBR]	;#?UDP??????CBR????
$cbr50 attach-agent $udp50
$cbr50 set type_ CBR
$cbr50 set packet_size_ 1000;#??????
$cbr50 set rate_ 512Kb ;#??????
$cbr50 set random_ false
$ns at 1.0 "$cbr50 start"
$ns at 2.0 "$cbr50 stop"

#???51???(CBR-UDP)
set udp51 [new Agent/UDP]
$ns attach-agent $node_(18) $udp51
set null51 [new Agent/Null]
$ns attach-agent $node_(19) $null51
$ns connect $udp51 $null51
$udp51 set fid_ 2	;#?NAM??UDP?????????
set cbr51 [new Application/Traffic/CBR]	;#?UDP??????CBR????
$cbr51 attach-agent $udp51
$cbr51 set type_ CBR
$cbr51 set packet_size_ 1000;#??????
$cbr51 set rate_ 512Kb ;#??????
$cbr51 set random_ false
$ns at 1.0 "$cbr51 start"
$ns at 2.0 "$cbr51 stop"

#???52???(CBR-UDP)
set udp52 [new Agent/UDP]
$ns attach-agent $node_(19) $udp52
set null52 [new Agent/Null]
$ns attach-agent $node_(20) $null52
$ns connect $udp52 $null52
$udp52 set fid_ 2	;#?NAM??UDP?????????
set cbr52 [new Application/Traffic/CBR]	;#?UDP??????CBR????
$cbr52 attach-agent $udp52
$cbr52 set type_ CBR
$cbr52 set packet_size_ 1000;#??????
$cbr52 set rate_ 512Kb ;#??????
$cbr52 set random_ false
$ns at 1.0 "$cbr52 start"
$ns at 2.0 "$cbr52 stop"

#???53???(CBR-UDP)
set udp53 [new Agent/UDP]
$ns attach-agent $node_(20) $udp53
set null53 [new Agent/Null]
$ns attach-agent $node_(21) $null53
$ns connect $udp53 $null53
$udp53 set fid_ 2	;#?NAM??UDP?????????
set cbr53 [new Application/Traffic/CBR]	;#?UDP??????CBR????
$cbr53 attach-agent $udp53
$cbr53 set type_ CBR
$cbr53 set packet_size_ 1000;#??????
$cbr53 set rate_ 512Kb ;#??????
$cbr53 set random_ false
$ns at 1.0 "$cbr53 start"
$ns at 2.0 "$cbr53 stop"

#???54???(CBR-UDP)
set udp54 [new Agent/UDP]
$ns attach-agent $node_(21) $udp54
set null54 [new Agent/Null]
$ns attach-agent $node_(22) $null54
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
$ns attach-agent $node_(22) $udp55
set null55 [new Agent/Null]
$ns attach-agent $node_(23) $null55
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
$ns attach-agent $node_(23) $udp56
set null56 [new Agent/Null]
$ns attach-agent $node_(24) $null56
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

#???57???(Ping)
set ping_a(57) [new Agent/Ping]
$ns attach-agent $node_(24) $ping_a(57)
set ping_b(57) [new Agent/Ping]
$ns attach-agent $node_(11) $ping_b(57)
$ns connect $ping_a(57) $ping_b(57)	;#????Ping Agents
$ns at 1.0 "$ping_a(57) send"	;#??Ping???

#???58???(Ping)
set ping_a(58) [new Agent/Ping]
$ns attach-agent $node_(11) $ping_a(58)
set ping_b(58) [new Agent/Ping]
$ns attach-agent $node_(12) $ping_b(58)
$ns connect $ping_a(58) $ping_b(58)	;#????Ping Agents
$ns at 1.0 "$ping_a(58) send"	;#??Ping???

#???59???(Ping)
set ping_a(59) [new Agent/Ping]
$ns attach-agent $node_(12) $ping_a(59)
set ping_b(59) [new Agent/Ping]
$ns attach-agent $node_(13) $ping_b(59)
$ns connect $ping_a(59) $ping_b(59)	;#????Ping Agents
$ns at 1.0 "$ping_a(59) send"	;#??Ping???

#???60???(Ping)
set ping_a(60) [new Agent/Ping]
$ns attach-agent $node_(13) $ping_a(60)
set ping_b(60) [new Agent/Ping]
$ns attach-agent $node_(14) $ping_b(60)
$ns connect $ping_a(60) $ping_b(60)	;#????Ping Agents
$ns at 1.0 "$ping_a(60) send"	;#??Ping???

#???61???(Ping)
set ping_a(61) [new Agent/Ping]
$ns attach-agent $node_(14) $ping_a(61)
set ping_b(61) [new Agent/Ping]
$ns attach-agent $node_(15) $ping_b(61)
$ns connect $ping_a(61) $ping_b(61)	;#????Ping Agents
$ns at 1.0 "$ping_a(61) send"	;#??Ping???

#???62???(Ping)
set ping_a(62) [new Agent/Ping]
$ns attach-agent $node_(15) $ping_a(62)
set ping_b(62) [new Agent/Ping]
$ns attach-agent $node_(16) $ping_b(62)
$ns connect $ping_a(62) $ping_b(62)	;#????Ping Agents
$ns at 1.0 "$ping_a(62) send"	;#??Ping???

#???63???(Ping)
set ping_a(63) [new Agent/Ping]
$ns attach-agent $node_(16) $ping_a(63)
set ping_b(63) [new Agent/Ping]
$ns attach-agent $node_(17) $ping_b(63)
$ns connect $ping_a(63) $ping_b(63)	;#????Ping Agents
$ns at 1.0 "$ping_a(63) send"	;#??Ping???

#???64???(Ping)
set ping_a(64) [new Agent/Ping]
$ns attach-agent $node_(17) $ping_a(64)
set ping_b(64) [new Agent/Ping]
$ns attach-agent $node_(18) $ping_b(64)
$ns connect $ping_a(64) $ping_b(64)	;#????Ping Agents
$ns at 1.0 "$ping_a(64) send"	;#??Ping???

#???65???(Ping)
set ping_a(65) [new Agent/Ping]
$ns attach-agent $node_(18) $ping_a(65)
set ping_b(65) [new Agent/Ping]
$ns attach-agent $node_(19) $ping_b(65)
$ns connect $ping_a(65) $ping_b(65)	;#????Ping Agents
$ns at 1.0 "$ping_a(65) send"	;#??Ping???

#???66???(Ping)
set ping_a(66) [new Agent/Ping]
$ns attach-agent $node_(19) $ping_a(66)
set ping_b(66) [new Agent/Ping]
$ns attach-agent $node_(20) $ping_b(66)
$ns connect $ping_a(66) $ping_b(66)	;#????Ping Agents
$ns at 1.0 "$ping_a(66) send"	;#??Ping???

#???67???(Ping)
set ping_a(67) [new Agent/Ping]
$ns attach-agent $node_(20) $ping_a(67)
set ping_b(67) [new Agent/Ping]
$ns attach-agent $node_(21) $ping_b(67)
$ns connect $ping_a(67) $ping_b(67)	;#????Ping Agents
$ns at 1.0 "$ping_a(67) send"	;#??Ping???

#???68???(Ping)
set ping_a(68) [new Agent/Ping]
$ns attach-agent $node_(21) $ping_a(68)
set ping_b(68) [new Agent/Ping]
$ns attach-agent $node_(22) $ping_b(68)
$ns connect $ping_a(68) $ping_b(68)	;#????Ping Agents
$ns at 1.0 "$ping_a(68) send"	;#??Ping???

#???69???(Ping)
set ping_a(69) [new Agent/Ping]
$ns attach-agent $node_(22) $ping_a(69)
set ping_b(69) [new Agent/Ping]
$ns attach-agent $node_(23) $ping_b(69)
$ns connect $ping_a(69) $ping_b(69)	;#????Ping Agents
$ns at 1.0 "$ping_a(69) send"	;#??Ping???

#???70???(Ping)
set ping_a(70) [new Agent/Ping]
$ns attach-agent $node_(23) $ping_a(70)
set ping_b(70) [new Agent/Ping]
$ns attach-agent $node_(24) $ping_b(70)
$ns connect $ping_a(70) $ping_b(70)	;#????Ping Agents
$ns at 1.0 "$ping_a(70) send"	;#??Ping???

#???71???(FTP-TCP)
set tcp71 [new Agent/TCP/Newreno]
$tcp71 set class_ 2
set sink71 [new Agent/TCPSink]
$ns attach-agent $node_(27) $tcp71
$ns attach-agent $node_(29) $sink71
$ns connect $tcp71 $sink71
set ftp71 [new Application/FTP]
$ftp71 attach-agent $tcp71
$ns at 1.0 "$ftp71 start"
$ns at 2.0 "$ftp71 stop"

#???72???(FTP-TCP)
set tcp72 [new Agent/TCP/Newreno]
$tcp72 set class_ 2
set sink72 [new Agent/TCPSink]
$ns attach-agent $node_(29) $tcp72
$ns attach-agent $node_(30) $sink72
$ns connect $tcp72 $sink72
set ftp72 [new Application/FTP]
$ftp72 attach-agent $tcp72
$ns at 1.0 "$ftp72 start"
$ns at 2.0 "$ftp72 stop"

#???73???(FTP-TCP)
set tcp73 [new Agent/TCP/Newreno]
$tcp73 set class_ 2
set sink73 [new Agent/TCPSink]
$ns attach-agent $node_(30) $tcp73
$ns attach-agent $node_(31) $sink73
$ns connect $tcp73 $sink73
set ftp73 [new Application/FTP]
$ftp73 attach-agent $tcp73
$ns at 1.0 "$ftp73 start"
$ns at 2.0 "$ftp73 stop"

#???74???(FTP-TCP)
set tcp74 [new Agent/TCP/Newreno]
$tcp74 set class_ 2
set sink74 [new Agent/TCPSink]
$ns attach-agent $node_(31) $tcp74
$ns attach-agent $node_(32) $sink74
$ns connect $tcp74 $sink74
set ftp74 [new Application/FTP]
$ftp74 attach-agent $tcp74
$ns at 1.0 "$ftp74 start"
$ns at 2.0 "$ftp74 stop"

#???75???(FTP-TCP)
set tcp75 [new Agent/TCP/Newreno]
$tcp75 set class_ 2
set sink75 [new Agent/TCPSink]
$ns attach-agent $node_(32) $tcp75
$ns attach-agent $node_(33) $sink75
$ns connect $tcp75 $sink75
set ftp75 [new Application/FTP]
$ftp75 attach-agent $tcp75
$ns at 1.0 "$ftp75 start"
$ns at 2.0 "$ftp75 stop"

#???76???(FTP-TCP)
set tcp76 [new Agent/TCP/Newreno]
$tcp76 set class_ 2
set sink76 [new Agent/TCPSink]
$ns attach-agent $node_(33) $tcp76
$ns attach-agent $node_(34) $sink76
$ns connect $tcp76 $sink76
set ftp76 [new Application/FTP]
$ftp76 attach-agent $tcp76
$ns at 1.0 "$ftp76 start"
$ns at 2.0 "$ftp76 stop"

#???77???(FTP-TCP)
set tcp77 [new Agent/TCP/Newreno]
$tcp77 set class_ 2
set sink77 [new Agent/TCPSink]
$ns attach-agent $node_(34) $tcp77
$ns attach-agent $node_(35) $sink77
$ns connect $tcp77 $sink77
set ftp77 [new Application/FTP]
$ftp77 attach-agent $tcp77
$ns at 1.0 "$ftp77 start"
$ns at 2.0 "$ftp77 stop"

#???78???(FTP-TCP)
set tcp78 [new Agent/TCP/Newreno]
$tcp78 set class_ 2
set sink78 [new Agent/TCPSink]
$ns attach-agent $node_(35) $tcp78
$ns attach-agent $node_(36) $sink78
$ns connect $tcp78 $sink78
set ftp78 [new Application/FTP]
$ftp78 attach-agent $tcp78
$ns at 1.0 "$ftp78 start"
$ns at 2.0 "$ftp78 stop"

#???79???(FTP-TCP)
set tcp79 [new Agent/TCP/Newreno]
$tcp79 set class_ 2
set sink79 [new Agent/TCPSink]
$ns attach-agent $node_(36) $tcp79
$ns attach-agent $node_(37) $sink79
$ns connect $tcp79 $sink79
set ftp79 [new Application/FTP]
$ftp79 attach-agent $tcp79
$ns at 1.0 "$ftp79 start"
$ns at 2.0 "$ftp79 stop"

#???80???(FTP-TCP)
set tcp80 [new Agent/TCP/Newreno]
$tcp80 set class_ 2
set sink80 [new Agent/TCPSink]
$ns attach-agent $node_(37) $tcp80
$ns attach-agent $node_(38) $sink80
$ns connect $tcp80 $sink80
set ftp80 [new Application/FTP]
$ftp80 attach-agent $tcp80
$ns at 1.0 "$ftp80 start"
$ns at 2.0 "$ftp80 stop"

#???81???(FTP-TCP)
set tcp81 [new Agent/TCP/Newreno]
$tcp81 set class_ 2
set sink81 [new Agent/TCPSink]
$ns attach-agent $node_(38) $tcp81
$ns attach-agent $node_(39) $sink81
$ns connect $tcp81 $sink81
set ftp81 [new Application/FTP]
$ftp81 attach-agent $tcp81
$ns at 1.0 "$ftp81 start"
$ns at 2.0 "$ftp81 stop"

#???82???(FTP-TCP)
set tcp82 [new Agent/TCP/Newreno]
$tcp82 set class_ 2
set sink82 [new Agent/TCPSink]
$ns attach-agent $node_(39) $tcp82
$ns attach-agent $node_(40) $sink82
$ns connect $tcp82 $sink82
set ftp82 [new Application/FTP]
$ftp82 attach-agent $tcp82
$ns at 1.0 "$ftp82 start"
$ns at 2.0 "$ftp82 stop"

#???83???(FTP-TCP)
set tcp83 [new Agent/TCP/Newreno]
$tcp83 set class_ 2
set sink83 [new Agent/TCPSink]
$ns attach-agent $node_(40) $tcp83
$ns attach-agent $node_(41) $sink83
$ns connect $tcp83 $sink83
set ftp83 [new Application/FTP]
$ftp83 attach-agent $tcp83
$ns at 1.0 "$ftp83 start"
$ns at 2.0 "$ftp83 stop"

#???84???(FTP-TCP)
set tcp84 [new Agent/TCP/Newreno]
$tcp84 set class_ 2
set sink84 [new Agent/TCPSink]
$ns attach-agent $node_(41) $tcp84
$ns attach-agent $node_(42) $sink84
$ns connect $tcp84 $sink84
set ftp84 [new Application/FTP]
$ftp84 attach-agent $tcp84
$ns at 1.0 "$ftp84 start"
$ns at 2.0 "$ftp84 stop"

#???85???(CBR-UDP)
set udp85 [new Agent/UDP]
$ns attach-agent $node_(42) $udp85
set null85 [new Agent/Null]
$ns attach-agent $node_(27) $null85
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
$ns attach-agent $node_(27) $udp86
set null86 [new Agent/Null]
$ns attach-agent $node_(29) $null86
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
$ns attach-agent $node_(29) $udp87
set null87 [new Agent/Null]
$ns attach-agent $node_(30) $null87
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
$ns attach-agent $node_(30) $udp88
set null88 [new Agent/Null]
$ns attach-agent $node_(31) $null88
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
$ns attach-agent $node_(31) $udp89
set null89 [new Agent/Null]
$ns attach-agent $node_(32) $null89
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

#???90???(CBR-UDP)
set udp90 [new Agent/UDP]
$ns attach-agent $node_(32) $udp90
set null90 [new Agent/Null]
$ns attach-agent $node_(33) $null90
$ns connect $udp90 $null90
$udp90 set fid_ 2	;#?NAM??UDP?????????
set cbr90 [new Application/Traffic/CBR]	;#?UDP??????CBR????
$cbr90 attach-agent $udp90
$cbr90 set type_ CBR
$cbr90 set packet_size_ 1000;#??????
$cbr90 set rate_ 512Kb ;#??????
$cbr90 set random_ false
$ns at 1.0 "$cbr90 start"
$ns at 2.0 "$cbr90 stop"

#???91???(CBR-UDP)
set udp91 [new Agent/UDP]
$ns attach-agent $node_(33) $udp91
set null91 [new Agent/Null]
$ns attach-agent $node_(34) $null91
$ns connect $udp91 $null91
$udp91 set fid_ 2	;#?NAM??UDP?????????
set cbr91 [new Application/Traffic/CBR]	;#?UDP??????CBR????
$cbr91 attach-agent $udp91
$cbr91 set type_ CBR
$cbr91 set packet_size_ 1000;#??????
$cbr91 set rate_ 512Kb ;#??????
$cbr91 set random_ false
$ns at 1.0 "$cbr91 start"
$ns at 2.0 "$cbr91 stop"

#???92???(CBR-UDP)
set udp92 [new Agent/UDP]
$ns attach-agent $node_(34) $udp92
set null92 [new Agent/Null]
$ns attach-agent $node_(35) $null92
$ns connect $udp92 $null92
$udp92 set fid_ 2	;#?NAM??UDP?????????
set cbr92 [new Application/Traffic/CBR]	;#?UDP??????CBR????
$cbr92 attach-agent $udp92
$cbr92 set type_ CBR
$cbr92 set packet_size_ 1000;#??????
$cbr92 set rate_ 512Kb ;#??????
$cbr92 set random_ false
$ns at 1.0 "$cbr92 start"
$ns at 2.0 "$cbr92 stop"

#???93???(CBR-UDP)
set udp93 [new Agent/UDP]
$ns attach-agent $node_(35) $udp93
set null93 [new Agent/Null]
$ns attach-agent $node_(36) $null93
$ns connect $udp93 $null93
$udp93 set fid_ 2	;#?NAM??UDP?????????
set cbr93 [new Application/Traffic/CBR]	;#?UDP??????CBR????
$cbr93 attach-agent $udp93
$cbr93 set type_ CBR
$cbr93 set packet_size_ 1000;#??????
$cbr93 set rate_ 512Kb ;#??????
$cbr93 set random_ false
$ns at 1.0 "$cbr93 start"
$ns at 2.0 "$cbr93 stop"

#???94???(CBR-UDP)
set udp94 [new Agent/UDP]
$ns attach-agent $node_(36) $udp94
set null94 [new Agent/Null]
$ns attach-agent $node_(37) $null94
$ns connect $udp94 $null94
$udp94 set fid_ 2	;#?NAM??UDP?????????
set cbr94 [new Application/Traffic/CBR]	;#?UDP??????CBR????
$cbr94 attach-agent $udp94
$cbr94 set type_ CBR
$cbr94 set packet_size_ 1000;#??????
$cbr94 set rate_ 512Kb ;#??????
$cbr94 set random_ false
$ns at 1.0 "$cbr94 start"
$ns at 2.0 "$cbr94 stop"

#???95???(CBR-UDP)
set udp95 [new Agent/UDP]
$ns attach-agent $node_(37) $udp95
set null95 [new Agent/Null]
$ns attach-agent $node_(38) $null95
$ns connect $udp95 $null95
$udp95 set fid_ 2	;#?NAM??UDP?????????
set cbr95 [new Application/Traffic/CBR]	;#?UDP??????CBR????
$cbr95 attach-agent $udp95
$cbr95 set type_ CBR
$cbr95 set packet_size_ 1000;#??????
$cbr95 set rate_ 512Kb ;#??????
$cbr95 set random_ false
$ns at 1.0 "$cbr95 start"
$ns at 2.0 "$cbr95 stop"

#???96???(CBR-UDP)
set udp96 [new Agent/UDP]
$ns attach-agent $node_(38) $udp96
set null96 [new Agent/Null]
$ns attach-agent $node_(39) $null96
$ns connect $udp96 $null96
$udp96 set fid_ 2	;#?NAM??UDP?????????
set cbr96 [new Application/Traffic/CBR]	;#?UDP??????CBR????
$cbr96 attach-agent $udp96
$cbr96 set type_ CBR
$cbr96 set packet_size_ 1000;#??????
$cbr96 set rate_ 512Kb ;#??????
$cbr96 set random_ false
$ns at 1.0 "$cbr96 start"
$ns at 2.0 "$cbr96 stop"

#???97???(CBR-UDP)
set udp97 [new Agent/UDP]
$ns attach-agent $node_(39) $udp97
set null97 [new Agent/Null]
$ns attach-agent $node_(40) $null97
$ns connect $udp97 $null97
$udp97 set fid_ 2	;#?NAM??UDP?????????
set cbr97 [new Application/Traffic/CBR]	;#?UDP??????CBR????
$cbr97 attach-agent $udp97
$cbr97 set type_ CBR
$cbr97 set packet_size_ 1000;#??????
$cbr97 set rate_ 512Kb ;#??????
$cbr97 set random_ false
$ns at 1.0 "$cbr97 start"
$ns at 2.0 "$cbr97 stop"

#???98???(CBR-UDP)
set udp98 [new Agent/UDP]
$ns attach-agent $node_(40) $udp98
set null98 [new Agent/Null]
$ns attach-agent $node_(41) $null98
$ns connect $udp98 $null98
$udp98 set fid_ 2	;#?NAM??UDP?????????
set cbr98 [new Application/Traffic/CBR]	;#?UDP??????CBR????
$cbr98 attach-agent $udp98
$cbr98 set type_ CBR
$cbr98 set packet_size_ 1000;#??????
$cbr98 set rate_ 512Kb ;#??????
$cbr98 set random_ false
$ns at 1.0 "$cbr98 start"
$ns at 2.0 "$cbr98 stop"

#???99???(CBR-UDP)
set udp99 [new Agent/UDP]
$ns attach-agent $node_(41) $udp99
set null99 [new Agent/Null]
$ns attach-agent $node_(42) $null99
$ns connect $udp99 $null99
$udp99 set fid_ 2	;#?NAM??UDP?????????
set cbr99 [new Application/Traffic/CBR]	;#?UDP??????CBR????
$cbr99 attach-agent $udp99
$cbr99 set type_ CBR
$cbr99 set packet_size_ 1000;#??????
$cbr99 set rate_ 512Kb ;#??????
$cbr99 set random_ false
$ns at 1.0 "$cbr99 start"
$ns at 2.0 "$cbr99 stop"

#???100???(Ping)
set ping_a(100) [new Agent/Ping]
$ns attach-agent $node_(42) $ping_a(100)
set ping_b(100) [new Agent/Ping]
$ns attach-agent $node_(27) $ping_b(100)
$ns connect $ping_a(100) $ping_b(100)	;#????Ping Agents
$ns at 1.0 "$ping_a(100) send"	;#??Ping???

#???101???(Ping)
set ping_a(101) [new Agent/Ping]
$ns attach-agent $node_(27) $ping_a(101)
set ping_b(101) [new Agent/Ping]
$ns attach-agent $node_(29) $ping_b(101)
$ns connect $ping_a(101) $ping_b(101)	;#????Ping Agents
$ns at 1.0 "$ping_a(101) send"	;#??Ping???

#???102???(Ping)
set ping_a(102) [new Agent/Ping]
$ns attach-agent $node_(29) $ping_a(102)
set ping_b(102) [new Agent/Ping]
$ns attach-agent $node_(30) $ping_b(102)
$ns connect $ping_a(102) $ping_b(102)	;#????Ping Agents
$ns at 1.0 "$ping_a(102) send"	;#??Ping???

#???103???(Ping)
set ping_a(103) [new Agent/Ping]
$ns attach-agent $node_(30) $ping_a(103)
set ping_b(103) [new Agent/Ping]
$ns attach-agent $node_(31) $ping_b(103)
$ns connect $ping_a(103) $ping_b(103)	;#????Ping Agents
$ns at 1.0 "$ping_a(103) send"	;#??Ping???

#???104???(Ping)
set ping_a(104) [new Agent/Ping]
$ns attach-agent $node_(31) $ping_a(104)
set ping_b(104) [new Agent/Ping]
$ns attach-agent $node_(32) $ping_b(104)
$ns connect $ping_a(104) $ping_b(104)	;#????Ping Agents
$ns at 1.0 "$ping_a(104) send"	;#??Ping???

#???105???(Ping)
set ping_a(105) [new Agent/Ping]
$ns attach-agent $node_(32) $ping_a(105)
set ping_b(105) [new Agent/Ping]
$ns attach-agent $node_(33) $ping_b(105)
$ns connect $ping_a(105) $ping_b(105)	;#????Ping Agents
$ns at 1.0 "$ping_a(105) send"	;#??Ping???

#???106???(Ping)
set ping_a(106) [new Agent/Ping]
$ns attach-agent $node_(33) $ping_a(106)
set ping_b(106) [new Agent/Ping]
$ns attach-agent $node_(34) $ping_b(106)
$ns connect $ping_a(106) $ping_b(106)	;#????Ping Agents
$ns at 1.0 "$ping_a(106) send"	;#??Ping???

#???107???(Ping)
set ping_a(107) [new Agent/Ping]
$ns attach-agent $node_(34) $ping_a(107)
set ping_b(107) [new Agent/Ping]
$ns attach-agent $node_(35) $ping_b(107)
$ns connect $ping_a(107) $ping_b(107)	;#????Ping Agents
$ns at 1.0 "$ping_a(107) send"	;#??Ping???

#???108???(Ping)
set ping_a(108) [new Agent/Ping]
$ns attach-agent $node_(35) $ping_a(108)
set ping_b(108) [new Agent/Ping]
$ns attach-agent $node_(36) $ping_b(108)
$ns connect $ping_a(108) $ping_b(108)	;#????Ping Agents
$ns at 1.0 "$ping_a(108) send"	;#??Ping???

#???109???(Ping)
set ping_a(109) [new Agent/Ping]
$ns attach-agent $node_(36) $ping_a(109)
set ping_b(109) [new Agent/Ping]
$ns attach-agent $node_(37) $ping_b(109)
$ns connect $ping_a(109) $ping_b(109)	;#????Ping Agents
$ns at 1.0 "$ping_a(109) send"	;#??Ping???

#???110???(Ping)
set ping_a(110) [new Agent/Ping]
$ns attach-agent $node_(37) $ping_a(110)
set ping_b(110) [new Agent/Ping]
$ns attach-agent $node_(38) $ping_b(110)
$ns connect $ping_a(110) $ping_b(110)	;#????Ping Agents
$ns at 1.0 "$ping_a(110) send"	;#??Ping???

#???111???(Ping)
set ping_a(111) [new Agent/Ping]
$ns attach-agent $node_(38) $ping_a(111)
set ping_b(111) [new Agent/Ping]
$ns attach-agent $node_(39) $ping_b(111)
$ns connect $ping_a(111) $ping_b(111)	;#????Ping Agents
$ns at 1.0 "$ping_a(111) send"	;#??Ping???

#???112???(Ping)
set ping_a(112) [new Agent/Ping]
$ns attach-agent $node_(39) $ping_a(112)
set ping_b(112) [new Agent/Ping]
$ns attach-agent $node_(40) $ping_b(112)
$ns connect $ping_a(112) $ping_b(112)	;#????Ping Agents
$ns at 1.0 "$ping_a(112) send"	;#??Ping???

#???113???(Ping)
set ping_a(113) [new Agent/Ping]
$ns attach-agent $node_(40) $ping_a(113)
set ping_b(113) [new Agent/Ping]
$ns attach-agent $node_(41) $ping_b(113)
$ns connect $ping_a(113) $ping_b(113)	;#????Ping Agents
$ns at 1.0 "$ping_a(113) send"	;#??Ping???

#???114???(Ping)
set ping_a(114) [new Agent/Ping]
$ns attach-agent $node_(41) $ping_a(114)
set ping_b(114) [new Agent/Ping]
$ns attach-agent $node_(42) $ping_b(114)
$ns connect $ping_a(114) $ping_b(114)	;#????Ping Agents
$ns at 1.0 "$ping_a(114) send"	;#??Ping???

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
