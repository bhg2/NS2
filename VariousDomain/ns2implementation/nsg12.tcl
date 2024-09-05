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
set val(nn)     19        ;# number of mobilenodes
set val(rp)     AODV     ;# routing protocol
set val(x)      1000            ;# X dimension of topography
set val(y)      1000           ;# Y dimension of topography
set val(stop)   10.0 ;# time of simulation end

#===================================
#               ??????                         
#===================================

#??trace file
set ns            [new Simulator]	;#??ns simulator
set tracefd       [open mac_802_11_node_19_ftp_28_cbr_28_ping_29.tr w]	;#??trace file
set namtrace       [open mac_802_11_node_19_ftp_28_cbr_28_ping_29.nam w]	;#????nam trace file

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
$node_(0) set X_ 84
$node_(0) set Y_ 1026
$node_(0) set Z_ 0.0
$ns initial_node_pos $node_(0) 20

#???1?Node
set node_(1) [$ns node]
$node_(1) set X_ 192
$node_(1) set Y_ 1032
$node_(1) set Z_ 0.0
$ns initial_node_pos $node_(1) 20

#???2?Node
set node_(2) [$ns node]
$node_(2) set X_ 126
$node_(2) set Y_ 926
$node_(2) set Z_ 0.0
$ns initial_node_pos $node_(2) 20

#???3?Node
set node_(3) [$ns node]
$node_(3) set X_ 284
$node_(3) set Y_ 906
$node_(3) set Z_ 0.0
$ns initial_node_pos $node_(3) 20

#???4?Node
set node_(4) [$ns node]
$node_(4) set X_ 476
$node_(4) set Y_ 864
$node_(4) set Z_ 0.0
$ns initial_node_pos $node_(4) 20

#???5?Node
set node_(5) [$ns node]
$node_(5) set X_ 470
$node_(5) set Y_ 724
$node_(5) set Z_ 0.0
$ns initial_node_pos $node_(5) 20

#???6?Node
set node_(6) [$ns node]
$node_(6) set X_ 252
$node_(6) set Y_ 716
$node_(6) set Z_ 0.0
$ns initial_node_pos $node_(6) 20

#???7?Node
set node_(7) [$ns node]
$node_(7) set X_ 204
$node_(7) set Y_ 530
$node_(7) set Z_ 0.0
$ns initial_node_pos $node_(7) 20

#???8?Node
set node_(8) [$ns node]
$node_(8) set X_ 330
$node_(8) set Y_ 526
$node_(8) set Z_ 0.0
$ns initial_node_pos $node_(8) 20

#???9?Node
set node_(10) [$ns node]
$node_(10) set X_ 252
$node_(10) set Y_ 358
$node_(10) set Z_ 0.0
$ns initial_node_pos $node_(10) 20

#???10?Node
set node_(11) [$ns node]
$node_(11) set X_ 76
$node_(11) set Y_ 672
$node_(11) set Z_ 0.0
$ns initial_node_pos $node_(11) 20

#???11?Node
set node_(12) [$ns node]
$node_(12) set X_ 80
$node_(12) set Y_ 408
$node_(12) set Z_ 0.0
$ns initial_node_pos $node_(12) 20

#???12?Node
set node_(13) [$ns node]
$node_(13) set X_ 38
$node_(13) set Y_ 550
$node_(13) set Z_ 0.0
$ns initial_node_pos $node_(13) 20

#???13?Node
set node_(14) [$ns node]
$node_(14) set X_ 684
$node_(14) set Y_ 972
$node_(14) set Z_ 0.0
$ns initial_node_pos $node_(14) 20

#???14?Node
set node_(15) [$ns node]
$node_(15) set X_ 722
$node_(15) set Y_ 802
$node_(15) set Z_ 0.0
$ns initial_node_pos $node_(15) 20

#???15?Node
set node_(16) [$ns node]
$node_(16) set X_ 854
$node_(16) set Y_ 836
$node_(16) set Z_ 0.0
$ns initial_node_pos $node_(16) 20

#???16?Node
set node_(17) [$ns node]
$node_(17) set X_ 718
$node_(17) set Y_ 616
$node_(17) set Z_ 0.0
$ns initial_node_pos $node_(17) 20

#???17?Node
set node_(18) [$ns node]
$node_(18) set X_ 874
$node_(18) set Y_ 658
$node_(18) set Z_ 0.0
$ns initial_node_pos $node_(18) 20

