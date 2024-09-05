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
set val(nn)     21        ;# number of mobilenodes
set val(rp)     AODV     ;# routing protocol
set val(x)      1000            ;# X dimension of topography
set val(y)      1000           ;# Y dimension of topography
set val(stop)   10.0 ;# time of simulation end

#===================================
#               ??????                         
#===================================

#??trace file
set ns            [new Simulator]	;#??ns simulator
set tracefd       [open mac_802_11_node_21_ftp_16_cbr_16_ping_19.tr w]	;#??trace file
set namtrace       [open mac_802_11_node_21_ftp_16_cbr_16_ping_19.nam w]	;#????nam trace file

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
$node_(0) set X_ 278
$node_(0) set Y_ 890
$node_(0) set Z_ 0.0
$ns initial_node_pos $node_(0) 20

#???1?Node
set node_(1) [$ns node]
$node_(1) set X_ 488
$node_(1) set Y_ 910
$node_(1) set Z_ 0.0
$ns initial_node_pos $node_(1) 20

#???2?Node
set node_(2) [$ns node]
$node_(2) set X_ 622
$node_(2) set Y_ 908
$node_(2) set Z_ 0.0
$ns initial_node_pos $node_(2) 20

#???3?Node
set node_(3) [$ns node]
$node_(3) set X_ 774
$node_(3) set Y_ 908
$node_(3) set Z_ 0.0
$ns initial_node_pos $node_(3) 20

#???4?Node
set node_(4) [$ns node]
$node_(4) set X_ 336
$node_(4) set Y_ 438
$node_(4) set Z_ 0.0
$ns initial_node_pos $node_(4) 20

#???5?Node
set node_(5) [$ns node]
$node_(5) set X_ 540
$node_(5) set Y_ 444
$node_(5) set Z_ 0.0
$ns initial_node_pos $node_(5) 20

#???6?Node
set node_(6) [$ns node]
$node_(6) set X_ 676
$node_(6) set Y_ 456
$node_(6) set Z_ 0.0
$ns initial_node_pos $node_(6) 20

#???7?Node
set node_(7) [$ns node]
$node_(7) set X_ 812
$node_(7) set Y_ 454
$node_(7) set Z_ 0.0
$ns initial_node_pos $node_(7) 20

#???8?Node
set node_(8) [$ns node]
$node_(8) set X_ 244
$node_(8) set Y_ 28
$node_(8) set Z_ 0.0
$ns initial_node_pos $node_(8) 20

#???9?Node
set node_(9) [$ns node]
$node_(9) set X_ 436
$node_(9) set Y_ 30
$node_(9) set Z_ 0.0
$ns initial_node_pos $node_(9) 20

#???10?Node
set node_(10) [$ns node]
$node_(10) set X_ 620
$node_(10) set Y_ 36
$node_(10) set Z_ 0.0
$ns initial_node_pos $node_(10) 20

#???11?Node
set node_(11) [$ns node]
$node_(11) set X_ 780
$node_(11) set Y_ 40
$node_(11) set Z_ 0.0
$ns initial_node_pos $node_(11) 20

#???12?Node
set node_(12) [$ns node]
$node_(12) set X_ 894
$node_(12) set Y_ 52
$node_(12) set Z_ 0.0
$ns initial_node_pos $node_(12) 20

#???13?Node
set node_(13) [$ns node]
$node_(13) set X_ 1010
$node_(13) set Y_ 56
$node_(13) set Z_ 0.0
$ns initial_node_pos $node_(13) 20

#???14?Node
set node_(14) [$ns node]
$node_(14) set X_ 1158
$node_(14) set Y_ 54
$node_(14) set Z_ 0.0
$ns initial_node_pos $node_(14) 20

#???15?Node
set node_(15) [$ns node]
$node_(15) set X_ 1250
$node_(15) set Y_ 56
$node_(15) set Z_ 0.0
$ns initial_node_pos $node_(15) 20