#???18?Node
set node_(19) [$ns node]
$node_(19) set X_ 824
$node_(19) set Y_ 484
$node_(19) set Z_ 0.0
$ns initial_node_pos $node_(19) 20

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
$ns attach-agent $node_(0) $tcp3
$ns attach-agent $node_(2) $sink3
$ns connect $tcp3 $sink3
set ftp3 [new Application/FTP]
$ftp3 attach-agent $tcp3
$ns at 1.0 "$ftp3 start"
$ns at 2.0 "$ftp3 stop"

#???4???(CBR-UDP)
set udp4 [new Agent/UDP]
$ns attach-agent $node_(0) $udp4
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
$ns attach-agent $node_(0) $ping_a(5)
set ping_b(5) [new Agent/Ping]
$ns attach-agent $node_(2) $ping_b(5)
$ns connect $ping_a(5) $ping_b(5)	;#????Ping Agents
$ns at 1.0 "$ping_a(5) send"	;#??Ping???

#???6???(FTP-TCP)
set tcp6 [new Agent/TCP/Newreno]
$tcp6 set class_ 2
set sink6 [new Agent/TCPSink]
$ns attach-agent $node_(1) $tcp6
$ns attach-agent $node_(2) $sink6
$ns connect $tcp6 $sink6
set ftp6 [new Application/FTP]
$ftp6 attach-agent $tcp6
$ns at 1.0 "$ftp6 start"
$ns at 2.0 "$ftp6 stop"

#???7???(CBR-UDP)
set udp7 [new Agent/UDP]
$ns attach-agent $node_(1) $udp7
set null7 [new Agent/Null]
$ns attach-agent $node_(2) $null7
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
$ns attach-agent $node_(1) $ping_a(8)
set ping_b(8) [new Agent/Ping]
$ns attach-agent $node_(2) $ping_b(8)
$ns connect $ping_a(8) $ping_b(8)	;#????Ping Agents
$ns at 1.0 "$ping_a(8) send"	;#??Ping???

#???9???(FTP-TCP)
set tcp9 [new Agent/TCP/Newreno]
$tcp9 set class_ 2
set sink9 [new Agent/TCPSink]
$ns attach-agent $node_(0) $tcp9
$ns attach-agent $node_(3) $sink9
$ns connect $tcp9 $sink9
set ftp9 [new Application/FTP]
$ftp9 attach-agent $tcp9
$ns at 1.0 "$ftp9 start"
$ns at 2.0 "$ftp9 stop"

#???10???(CBR-UDP)
set udp10 [new Agent/UDP]
$ns attach-agent $node_(0) $udp10
set null10 [new Agent/Null]
$ns attach-agent $node_(3) $null10
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
$ns attach-agent $node_(0) $ping_a(11)
set ping_b(11) [new Agent/Ping]
$ns attach-agent $node_(3) $ping_b(11)
$ns connect $ping_a(11) $ping_b(11)	;#????Ping Agents
$ns at 1.0 "$ping_a(11) send"	;#??Ping???

#???12???(FTP-TCP)
set tcp12 [new Agent/TCP/Newreno]
$tcp12 set class_ 2
set sink12 [new Agent/TCPSink]
$ns attach-agent $node_(2) $tcp12
$ns attach-agent $node_(3) $sink12
$ns connect $tcp12 $sink12
set ftp12 [new Application/FTP]
$ftp12 attach-agent $tcp12
$ns at 1.0 "$ftp12 start"
$ns at 2.0 "$ftp12 stop"

#???13???(CBR-UDP)
set udp13 [new Agent/UDP]
$ns attach-agent $node_(2) $udp13
set null13 [new Agent/Null]
$ns attach-agent $node_(3) $null13
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
$ns attach-agent $node_(2) $ping_a(14)
set ping_b(14) [new Agent/Ping]
$ns attach-agent $node_(3) $ping_b(14)
$ns connect $ping_a(14) $ping_b(14)	;#????Ping Agents
$ns at 1.0 "$ping_a(14) send"	;#??Ping???

#???15???(FTP-TCP)
set tcp15 [new Agent/TCP/Newreno]
$tcp15 set class_ 2
set sink15 [new Agent/TCPSink]
$ns attach-agent $node_(1) $tcp15
$ns attach-agent $node_(3) $sink15
$ns connect $tcp15 $sink15
set ftp15 [new Application/FTP]
$ftp15 attach-agent $tcp15
$ns at 1.0 "$ftp15 start"
$ns at 2.0 "$ftp15 stop"