#???16?Node
set node_(16) [$ns node]
$node_(16) set X_ 1348
$node_(16) set Y_ 66
$node_(16) set Z_ 0.0
$ns initial_node_pos $node_(16) 20

#???17?Node
set node_(17) [$ns node]
$node_(17) set X_ 1448
$node_(17) set Y_ 60
$node_(17) set Z_ 0.0
$ns initial_node_pos $node_(17) 20

#???18?Node
set node_(18) [$ns node]
$node_(18) set X_ 1520
$node_(18) set Y_ 60
$node_(18) set Z_ 0.0
$ns initial_node_pos $node_(18) 20

#???19?Node
set node_(19) [$ns node]
$node_(19) set X_ 1598
$node_(19) set Y_ 68
$node_(19) set Z_ 0.0
$ns initial_node_pos $node_(19) 20

#???20?Node
set node_(20) [$ns node]
$node_(20) set X_ 1742
$node_(20) set Y_ 76
$node_(20) set Z_ 0.0
$ns initial_node_pos $node_(20) 20

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
$ns attach-agent $node_(4) $tcp9
$ns attach-agent $node_(5) $sink9
$ns connect $tcp9 $sink9
set ftp9 [new Application/FTP]
$ftp9 attach-agent $tcp9
$ns at 1.0 "$ftp9 start"
$ns at 2.0 "$ftp9 stop"

#???10???(CBR-UDP)
set udp10 [new Agent/UDP]
$ns attach-agent $node_(4) $udp10
set null10 [new Agent/Null]
$ns attach-agent $node_(5) $null10
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
$ns attach-agent $node_(5) $tcp12
$ns attach-agent $node_(6) $sink12
$ns connect $tcp12 $sink12
set ftp12 [new Application/FTP]
$ftp12 attach-agent $tcp12
$ns at 1.0 "$ftp12 start"
$ns at 2.0 "$ftp12 stop"

#???13???(CBR-UDP)
set udp13 [new Agent/UDP]
$ns attach-agent $node_(5) $udp13
set null13 [new Agent/Null]
$ns attach-agent $node_(6) $null13
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
$ns attach-agent $node_(5) $ping_a(14)
set ping_b(14) [new Agent/Ping]
$ns attach-agent $node_(6) $ping_b(14)
$ns connect $ping_a(14) $ping_b(14)	;#????Ping Agents
$ns at 1.0 "$ping_a(14) send"	;#??Ping???

#???15???(FTP-TCP)
set tcp15 [new Agent/TCP/Newreno]
$tcp15 set class_ 2
set sink15 [new Agent/TCPSink]
$ns attach-agent $node_(6) $tcp15
$ns attach-agent $node_(7) $sink15
$ns connect $tcp15 $sink15
set ftp15 [new Application/FTP]
$ftp15 attach-agent $tcp15
$ns at 1.0 "$ftp15 start"
$ns at 2.0 "$ftp15 stop"

#???16???(CBR-UDP)
set udp16 [new Agent/UDP]
$ns attach-agent $node_(6) $udp16
set null16 [new Agent/Null]
$ns attach-agent $node_(7) $null16
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
$ns attach-agent $node_(6) $ping_a(17)
set ping_b(17) [new Agent/Ping]
$ns attach-agent $node_(7) $ping_b(17)
$ns connect $ping_a(17) $ping_b(17)	;#????Ping Agents
$ns at 1.0 "$ping_a(17) send"	;#??Ping???

#???18???(FTP-TCP)
set tcp18 [new Agent/TCP/Newreno]
$tcp18 set class_ 2
set sink18 [new Agent/TCPSink]
$ns attach-agent $node_(8) $tcp18
$ns attach-agent $node_(9) $sink18
$ns connect $tcp18 $sink18
set ftp18 [new Application/FTP]
$ftp18 attach-agent $tcp18
$ns at 1.0 "$ftp18 start"
$ns at 2.0 "$ftp18 stop"