#???16???(CBR-UDP)
set udp16 [new Agent/UDP]
$ns attach-agent $node_(1) $udp16
set null16 [new Agent/Null]
$ns attach-agent $node_(3) $null16
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
$ns attach-agent $node_(1) $ping_a(17)
set ping_b(17) [new Agent/Ping]
$ns attach-agent $node_(3) $ping_b(17)
$ns connect $ping_a(17) $ping_b(17)	;#????Ping Agents
$ns at 1.0 "$ping_a(17) send"	;#??Ping???

#???18???(FTP-TCP)
set tcp18 [new Agent/TCP/Newreno]
$tcp18 set class_ 2
set sink18 [new Agent/TCPSink]
$ns attach-agent $node_(3) $tcp18
$ns attach-agent $node_(4) $sink18
$ns connect $tcp18 $sink18
set ftp18 [new Application/FTP]
$ftp18 attach-agent $tcp18
$ns at 1.0 "$ftp18 start"
$ns at 2.0 "$ftp18 stop"

#???19???(CBR-UDP)
set udp19 [new Agent/UDP]
$ns attach-agent $node_(3) $udp19
set null19 [new Agent/Null]
$ns attach-agent $node_(4) $null19
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
$ns attach-agent $node_(3) $ping_a(20)
set ping_b(20) [new Agent/Ping]
$ns attach-agent $node_(4) $ping_b(20)
$ns connect $ping_a(20) $ping_b(20)	;#????Ping Agents
$ns at 1.0 "$ping_a(20) send"	;#??Ping???

#???21???(FTP-TCP)
set tcp21 [new Agent/TCP/Newreno]
$tcp21 set class_ 2
set sink21 [new Agent/TCPSink]
$ns attach-agent $node_(4) $tcp21
$ns attach-agent $node_(5) $sink21
$ns connect $tcp21 $sink21
set ftp21 [new Application/FTP]
$ftp21 attach-agent $tcp21
$ns at 1.0 "$ftp21 start"
$ns at 2.0 "$ftp21 stop"

#???22???(CBR-UDP)
set udp22 [new Agent/UDP]
$ns attach-agent $node_(4) $udp22
set null22 [new Agent/Null]
$ns attach-agent $node_(5) $null22
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
$ns attach-agent $node_(4) $ping_a(23)
set ping_b(23) [new Agent/Ping]
$ns attach-agent $node_(5) $ping_b(23)
$ns connect $ping_a(23) $ping_b(23)	;#????Ping Agents
$ns at 1.0 "$ping_a(23) send"	;#??Ping???

#???24???(FTP-TCP)
set tcp24 [new Agent/TCP/Newreno]
$tcp24 set class_ 2
set sink24 [new Agent/TCPSink]
$ns attach-agent $node_(5) $tcp24
$ns attach-agent $node_(6) $sink24
$ns connect $tcp24 $sink24
set ftp24 [new Application/FTP]
$ftp24 attach-agent $tcp24
$ns at 1.0 "$ftp24 start"
$ns at 2.0 "$ftp24 stop"

#???25???(CBR-UDP)
set udp25 [new Agent/UDP]
$ns attach-agent $node_(5) $udp25
set null25 [new Agent/Null]
$ns attach-agent $node_(6) $null25
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
$ns attach-agent $node_(5) $ping_a(26)
set ping_b(26) [new Agent/Ping]
$ns attach-agent $node_(6) $ping_b(26)
$ns connect $ping_a(26) $ping_b(26)	;#????Ping Agents
$ns at 1.0 "$ping_a(26) send"	;#??Ping???

#???27???(FTP-TCP)
set tcp27 [new Agent/TCP/Newreno]
$tcp27 set class_ 2
set sink27 [new Agent/TCPSink]
$ns attach-agent $node_(3) $tcp27
$ns attach-agent $node_(6) $sink27
$ns connect $tcp27 $sink27
set ftp27 [new Application/FTP]
$ftp27 attach-agent $tcp27
$ns at 1.0 "$ftp27 start"
$ns at 2.0 "$ftp27 stop"

#???28???(CBR-UDP)
set udp28 [new Agent/UDP]
$ns attach-agent $node_(3) $udp28
set null28 [new Agent/Null]
$ns attach-agent $node_(6) $null28
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
$ns attach-agent $node_(3) $ping_a(29)
set ping_b(29) [new Agent/Ping]
$ns attach-agent $node_(6) $ping_b(29)
$ns connect $ping_a(29) $ping_b(29)	;#????Ping Agents
$ns at 1.0 "$ping_a(29) send"	;#??Ping???

#???30???(FTP-TCP)
set tcp30 [new Agent/TCP/Newreno]
$tcp30 set class_ 2
set sink30 [new Agent/TCPSink]
$ns attach-agent $node_(2) $tcp30
$ns attach-agent $node_(6) $sink30
$ns connect $tcp30 $sink30
set ftp30 [new Application/FTP]
$ftp30 attach-agent $tcp30
$ns at 1.0 "$ftp30 start"
$ns at 2.0 "$ftp30 stop"

#???31???(CBR-UDP)
set udp31 [new Agent/UDP]
$ns attach-agent $node_(2) $udp31
set null31 [new Agent/Null]
$ns attach-agent $node_(6) $null31
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
$ns attach-agent $node_(2) $ping_a(32)
set ping_b(32) [new Agent/Ping]
$ns attach-agent $node_(6) $ping_b(32)
$ns connect $ping_a(32) $ping_b(32)	;#????Ping Agents
$ns at 1.0 "$ping_a(32) send"	;#??Ping???

#???33???(FTP-TCP)
set tcp33 [new Agent/TCP/Newreno]
$tcp33 set class_ 2
set sink33 [new Agent/TCPSink]
$ns attach-agent $node_(6) $tcp33
$ns attach-agent $node_(7) $sink33
$ns connect $tcp33 $sink33
set ftp33 [new Application/FTP]
$ftp33 attach-agent $tcp33
$ns at 1.0 "$ftp33 start"
$ns at 2.0 "$ftp33 stop"

#???34???(CBR-UDP)
set udp34 [new Agent/UDP]
$ns attach-agent $node_(6) $udp34
set null34 [new Agent/Null]
$ns attach-agent $node_(7) $null34
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
$ns attach-agent $node_(6) $ping_a(35)
set ping_b(35) [new Agent/Ping]
$ns attach-agent $node_(7) $ping_b(35)
$ns connect $ping_a(35) $ping_b(35)	;#????Ping Agents
$ns at 1.0 "$ping_a(35) send"	;#??Ping???

#???36???(FTP-TCP)
set tcp36 [new Agent/TCP/Newreno]
$tcp36 set class_ 2
set sink36 [new Agent/TCPSink]
$ns attach-agent $node_(7) $tcp36
$ns attach-agent $node_(8) $sink36
$ns connect $tcp36 $sink36
set ftp36 [new Application/FTP]
$ftp36 attach-agent $tcp36
$ns at 1.0 "$ftp36 start"
$ns at 2.0 "$ftp36 stop"

#???37???(CBR-UDP)
set udp37 [new Agent/UDP]
$ns attach-agent $node_(7) $udp37
set null37 [new Agent/Null]
$ns attach-agent $node_(8) $null37
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
$ns attach-agent $node_(7) $ping_a(38)
set ping_b(38) [new Agent/Ping]
$ns attach-agent $node_(8) $ping_b(38)
$ns connect $ping_a(38) $ping_b(38)	;#????Ping Agents
$ns at 1.0 "$ping_a(38) send"	;#??Ping???

#???39???(FTP-TCP)
set tcp39 [new Agent/TCP/Newreno]
$tcp39 set class_ 2
set sink39 [new Agent/TCPSink]
$ns attach-agent $node_(5) $tcp39
$ns attach-agent $node_(8) $sink39
$ns connect $tcp39 $sink39
set ftp39 [new Application/FTP]
$ftp39 attach-agent $tcp39
$ns at 1.0 "$ftp39 start"
$ns at 2.0 "$ftp39 stop"

#???40???(CBR-UDP)
set udp40 [new Agent/UDP]
$ns attach-agent $node_(5) $udp40
set null40 [new Agent/Null]
$ns attach-agent $node_(8) $null40
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
$ns attach-agent $node_(5) $ping_a(41)
set ping_b(41) [new Agent/Ping]
$ns attach-agent $node_(8) $ping_b(41)
$ns connect $ping_a(41) $ping_b(41)	;#????Ping Agents
$ns at 1.0 "$ping_a(41) send"	;#??Ping???

#???42???(FTP-TCP)
set tcp42 [new Agent/TCP/Newreno]
$tcp42 set class_ 2
set sink42 [new Agent/TCPSink]
$ns attach-agent $node_(8) $tcp42
$ns attach-agent $node_(10) $sink42
$ns connect $tcp42 $sink42
set ftp42 [new Application/FTP]
$ftp42 attach-agent $tcp42
$ns at 1.0 "$ftp42 start"
$ns at 2.0 "$ftp42 stop"