#???19???(CBR-UDP)
set udp19 [new Agent/UDP]
$ns attach-agent $node_(8) $udp19
set null19 [new Agent/Null]
$ns attach-agent $node_(9) $null19
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
$ns attach-agent $node_(8) $ping_a(20)
set ping_b(20) [new Agent/Ping]
$ns attach-agent $node_(9) $ping_b(20)
$ns connect $ping_a(20) $ping_b(20)	;#????Ping Agents
$ns at 1.0 "$ping_a(20) send"	;#??Ping???

#???21???(FTP-TCP)
set tcp21 [new Agent/TCP/Newreno]
$tcp21 set class_ 2
set sink21 [new Agent/TCPSink]
$ns attach-agent $node_(9) $tcp21
$ns attach-agent $node_(10) $sink21
$ns connect $tcp21 $sink21
set ftp21 [new Application/FTP]
$ftp21 attach-agent $tcp21
$ns at 1.0 "$ftp21 start"
$ns at 2.0 "$ftp21 stop"

#???22???(CBR-UDP)
set udp22 [new Agent/UDP]
$ns attach-agent $node_(9) $udp22
set null22 [new Agent/Null]
$ns attach-agent $node_(10) $null22
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
$ns attach-agent $node_(9) $ping_a(23)
set ping_b(23) [new Agent/Ping]
$ns attach-agent $node_(10) $ping_b(23)
$ns connect $ping_a(23) $ping_b(23)	;#????Ping Agents
$ns at 1.0 "$ping_a(23) send"	;#??Ping???

#???24???(FTP-TCP)
set tcp24 [new Agent/TCP/Newreno]
$tcp24 set class_ 2
set sink24 [new Agent/TCPSink]
$ns attach-agent $node_(10) $tcp24
$ns attach-agent $node_(11) $sink24
$ns connect $tcp24 $sink24
set ftp24 [new Application/FTP]
$ftp24 attach-agent $tcp24
$ns at 1.0 "$ftp24 start"
$ns at 2.0 "$ftp24 stop"

#???25???(CBR-UDP)
set udp25 [new Agent/UDP]
$ns attach-agent $node_(10) $udp25
set null25 [new Agent/Null]
$ns attach-agent $node_(11) $null25
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
$ns attach-agent $node_(11) $ping_a(26)
set ping_b(26) [new Agent/Ping]
$ns attach-agent $node_(12) $ping_b(26)
$ns connect $ping_a(26) $ping_b(26)	;#????Ping Agents
$ns at 1.0 "$ping_a(26) send"	;#??Ping???

#???27???(FTP-TCP)
set tcp27 [new Agent/TCP/Newreno]
$tcp27 set class_ 2
set sink27 [new Agent/TCPSink]
$ns attach-agent $node_(12) $tcp27
$ns attach-agent $node_(13) $sink27
$ns connect $tcp27 $sink27
set ftp27 [new Application/FTP]
$ftp27 attach-agent $tcp27
$ns at 1.0 "$ftp27 start"
$ns at 2.0 "$ftp27 stop"

#???28???(CBR-UDP)
set udp28 [new Agent/UDP]
$ns attach-agent $node_(12) $udp28
set null28 [new Agent/Null]
$ns attach-agent $node_(13) $null28
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
$ns attach-agent $node_(12) $ping_a(29)
set ping_b(29) [new Agent/Ping]
$ns attach-agent $node_(13) $ping_b(29)
$ns connect $ping_a(29) $ping_b(29)	;#????Ping Agents
$ns at 1.0 "$ping_a(29) send"	;#??Ping???

#???30???(FTP-TCP)
set tcp30 [new Agent/TCP/Newreno]
$tcp30 set class_ 2
set sink30 [new Agent/TCPSink]
$ns attach-agent $node_(13) $tcp30
$ns attach-agent $node_(14) $sink30
$ns connect $tcp30 $sink30
set ftp30 [new Application/FTP]
$ftp30 attach-agent $tcp30
$ns at 1.0 "$ftp30 start"
$ns at 2.0 "$ftp30 stop"