#???43???(CBR-UDP)
set udp43 [new Agent/UDP]
$ns attach-agent $node_(8) $udp43
set null43 [new Agent/Null]
$ns attach-agent $node_(10) $null43
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
$ns attach-agent $node_(8) $ping_a(44)
set ping_b(44) [new Agent/Ping]
$ns attach-agent $node_(10) $ping_b(44)
$ns connect $ping_a(44) $ping_b(44)	;#????Ping Agents
$ns at 1.0 "$ping_a(44) send"	;#??Ping???

#???45???(FTP-TCP)
set tcp45 [new Agent/TCP/Newreno]
$tcp45 set class_ 2
set sink45 [new Agent/TCPSink]
$ns attach-agent $node_(10) $tcp45
$ns attach-agent $node_(7) $sink45
$ns connect $tcp45 $sink45
set ftp45 [new Application/FTP]
$ftp45 attach-agent $tcp45
$ns at 1.0 "$ftp45 start"
$ns at 2.0 "$ftp45 stop"

#???46???(CBR-UDP)
set udp46 [new Agent/UDP]
$ns attach-agent $node_(10) $udp46
set null46 [new Agent/Null]
$ns attach-agent $node_(7) $null46
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
$ns attach-agent $node_(10) $ping_a(47)
set ping_b(47) [new Agent/Ping]
$ns attach-agent $node_(7) $ping_b(47)
$ns connect $ping_a(47) $ping_b(47)	;#????Ping Agents
$ns at 1.0 "$ping_a(47) send"	;#??Ping???

#???48???(FTP-TCP)
set tcp48 [new Agent/TCP/Newreno]
$tcp48 set class_ 2
set sink48 [new Agent/TCPSink]
$ns attach-agent $node_(10) $tcp48
$ns attach-agent $node_(12) $sink48
$ns connect $tcp48 $sink48
set ftp48 [new Application/FTP]
$ftp48 attach-agent $tcp48
$ns at 1.0 "$ftp48 start"
$ns at 2.0 "$ftp48 stop"

#???49???(CBR-UDP)
set udp49 [new Agent/UDP]
$ns attach-agent $node_(10) $udp49
set null49 [new Agent/Null]
$ns attach-agent $node_(12) $null49
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

#???50???(Ping)
set ping_a(50) [new Agent/Ping]
$ns attach-agent $node_(10) $ping_a(50)
set ping_b(50) [new Agent/Ping]
$ns attach-agent $node_(12) $ping_b(50)
$ns connect $ping_a(50) $ping_b(50)	;#????Ping Agents
$ns at 1.0 "$ping_a(50) send"	;#??Ping???

#???51???(FTP-TCP)
set tcp51 [new Agent/TCP/Newreno]
$tcp51 set class_ 2
set sink51 [new Agent/TCPSink]
$ns attach-agent $node_(12) $tcp51
$ns attach-agent $node_(13) $sink51
$ns connect $tcp51 $sink51
set ftp51 [new Application/FTP]
$ftp51 attach-agent $tcp51
$ns at 1.0 "$ftp51 start"
$ns at 2.0 "$ftp51 stop"

#???52???(CBR-UDP)
set udp52 [new Agent/UDP]
$ns attach-agent $node_(12) $udp52
set null52 [new Agent/Null]
$ns attach-agent $node_(13) $null52
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

#???53???(Ping)
set ping_a(53) [new Agent/Ping]
$ns attach-agent $node_(12) $ping_a(53)
set ping_b(53) [new Agent/Ping]
$ns attach-agent $node_(13) $ping_b(53)
$ns connect $ping_a(53) $ping_b(53)	;#????Ping Agents
$ns at 1.0 "$ping_a(53) send"	;#??Ping???

#???54???(FTP-TCP)
set tcp54 [new Agent/TCP/Newreno]
$tcp54 set class_ 2
set sink54 [new Agent/TCPSink]
$ns attach-agent $node_(13) $tcp54
$ns attach-agent $node_(11) $sink54
$ns connect $tcp54 $sink54
set ftp54 [new Application/FTP]
$ftp54 attach-agent $tcp54
$ns at 1.0 "$ftp54 start"
$ns at 2.0 "$ftp54 stop"

#???55???(CBR-UDP)
set udp55 [new Agent/UDP]
$ns attach-agent $node_(13) $udp55
set null55 [new Agent/Null]
$ns attach-agent $node_(11) $null55
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

#???56???(Ping)
set ping_a(56) [new Agent/Ping]
$ns attach-agent $node_(13) $ping_a(56)
set ping_b(56) [new Agent/Ping]
$ns attach-agent $node_(11) $ping_b(56)
$ns connect $ping_a(56) $ping_b(56)	;#????Ping Agents
$ns at 1.0 "$ping_a(56) send"	;#??Ping???

#???57???(FTP-TCP)
set tcp57 [new Agent/TCP/Newreno]
$tcp57 set class_ 2
set sink57 [new Agent/TCPSink]
$ns attach-agent $node_(4) $tcp57
$ns attach-agent $node_(14) $sink57
$ns connect $tcp57 $sink57
set ftp57 [new Application/FTP]
$ftp57 attach-agent $tcp57
$ns at 1.0 "$ftp57 start"
$ns at 2.0 "$ftp57 stop"

#???58???(CBR-UDP)
set udp58 [new Agent/UDP]
$ns attach-agent $node_(4) $udp58
set null58 [new Agent/Null]
$ns attach-agent $node_(14) $null58
$ns connect $udp58 $null58
$udp58 set fid_ 2	;#?NAM??UDP?????????
set cbr58 [new Application/Traffic/CBR]	;#?UDP??????CBR????
$cbr58 attach-agent $udp58
$cbr58 set type_ CBR
$cbr58 set packet_size_ 1000;#??????
$cbr58 set rate_ 512Kb ;#??????
$cbr58 set random_ false
$ns at 1.0 "$cbr58 start"
$ns at 2.0 "$cbr58 stop"

#???59???(Ping)
set ping_a(59) [new Agent/Ping]
$ns attach-agent $node_(4) $ping_a(59)
set ping_b(59) [new Agent/Ping]
$ns attach-agent $node_(14) $ping_b(59)
$ns connect $ping_a(59) $ping_b(59)	;#????Ping Agents
$ns at 1.0 "$ping_a(59) send"	;#??Ping???

#???60???(FTP-TCP)
set tcp60 [new Agent/TCP/Newreno]
$tcp60 set class_ 2
set sink60 [new Agent/TCPSink]
$ns attach-agent $node_(14) $tcp60
$ns attach-agent $node_(15) $sink60
$ns connect $tcp60 $sink60
set ftp60 [new Application/FTP]
$ftp60 attach-agent $tcp60
$ns at 1.0 "$ftp60 start"
$ns at 2.0 "$ftp60 stop"

#???61???(CBR-UDP)
set udp61 [new Agent/UDP]
$ns attach-agent $node_(14) $udp61
set null61 [new Agent/Null]
$ns attach-agent $node_(15) $null61
$ns connect $udp61 $null61
$udp61 set fid_ 2	;#?NAM??UDP?????????
set cbr61 [new Application/Traffic/CBR]	;#?UDP??????CBR????
$cbr61 attach-agent $udp61
$cbr61 set type_ CBR
$cbr61 set packet_size_ 1000;#??????
$cbr61 set rate_ 512Kb ;#??????
$cbr61 set random_ false
$ns at 1.0 "$cbr61 start"
$ns at 2.0 "$cbr61 stop"

#???62???(Ping)
set ping_a(62) [new Agent/Ping]
$ns attach-agent $node_(14) $ping_a(62)
set ping_b(62) [new Agent/Ping]
$ns attach-agent $node_(15) $ping_b(62)
$ns connect $ping_a(62) $ping_b(62)	;#????Ping Agents
$ns at 1.0 "$ping_a(62) send"	;#??Ping???

#???63???(FTP-TCP)
set tcp63 [new Agent/TCP/Newreno]
$tcp63 set class_ 2
set sink63 [new Agent/TCPSink]
$ns attach-agent $node_(15) $tcp63
$ns attach-agent $node_(16) $sink63
$ns connect $tcp63 $sink63
set ftp63 [new Application/FTP]
$ftp63 attach-agent $tcp63
$ns at 1.0 "$ftp63 start"
$ns at 2.0 "$ftp63 stop"

#???64???(CBR-UDP)
set udp64 [new Agent/UDP]
$ns attach-agent $node_(15) $udp64
set null64 [new Agent/Null]
$ns attach-agent $node_(16) $null64
$ns connect $udp64 $null64
$udp64 set fid_ 2	;#?NAM??UDP?????????
set cbr64 [new Application/Traffic/CBR]	;#?UDP??????CBR????
$cbr64 attach-agent $udp64
$cbr64 set type_ CBR
$cbr64 set packet_size_ 1000;#??????
$cbr64 set rate_ 512Kb ;#??????
$cbr64 set random_ false
$ns at 1.0 "$cbr64 start"
$ns at 2.0 "$cbr64 stop"