#???31???(CBR-UDP)
set udp31 [new Agent/UDP]
$ns attach-agent $node_(13) $udp31
set null31 [new Agent/Null]
$ns attach-agent $node_(14) $null31
$ns connect $udp31 $null31
$udp31 set fid_ 2	;#?NAM??UDP?????????
set cbr31 [new Application/Traffic/CBR]	;#?UDP??????CBR????
$cbr31 attach-agent $udp31
$cbr31 set type_ CBR
$cbr31 set packet_size_ 1000;#??????
$cbr31 set rate_ 512Kb ;#??????
$cbr31 set random_ false
$ns at 1.0 "$cbr31 start"
$ns at 2.0 "$cbr31 stop"

#???32???(Ping)
set ping_a(32) [new Agent/Ping]
$ns attach-agent $node_(13) $ping_a(32)
set ping_b(32) [new Agent/Ping]
$ns attach-agent $node_(14) $ping_b(32)
$ns connect $ping_a(32) $ping_b(32)	;#????Ping Agents
$ns at 1.0 "$ping_a(32) send"	;#??Ping???

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

#???34???(CBR-UDP)
set udp34 [new Agent/UDP]
$ns attach-agent $node_(14) $udp34
set null34 [new Agent/Null]
$ns attach-agent $node_(15) $null34
$ns connect $udp34 $null34
$udp34 set fid_ 2	;#?NAM??UDP?????????
set cbr34 [new Application/Traffic/CBR]	;#?UDP??????CBR????
$cbr34 attach-agent $udp34
$cbr34 set type_ CBR
$cbr34 set packet_size_ 1000;#??????
$cbr34 set rate_ 512Kb ;#??????
$cbr34 set random_ false
$ns at 1.0 "$cbr34 start"
$ns at 2.0 "$cbr34 stop"

#???35???(Ping)
set ping_a(35) [new Agent/Ping]
$ns attach-agent $node_(14) $ping_a(35)
set ping_b(35) [new Agent/Ping]
$ns attach-agent $node_(15) $ping_b(35)
$ns connect $ping_a(35) $ping_b(35)	;#????Ping Agents
$ns at 1.0 "$ping_a(35) send"	;#??Ping???

#???36???(FTP-TCP)
set tcp36 [new Agent/TCP/Newreno]
$tcp36 set class_ 2
set sink36 [new Agent/TCPSink]
$ns attach-agent $node_(15) $tcp36
$ns attach-agent $node_(16) $sink36
$ns connect $tcp36 $sink36
set ftp36 [new Application/FTP]
$ftp36 attach-agent $tcp36
$ns at 1.0 "$ftp36 start"
$ns at 2.0 "$ftp36 stop"

#???37???(CBR-UDP)
set udp37 [new Agent/UDP]
$ns attach-agent $node_(15) $udp37
set null37 [new Agent/Null]
$ns attach-agent $node_(16) $null37
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
$ns attach-agent $node_(16) $ping_a(38)
set ping_b(38) [new Agent/Ping]
$ns attach-agent $node_(17) $ping_b(38)
$ns connect $ping_a(38) $ping_b(38)	;#????Ping Agents
$ns at 1.0 "$ping_a(38) send"	;#??Ping???

#???39???(FTP-TCP)
set tcp39 [new Agent/TCP/Newreno]
$tcp39 set class_ 2
set sink39 [new Agent/TCPSink]
$ns attach-agent $node_(17) $tcp39
$ns attach-agent $node_(18) $sink39
$ns connect $tcp39 $sink39
set ftp39 [new Application/FTP]
$ftp39 attach-agent $tcp39
$ns at 1.0 "$ftp39 start"
$ns at 2.0 "$ftp39 stop"

#???40???(CBR-UDP)
set udp40 [new Agent/UDP]
$ns attach-agent $node_(17) $udp40
set null40 [new Agent/Null]
$ns attach-agent $node_(18) $null40
$ns connect $udp40 $null40
$udp40 set fid_ 2	;#?NAM??UDP?????????
set cbr40 [new Application/Traffic/CBR]	;#?UDP??????CBR????
$cbr40 attach-agent $udp40
$cbr40 set type_ CBR
$cbr40 set packet_size_ 1000;#??????
$cbr40 set rate_ 512Kb ;#??????
$cbr40 set random_ false
$ns at 1.0 "$cbr40 start"
$ns at 2.0 "$cbr40 stop"