#???65???(Ping)
set ping_a(65) [new Agent/Ping]
$ns attach-agent $node_(15) $ping_a(65)
set ping_b(65) [new Agent/Ping]
$ns attach-agent $node_(16) $ping_b(65)
$ns connect $ping_a(65) $ping_b(65)	;#????Ping Agents
$ns at 1.0 "$ping_a(65) send"	;#??Ping???

#???66???(FTP-TCP)
set tcp66 [new Agent/TCP/Newreno]
$tcp66 set class_ 2
set sink66 [new Agent/TCPSink]
$ns attach-agent $node_(14) $tcp66
$ns attach-agent $node_(16) $sink66
$ns connect $tcp66 $sink66
set ftp66 [new Application/FTP]
$ftp66 attach-agent $tcp66
$ns at 1.0 "$ftp66 start"
$ns at 2.0 "$ftp66 stop"

#???67???(CBR-UDP)
set udp67 [new Agent/UDP]
$ns attach-agent $node_(14) $udp67
set null67 [new Agent/Null]
$ns attach-agent $node_(16) $null67
$ns connect $udp67 $null67
$udp67 set fid_ 2	;#?NAM??UDP?????????
set cbr67 [new Application/Traffic/CBR]	;#?UDP??????CBR????
$cbr67 attach-agent $udp67
$cbr67 set type_ CBR
$cbr67 set packet_size_ 1000;#??????
$cbr67 set rate_ 512Kb ;#??????
$cbr67 set random_ false
$ns at 1.0 "$cbr67 start"
$ns at 2.0 "$cbr67 stop"

#???68???(Ping)
set ping_a(68) [new Agent/Ping]
$ns attach-agent $node_(14) $ping_a(68)
set ping_b(68) [new Agent/Ping]
$ns attach-agent $node_(16) $ping_b(68)
$ns connect $ping_a(68) $ping_b(68)	;#????Ping Agents
$ns at 1.0 "$ping_a(68) send"	;#??Ping???

#???69???(FTP-TCP)
set tcp69 [new Agent/TCP/Newreno]
$tcp69 set class_ 2
set sink69 [new Agent/TCPSink]
$ns attach-agent $node_(15) $tcp69
$ns attach-agent $node_(17) $sink69
$ns connect $tcp69 $sink69
set ftp69 [new Application/FTP]
$ftp69 attach-agent $tcp69
$ns at 1.0 "$ftp69 start"
$ns at 2.0 "$ftp69 stop"

#???70???(CBR-UDP)
set udp70 [new Agent/UDP]
$ns attach-agent $node_(15) $udp70
set null70 [new Agent/Null]
$ns attach-agent $node_(17) $null70
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

#???71???(Ping)
set ping_a(71) [new Agent/Ping]
$ns attach-agent $node_(15) $ping_a(71)
set ping_b(71) [new Agent/Ping]
$ns attach-agent $node_(17) $ping_b(71)
$ns connect $ping_a(71) $ping_b(71)	;#????Ping Agents
$ns at 1.0 "$ping_a(71) send"	;#??Ping???

#???72???(FTP-TCP)
set tcp72 [new Agent/TCP/Newreno]
$tcp72 set class_ 2
set sink72 [new Agent/TCPSink]
$ns attach-agent $node_(17) $tcp72
$ns attach-agent $node_(18) $sink72
$ns connect $tcp72 $sink72
set ftp72 [new Application/FTP]
$ftp72 attach-agent $tcp72
$ns at 1.0 "$ftp72 start"
$ns at 2.0 "$ftp72 stop"

#???73???(CBR-UDP)
set udp73 [new Agent/UDP]
$ns attach-agent $node_(17) $udp73
set null73 [new Agent/Null]
$ns attach-agent $node_(18) $null73
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
$ns attach-agent $node_(17) $ping_a(74)
set ping_b(74) [new Agent/Ping]
$ns attach-agent $node_(18) $ping_b(74)
$ns connect $ping_a(74) $ping_b(74)	;#????Ping Agents
$ns at 1.0 "$ping_a(74) send"	;#??Ping???

#???75???(FTP-TCP)
set tcp75 [new Agent/TCP/Newreno]
$tcp75 set class_ 2
set sink75 [new Agent/TCPSink]
$ns attach-agent $node_(18) $tcp75
$ns attach-agent $node_(16) $sink75
$ns connect $tcp75 $sink75
set ftp75 [new Application/FTP]
$ftp75 attach-agent $tcp75
$ns at 1.0 "$ftp75 start"
$ns at 2.0 "$ftp75 stop"

#???76???(CBR-UDP)
set udp76 [new Agent/UDP]
$ns attach-agent $node_(18) $udp76
set null76 [new Agent/Null]
$ns attach-agent $node_(16) $null76
$ns connect $udp76 $null76
$udp76 set fid_ 2	;#?NAM??UDP?????????
set cbr76 [new Application/Traffic/CBR]	;#?UDP??????CBR????
$cbr76 attach-agent $udp76
$cbr76 set type_ CBR
$cbr76 set packet_size_ 1000;#??????
$cbr76 set rate_ 512Kb ;#??????
$cbr76 set random_ false
$ns at 1.0 "$cbr76 start"
$ns at 2.0 "$cbr76 stop"

#???77???(Ping)
set ping_a(77) [new Agent/Ping]
$ns attach-agent $node_(18) $ping_a(77)
set ping_b(77) [new Agent/Ping]
$ns attach-agent $node_(16) $ping_b(77)
$ns connect $ping_a(77) $ping_b(77)	;#????Ping Agents
$ns at 1.0 "$ping_a(77) send"	;#??Ping???

#???78???(FTP-TCP)
set tcp78 [new Agent/TCP/Newreno]
$tcp78 set class_ 2
set sink78 [new Agent/TCPSink]
$ns attach-agent $node_(18) $tcp78
$ns attach-agent $node_(19) $sink78
$ns connect $tcp78 $sink78
set ftp78 [new Application/FTP]
$ftp78 attach-agent $tcp78
$ns at 1.0 "$ftp78 start"
$ns at 2.0 "$ftp78 stop"

#???79???(CBR-UDP)
set udp79 [new Agent/UDP]
$ns attach-agent $node_(18) $udp79
set null79 [new Agent/Null]
$ns attach-agent $node_(19) $null79
$ns connect $udp79 $null79
$udp79 set fid_ 2	;#?NAM??UDP?????????
set cbr79 [new Application/Traffic/CBR]	;#?UDP??????CBR????
$cbr79 attach-agent $udp79
$cbr79 set type_ CBR
$cbr79 set packet_size_ 1000;#??????
$cbr79 set rate_ 512Kb ;#??????
$cbr79 set random_ false
$ns at 1.0 "$cbr79 start"
$ns at 2.0 "$cbr79 stop"

#???80???(Ping)
set ping_a(80) [new Agent/Ping]
$ns attach-agent $node_(18) $ping_a(80)
set ping_b(80) [new Agent/Ping]
$ns attach-agent $node_(19) $ping_b(80)
$ns connect $ping_a(80) $ping_b(80)	;#????Ping Agents
$ns at 1.0 "$ping_a(80) send"	;#??Ping???

#???81???(FTP-TCP)
set tcp81 [new Agent/TCP/Newreno]
$tcp81 set class_ 2
set sink81 [new Agent/TCPSink]
$ns attach-agent $node_(17) $tcp81
$ns attach-agent $node_(19) $sink81
$ns connect $tcp81 $sink81
set ftp81 [new Application/FTP]
$ftp81 attach-agent $tcp81
$ns at 1.0 "$ftp81 start"
$ns at 2.0 "$ftp81 stop"

#???82???(CBR-UDP)
set udp82 [new Agent/UDP]
$ns attach-agent $node_(17) $udp82
set null82 [new Agent/Null]
$ns attach-agent $node_(19) $null82
$ns connect $udp82 $null82
$udp82 set fid_ 2	;#?NAM??UDP?????????
set cbr82 [new Application/Traffic/CBR]	;#?UDP??????CBR????
$cbr82 attach-agent $udp82
$cbr82 set type_ CBR
$cbr82 set packet_size_ 1000;#??????
$cbr82 set rate_ 512Kb ;#??????
$cbr82 set random_ false
$ns at 1.0 "$cbr82 start"
$ns at 2.0 "$cbr82 stop"

#???83???(Ping)
set ping_a(83) [new Agent/Ping]
$ns attach-agent $node_(17) $ping_a(83)
set ping_b(83) [new Agent/Ping]
$ns attach-agent $node_(19) $ping_b(83)
$ns connect $ping_a(83) $ping_b(83)	;#????Ping Agents
$ns at 1.0 "$ping_a(83) send"	;#??Ping???

#???84???(Ping)
set ping_a(84) [new Agent/Ping]
$ns attach-agent $node_(1) $ping_a(84)
set ping_b(84) [new Agent/Ping]
$ns attach-agent $node_(6) $ping_b(84)
$ns connect $ping_a(84) $ping_b(84)	;#????Ping Agents
$ns at 1.0 "$ping_a(84) send"	;#??Ping???

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