#???41???(Ping)
set ping_a(41) [new Agent/Ping]
$ns attach-agent $node_(17) $ping_a(41)
set ping_b(41) [new Agent/Ping]
$ns attach-agent $node_(18) $ping_b(41)
$ns connect $ping_a(41) $ping_b(41)	;#????Ping Agents
$ns at 1.0 "$ping_a(41) send"	;#??Ping???

#???42???(FTP-TCP)
set tcp42 [new Agent/TCP/Newreno]
$tcp42 set class_ 2
set sink42 [new Agent/TCPSink]
$ns attach-agent $node_(18) $tcp42
$ns attach-agent $node_(19) $sink42
$ns connect $tcp42 $sink42
set ftp42 [new Application/FTP]
$ftp42 attach-agent $tcp42
$ns at 1.0 "$ftp42 start"
$ns at 2.0 "$ftp42 stop"

#???43???(CBR-UDP)
set udp43 [new Agent/UDP]
$ns attach-agent $node_(18) $udp43
set null43 [new Agent/Null]
$ns attach-agent $node_(19) $null43
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

#???44???(Ping)
set ping_a(44) [new Agent/Ping]
$ns attach-agent $node_(18) $ping_a(44)
set ping_b(44) [new Agent/Ping]
$ns attach-agent $node_(19) $ping_b(44)
$ns connect $ping_a(44) $ping_b(44)	;#????Ping Agents
$ns at 1.0 "$ping_a(44) send"	;#??Ping???

#???45???(FTP-TCP)
set tcp45 [new Agent/TCP/Newreno]
$tcp45 set class_ 2
set sink45 [new Agent/TCPSink]
$ns attach-agent $node_(19) $tcp45
$ns attach-agent $node_(20) $sink45
$ns connect $tcp45 $sink45
set ftp45 [new Application/FTP]
$ftp45 attach-agent $tcp45
$ns at 1.0 "$ftp45 start"
$ns at 2.0 "$ftp45 stop"

#???46???(CBR-UDP)
set udp46 [new Agent/UDP]
$ns attach-agent $node_(19) $udp46
set null46 [new Agent/Null]
$ns attach-agent $node_(20) $null46
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
$ns attach-agent $node_(19) $ping_a(47)
set ping_b(47) [new Agent/Ping]
$ns attach-agent $node_(20) $ping_b(47)
$ns connect $ping_a(47) $ping_b(47)	;#????Ping Agents
$ns at 1.0 "$ping_a(47) send"	;#??Ping???

#???48???(Ping)
set ping_a(48) [new Agent/Ping]
$ns attach-agent $node_(5) $ping_a(48)
set ping_b(48) [new Agent/Ping]
$ns attach-agent $node_(10) $ping_b(48)
$ns connect $ping_a(48) $ping_b(48)	;#????Ping Agents
$ns at 1.0 "$ping_a(48) send"	;#??Ping???

#???49???(Ping)
set ping_a(49) [new Agent/Ping]
$ns attach-agent $node_(5) $ping_a(49)
set ping_b(49) [new Agent/Ping]
$ns attach-agent $node_(10) $ping_b(49)
$ns connect $ping_a(49) $ping_b(49)	;#????Ping Agents
$ns at 1.0 "$ping_a(49) send"	;#??Ping???

#???50???(Ping)
set ping_a(50) [new Agent/Ping]
$ns attach-agent $node_(5) $ping_a(50)
set ping_b(50) [new Agent/Ping]
$ns attach-agent $node_(10) $ping_b(50)
$ns connect $ping_a(50) $ping_b(50)	;#????Ping Agents
$ns at 1.0 "$ping_a(50) send"	;#??Ping???

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
