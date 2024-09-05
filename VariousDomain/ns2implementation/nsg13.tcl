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
set val(nn)     24        ;# number of mobilenodes
set val(rp)     TORA     ;# routing protocol
set val(x)      1000            ;# X dimension of topography
set val(y)      1000           ;# Y dimension of topography
set val(stop)   10.0 ;# time of simulation end

#===================================
#               ??????                         
#===================================

#??trace file
set ns            [new Simulator]	;#??ns simulator
set tracefd       [open mac_802_11_node_24_ftp_21_cbr_21_ping_573.tr w]	;#??trace file
set namtrace       [open mac_802_11_node_24_ftp_21_cbr_21_ping_573.nam w]	;#????nam trace file

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
$node_(0) set X_ 104
$node_(0) set Y_ 1022
$node_(0) set Z_ 0.0
$ns initial_node_pos $node_(0) 20

#???1?Node
set node_(1) [$ns node]
$node_(1) set X_ 202
$node_(1) set Y_ 1026
$node_(1) set Z_ 0.0
$ns initial_node_pos $node_(1) 20

#???2?Node
set node_(2) [$ns node]
$node_(2) set X_ 280
$node_(2) set Y_ 1032
$node_(2) set Z_ 0.0
$ns initial_node_pos $node_(2) 20

#???3?Node
set node_(3) [$ns node]
$node_(3) set X_ 356
$node_(3) set Y_ 1034
$node_(3) set Z_ 0.0
$ns initial_node_pos $node_(3) 20

#???4?Node
set node_(4) [$ns node]
$node_(4) set X_ 462
$node_(4) set Y_ 1032
$node_(4) set Z_ 0.0
$ns initial_node_pos $node_(4) 20

#???5?Node
set node_(5) [$ns node]
$node_(5) set X_ 558
$node_(5) set Y_ 1034
$node_(5) set Z_ 0.0
$ns initial_node_pos $node_(5) 20

#???6?Node
set node_(6) [$ns node]
$node_(6) set X_ 636
$node_(6) set Y_ 1034
$node_(6) set Z_ 0.0
$ns initial_node_pos $node_(6) 20

#???7?Node
set node_(7) [$ns node]
$node_(7) set X_ 730
$node_(7) set Y_ 1030
$node_(7) set Z_ 0.0
$ns initial_node_pos $node_(7) 20

#???8?Node
set node_(10) [$ns node]
$node_(10) set X_ 116
$node_(10) set Y_ 726
$node_(10) set Z_ 0.0
$ns initial_node_pos $node_(10) 20

#???9?Node
set node_(11) [$ns node]
$node_(11) set X_ 216
$node_(11) set Y_ 738
$node_(11) set Z_ 0.0
$ns initial_node_pos $node_(11) 20

#???10?Node
set node_(12) [$ns node]
$node_(12) set X_ 320
$node_(12) set Y_ 742
$node_(12) set Z_ 0.0
$ns initial_node_pos $node_(12) 20

#???11?Node
set node_(13) [$ns node]
$node_(13) set X_ 450
$node_(13) set Y_ 750
$node_(13) set Z_ 0.0
$ns initial_node_pos $node_(13) 20

#???12?Node
set node_(14) [$ns node]
$node_(14) set X_ 618
$node_(14) set Y_ 746
$node_(14) set Z_ 0.0
$ns initial_node_pos $node_(14) 20

#???13?Node
set node_(15) [$ns node]
$node_(15) set X_ 750
$node_(15) set Y_ 748
$node_(15) set Z_ 0.0
$ns initial_node_pos $node_(15) 20

#???14?Node
set node_(16) [$ns node]
$node_(16) set X_ 864
$node_(16) set Y_ 748
$node_(16) set Z_ 0.0
$ns initial_node_pos $node_(16) 20

#???15?Node
set node_(19) [$ns node]
$node_(19) set X_ 134
$node_(19) set Y_ 426
$node_(19) set Z_ 0.0
$ns initial_node_pos $node_(19) 20

#???16?Node
set node_(20) [$ns node]
$node_(20) set X_ 244
$node_(20) set Y_ 426
$node_(20) set Z_ 0.0
$ns initial_node_pos $node_(20) 20

#???17?Node
set node_(21) [$ns node]
$node_(21) set X_ 326
$node_(21) set Y_ 428
$node_(21) set Z_ 0.0
$ns initial_node_pos $node_(21) 20

#???18?Node
set node_(22) [$ns node]
$node_(22) set X_ 422
$node_(22) set Y_ 426
$node_(22) set Z_ 0.0
$ns initial_node_pos $node_(22) 20

#???19?Node
set node_(23) [$ns node]
$node_(23) set X_ 542
$node_(23) set Y_ 430
$node_(23) set Z_ 0.0
$ns initial_node_pos $node_(23) 20

#???20?Node
set node_(24) [$ns node]
$node_(24) set X_ 670
$node_(24) set Y_ 426
$node_(24) set Z_ 0.0
$ns initial_node_pos $node_(24) 20

#???21?Node
set node_(25) [$ns node]
$node_(25) set X_ 758
$node_(25) set Y_ 432
$node_(25) set Z_ 0.0
$ns initial_node_pos $node_(25) 20

#???22?Node
set node_(26) [$ns node]
$node_(26) set X_ 856
$node_(26) set Y_ 418
$node_(26) set Z_ 0.0
$ns initial_node_pos $node_(26) 20

#???23?Node
set node_(27) [$ns node]
$node_(27) set X_ 960
$node_(27) set Y_ 418
$node_(27) set Z_ 0.0
$ns initial_node_pos $node_(27) 20

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
$ns attach-agent $node_(10) $tcp21
$ns attach-agent $node_(11) $sink21
$ns connect $tcp21 $sink21
set ftp21 [new Application/FTP]
$ftp21 attach-agent $tcp21
$ns at 1.0 "$ftp21 start"
$ns at 2.0 "$ftp21 stop"

#???22???(CBR-UDP)
set udp22 [new Agent/UDP]
$ns attach-agent $node_(10) $udp22
set null22 [new Agent/Null]
$ns attach-agent $node_(11) $null22
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
$ns attach-agent $node_(10) $ping_a(23)
set ping_b(23) [new Agent/Ping]
$ns attach-agent $node_(11) $ping_b(23)
$ns connect $ping_a(23) $ping_b(23)	;#????Ping Agents
$ns at 1.0 "$ping_a(23) send"	;#??Ping???

#???24???(FTP-TCP)
set tcp24 [new Agent/TCP/Newreno]
$tcp24 set class_ 2
set sink24 [new Agent/TCPSink]
$ns attach-agent $node_(11) $tcp24
$ns attach-agent $node_(12) $sink24
$ns connect $tcp24 $sink24
set ftp24 [new Application/FTP]
$ftp24 attach-agent $tcp24
$ns at 1.0 "$ftp24 start"
$ns at 2.0 "$ftp24 stop"

#???25???(CBR-UDP)
set udp25 [new Agent/UDP]
$ns attach-agent $node_(11) $udp25
set null25 [new Agent/Null]
$ns attach-agent $node_(12) $null25
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
$ns attach-agent $node_(15) $ping_a(38)
set ping_b(38) [new Agent/Ping]
$ns attach-agent $node_(16) $ping_b(38)
$ns connect $ping_a(38) $ping_b(38)	;#????Ping Agents
$ns at 1.0 "$ping_a(38) send"	;#??Ping???

#???39???(FTP-TCP)
set tcp39 [new Agent/TCP/Newreno]
$tcp39 set class_ 2
set sink39 [new Agent/TCPSink]
$ns attach-agent $node_(19) $tcp39
$ns attach-agent $node_(20) $sink39
$ns connect $tcp39 $sink39
set ftp39 [new Application/FTP]
$ftp39 attach-agent $tcp39
$ns at 1.0 "$ftp39 start"
$ns at 2.0 "$ftp39 stop"

#???40???(FTP-TCP)
set tcp40 [new Agent/TCP/Newreno]
$tcp40 set class_ 2
set sink40 [new Agent/TCPSink]
$ns attach-agent $node_(20) $tcp40
$ns attach-agent $node_(21) $sink40
$ns connect $tcp40 $sink40
set ftp40 [new Application/FTP]
$ftp40 attach-agent $tcp40
$ns at 1.0 "$ftp40 start"
$ns at 2.0 "$ftp40 stop"

#???41???(FTP-TCP)
set tcp41 [new Agent/TCP/Newreno]
$tcp41 set class_ 2
set sink41 [new Agent/TCPSink]
$ns attach-agent $node_(21) $tcp41
$ns attach-agent $node_(22) $sink41
$ns connect $tcp41 $sink41
set ftp41 [new Application/FTP]
$ftp41 attach-agent $tcp41
$ns at 1.0 "$ftp41 start"
$ns at 2.0 "$ftp41 stop"

#???42???(FTP-TCP)
set tcp42 [new Agent/TCP/Newreno]
$tcp42 set class_ 2
set sink42 [new Agent/TCPSink]
$ns attach-agent $node_(22) $tcp42
$ns attach-agent $node_(23) $sink42
$ns connect $tcp42 $sink42
set ftp42 [new Application/FTP]
$ftp42 attach-agent $tcp42
$ns at 1.0 "$ftp42 start"
$ns at 2.0 "$ftp42 stop"

#???43???(FTP-TCP)
set tcp43 [new Agent/TCP/Newreno]
$tcp43 set class_ 2
set sink43 [new Agent/TCPSink]
$ns attach-agent $node_(23) $tcp43
$ns attach-agent $node_(24) $sink43
$ns connect $tcp43 $sink43
set ftp43 [new Application/FTP]
$ftp43 attach-agent $tcp43
$ns at 1.0 "$ftp43 start"
$ns at 2.0 "$ftp43 stop"

#???44???(FTP-TCP)
set tcp44 [new Agent/TCP/Newreno]
$tcp44 set class_ 2
set sink44 [new Agent/TCPSink]
$ns attach-agent $node_(24) $tcp44
$ns attach-agent $node_(25) $sink44
$ns connect $tcp44 $sink44
set ftp44 [new Application/FTP]
$ftp44 attach-agent $tcp44
$ns at 1.0 "$ftp44 start"
$ns at 2.0 "$ftp44 stop"

#???45???(FTP-TCP)
set tcp45 [new Agent/TCP/Newreno]
$tcp45 set class_ 2
set sink45 [new Agent/TCPSink]
$ns attach-agent $node_(25) $tcp45
$ns attach-agent $node_(26) $sink45
$ns connect $tcp45 $sink45
set ftp45 [new Application/FTP]
$ftp45 attach-agent $tcp45
$ns at 1.0 "$ftp45 start"
$ns at 2.0 "$ftp45 stop"

#???46???(FTP-TCP)
set tcp46 [new Agent/TCP/Newreno]
$tcp46 set class_ 2
set sink46 [new Agent/TCPSink]
$ns attach-agent $node_(26) $tcp46
$ns attach-agent $node_(27) $sink46
$ns connect $tcp46 $sink46
set ftp46 [new Application/FTP]
$ftp46 attach-agent $tcp46
$ns at 1.0 "$ftp46 start"
$ns at 2.0 "$ftp46 stop"

#???47???(CBR-UDP)
set udp47 [new Agent/UDP]
$ns attach-agent $node_(19) $udp47
set null47 [new Agent/Null]
$ns attach-agent $node_(20) $null47
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
$ns attach-agent $node_(20) $udp48
set null48 [new Agent/Null]
$ns attach-agent $node_(21) $null48
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
$ns attach-agent $node_(21) $udp49
set null49 [new Agent/Null]
$ns attach-agent $node_(22) $null49
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
$ns attach-agent $node_(22) $udp50
set null50 [new Agent/Null]
$ns attach-agent $node_(23) $null50
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
$ns attach-agent $node_(23) $udp51
set null51 [new Agent/Null]
$ns attach-agent $node_(24) $null51
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
$ns attach-agent $node_(24) $udp52
set null52 [new Agent/Null]
$ns attach-agent $node_(25) $null52
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
$ns attach-agent $node_(25) $udp53
set null53 [new Agent/Null]
$ns attach-agent $node_(26) $null53
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
$ns attach-agent $node_(26) $udp54
set null54 [new Agent/Null]
$ns attach-agent $node_(27) $null54
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

#???55???(Ping)
set ping_a(55) [new Agent/Ping]
$ns attach-agent $node_(19) $ping_a(55)
set ping_b(55) [new Agent/Ping]
$ns attach-agent $node_(20) $ping_b(55)
$ns connect $ping_a(55) $ping_b(55)	;#????Ping Agents
$ns at 1.0 "$ping_a(55) send"	;#??Ping???

#???56???(Ping)
set ping_a(56) [new Agent/Ping]
$ns attach-agent $node_(20) $ping_a(56)
set ping_b(56) [new Agent/Ping]
$ns attach-agent $node_(21) $ping_b(56)
$ns connect $ping_a(56) $ping_b(56)	;#????Ping Agents
$ns at 1.0 "$ping_a(56) send"	;#??Ping???

#???57???(Ping)
set ping_a(57) [new Agent/Ping]
$ns attach-agent $node_(21) $ping_a(57)
set ping_b(57) [new Agent/Ping]
$ns attach-agent $node_(22) $ping_b(57)
$ns connect $ping_a(57) $ping_b(57)	;#????Ping Agents
$ns at 1.0 "$ping_a(57) send"	;#??Ping???

#???58???(Ping)
set ping_a(58) [new Agent/Ping]
$ns attach-agent $node_(22) $ping_a(58)
set ping_b(58) [new Agent/Ping]
$ns attach-agent $node_(23) $ping_b(58)
$ns connect $ping_a(58) $ping_b(58)	;#????Ping Agents
$ns at 1.0 "$ping_a(58) send"	;#??Ping???

#???59???(Ping)
set ping_a(59) [new Agent/Ping]
$ns attach-agent $node_(23) $ping_a(59)
set ping_b(59) [new Agent/Ping]
$ns attach-agent $node_(24) $ping_b(59)
$ns connect $ping_a(59) $ping_b(59)	;#????Ping Agents
$ns at 1.0 "$ping_a(59) send"	;#??Ping???

#???60???(Ping)
set ping_a(60) [new Agent/Ping]
$ns attach-agent $node_(24) $ping_a(60)
set ping_b(60) [new Agent/Ping]
$ns attach-agent $node_(25) $ping_b(60)
$ns connect $ping_a(60) $ping_b(60)	;#????Ping Agents
$ns at 1.0 "$ping_a(60) send"	;#??Ping???

#???61???(Ping)
set ping_a(61) [new Agent/Ping]
$ns attach-agent $node_(25) $ping_a(61)
set ping_b(61) [new Agent/Ping]
$ns attach-agent $node_(26) $ping_b(61)
$ns connect $ping_a(61) $ping_b(61)	;#????Ping Agents
$ns at 1.0 "$ping_a(61) send"	;#??Ping???

#???62???(Ping)
set ping_a(62) [new Agent/Ping]
$ns attach-agent $node_(26) $ping_a(62)
set ping_b(62) [new Agent/Ping]
$ns attach-agent $node_(27) $ping_b(62)
$ns connect $ping_a(62) $ping_b(62)	;#????Ping Agents
$ns at 1.0 "$ping_a(62) send"	;#??Ping???

#???63???(Ping)
set ping_a(63) [new Agent/Ping]
$ns attach-agent $node_(0) $ping_a(63)
set ping_b(63) [new Agent/Ping]
$ns attach-agent $node_(1) $ping_b(63)
$ns connect $ping_a(63) $ping_b(63)	;#????Ping Agents
$ns at 1.0 "$ping_a(63) send"	;#??Ping???

#???64???(Ping)
set ping_a(64) [new Agent/Ping]
$ns attach-agent $node_(0) $ping_a(64)
set ping_b(64) [new Agent/Ping]
$ns attach-agent $node_(2) $ping_b(64)
$ns connect $ping_a(64) $ping_b(64)	;#????Ping Agents
$ns at 1.0 "$ping_a(64) send"	;#??Ping???

#???65???(Ping)
set ping_a(65) [new Agent/Ping]
$ns attach-agent $node_(0) $ping_a(65)
set ping_b(65) [new Agent/Ping]
$ns attach-agent $node_(3) $ping_b(65)
$ns connect $ping_a(65) $ping_b(65)	;#????Ping Agents
$ns at 1.0 "$ping_a(65) send"	;#??Ping???

#???66???(Ping)
set ping_a(66) [new Agent/Ping]
$ns attach-agent $node_(0) $ping_a(66)
set ping_b(66) [new Agent/Ping]
$ns attach-agent $node_(4) $ping_b(66)
$ns connect $ping_a(66) $ping_b(66)	;#????Ping Agents
$ns at 1.0 "$ping_a(66) send"	;#??Ping???

#???67???(Ping)
set ping_a(67) [new Agent/Ping]
$ns attach-agent $node_(0) $ping_a(67)
set ping_b(67) [new Agent/Ping]
$ns attach-agent $node_(5) $ping_b(67)
$ns connect $ping_a(67) $ping_b(67)	;#????Ping Agents
$ns at 1.0 "$ping_a(67) send"	;#??Ping???

#???68???(Ping)
set ping_a(68) [new Agent/Ping]
$ns attach-agent $node_(0) $ping_a(68)
set ping_b(68) [new Agent/Ping]
$ns attach-agent $node_(6) $ping_b(68)
$ns connect $ping_a(68) $ping_b(68)	;#????Ping Agents
$ns at 1.0 "$ping_a(68) send"	;#??Ping???

#???69???(Ping)
set ping_a(69) [new Agent/Ping]
$ns attach-agent $node_(0) $ping_a(69)
set ping_b(69) [new Agent/Ping]
$ns attach-agent $node_(7) $ping_b(69)
$ns connect $ping_a(69) $ping_b(69)	;#????Ping Agents
$ns at 1.0 "$ping_a(69) send"	;#??Ping???

#???70???(Ping)
set ping_a(70) [new Agent/Ping]
$ns attach-agent $node_(0) $ping_a(70)
set ping_b(70) [new Agent/Ping]
$ns attach-agent $node_(10) $ping_b(70)
$ns connect $ping_a(70) $ping_b(70)	;#????Ping Agents
$ns at 1.0 "$ping_a(70) send"	;#??Ping???

#???71???(Ping)
set ping_a(71) [new Agent/Ping]
$ns attach-agent $node_(0) $ping_a(71)
set ping_b(71) [new Agent/Ping]
$ns attach-agent $node_(11) $ping_b(71)
$ns connect $ping_a(71) $ping_b(71)	;#????Ping Agents
$ns at 1.0 "$ping_a(71) send"	;#??Ping???

#???72???(Ping)
set ping_a(72) [new Agent/Ping]
$ns attach-agent $node_(0) $ping_a(72)
set ping_b(72) [new Agent/Ping]
$ns attach-agent $node_(12) $ping_b(72)
$ns connect $ping_a(72) $ping_b(72)	;#????Ping Agents
$ns at 1.0 "$ping_a(72) send"	;#??Ping???

#???73???(Ping)
set ping_a(73) [new Agent/Ping]
$ns attach-agent $node_(0) $ping_a(73)
set ping_b(73) [new Agent/Ping]
$ns attach-agent $node_(13) $ping_b(73)
$ns connect $ping_a(73) $ping_b(73)	;#????Ping Agents
$ns at 1.0 "$ping_a(73) send"	;#??Ping???

#???74???(Ping)
set ping_a(74) [new Agent/Ping]
$ns attach-agent $node_(0) $ping_a(74)
set ping_b(74) [new Agent/Ping]
$ns attach-agent $node_(14) $ping_b(74)
$ns connect $ping_a(74) $ping_b(74)	;#????Ping Agents
$ns at 1.0 "$ping_a(74) send"	;#??Ping???

#???75???(Ping)
set ping_a(75) [new Agent/Ping]
$ns attach-agent $node_(0) $ping_a(75)
set ping_b(75) [new Agent/Ping]
$ns attach-agent $node_(15) $ping_b(75)
$ns connect $ping_a(75) $ping_b(75)	;#????Ping Agents
$ns at 1.0 "$ping_a(75) send"	;#??Ping???

#???76???(Ping)
set ping_a(76) [new Agent/Ping]
$ns attach-agent $node_(0) $ping_a(76)
set ping_b(76) [new Agent/Ping]
$ns attach-agent $node_(16) $ping_b(76)
$ns connect $ping_a(76) $ping_b(76)	;#????Ping Agents
$ns at 1.0 "$ping_a(76) send"	;#??Ping???

#???77???(Ping)
set ping_a(77) [new Agent/Ping]
$ns attach-agent $node_(0) $ping_a(77)
set ping_b(77) [new Agent/Ping]
$ns attach-agent $node_(19) $ping_b(77)
$ns connect $ping_a(77) $ping_b(77)	;#????Ping Agents
$ns at 1.0 "$ping_a(77) send"	;#??Ping???

#???78???(Ping)
set ping_a(78) [new Agent/Ping]
$ns attach-agent $node_(0) $ping_a(78)
set ping_b(78) [new Agent/Ping]
$ns attach-agent $node_(20) $ping_b(78)
$ns connect $ping_a(78) $ping_b(78)	;#????Ping Agents
$ns at 1.0 "$ping_a(78) send"	;#??Ping???

#???79???(Ping)
set ping_a(79) [new Agent/Ping]
$ns attach-agent $node_(0) $ping_a(79)
set ping_b(79) [new Agent/Ping]
$ns attach-agent $node_(21) $ping_b(79)
$ns connect $ping_a(79) $ping_b(79)	;#????Ping Agents
$ns at 1.0 "$ping_a(79) send"	;#??Ping???

#???80???(Ping)
set ping_a(80) [new Agent/Ping]
$ns attach-agent $node_(0) $ping_a(80)
set ping_b(80) [new Agent/Ping]
$ns attach-agent $node_(22) $ping_b(80)
$ns connect $ping_a(80) $ping_b(80)	;#????Ping Agents
$ns at 1.0 "$ping_a(80) send"	;#??Ping???

#???81???(Ping)
set ping_a(81) [new Agent/Ping]
$ns attach-agent $node_(0) $ping_a(81)
set ping_b(81) [new Agent/Ping]
$ns attach-agent $node_(23) $ping_b(81)
$ns connect $ping_a(81) $ping_b(81)	;#????Ping Agents
$ns at 1.0 "$ping_a(81) send"	;#??Ping???

#???82???(Ping)
set ping_a(82) [new Agent/Ping]
$ns attach-agent $node_(0) $ping_a(82)
set ping_b(82) [new Agent/Ping]
$ns attach-agent $node_(24) $ping_b(82)
$ns connect $ping_a(82) $ping_b(82)	;#????Ping Agents
$ns at 1.0 "$ping_a(82) send"	;#??Ping???

#???83???(Ping)
set ping_a(83) [new Agent/Ping]
$ns attach-agent $node_(0) $ping_a(83)
set ping_b(83) [new Agent/Ping]
$ns attach-agent $node_(25) $ping_b(83)
$ns connect $ping_a(83) $ping_b(83)	;#????Ping Agents
$ns at 1.0 "$ping_a(83) send"	;#??Ping???

#???84???(Ping)
set ping_a(84) [new Agent/Ping]
$ns attach-agent $node_(0) $ping_a(84)
set ping_b(84) [new Agent/Ping]
$ns attach-agent $node_(26) $ping_b(84)
$ns connect $ping_a(84) $ping_b(84)	;#????Ping Agents
$ns at 1.0 "$ping_a(84) send"	;#??Ping???

#???85???(Ping)
set ping_a(85) [new Agent/Ping]
$ns attach-agent $node_(0) $ping_a(85)
set ping_b(85) [new Agent/Ping]
$ns attach-agent $node_(27) $ping_b(85)
$ns connect $ping_a(85) $ping_b(85)	;#????Ping Agents
$ns at 1.0 "$ping_a(85) send"	;#??Ping???

#???86???(Ping)
set ping_a(86) [new Agent/Ping]
$ns attach-agent $node_(1) $ping_a(86)
set ping_b(86) [new Agent/Ping]
$ns attach-agent $node_(0) $ping_b(86)
$ns connect $ping_a(86) $ping_b(86)	;#????Ping Agents
$ns at 1.0 "$ping_a(86) send"	;#??Ping???

#???87???(Ping)
set ping_a(87) [new Agent/Ping]
$ns attach-agent $node_(1) $ping_a(87)
set ping_b(87) [new Agent/Ping]
$ns attach-agent $node_(2) $ping_b(87)
$ns connect $ping_a(87) $ping_b(87)	;#????Ping Agents
$ns at 1.0 "$ping_a(87) send"	;#??Ping???

#???88???(Ping)
set ping_a(88) [new Agent/Ping]
$ns attach-agent $node_(1) $ping_a(88)
set ping_b(88) [new Agent/Ping]
$ns attach-agent $node_(3) $ping_b(88)
$ns connect $ping_a(88) $ping_b(88)	;#????Ping Agents
$ns at 1.0 "$ping_a(88) send"	;#??Ping???

#???89???(Ping)
set ping_a(89) [new Agent/Ping]
$ns attach-agent $node_(1) $ping_a(89)
set ping_b(89) [new Agent/Ping]
$ns attach-agent $node_(4) $ping_b(89)
$ns connect $ping_a(89) $ping_b(89)	;#????Ping Agents
$ns at 1.0 "$ping_a(89) send"	;#??Ping???

#???90???(Ping)
set ping_a(90) [new Agent/Ping]
$ns attach-agent $node_(1) $ping_a(90)
set ping_b(90) [new Agent/Ping]
$ns attach-agent $node_(5) $ping_b(90)
$ns connect $ping_a(90) $ping_b(90)	;#????Ping Agents
$ns at 1.0 "$ping_a(90) send"	;#??Ping???

#???91???(Ping)
set ping_a(91) [new Agent/Ping]
$ns attach-agent $node_(1) $ping_a(91)
set ping_b(91) [new Agent/Ping]
$ns attach-agent $node_(6) $ping_b(91)
$ns connect $ping_a(91) $ping_b(91)	;#????Ping Agents
$ns at 1.0 "$ping_a(91) send"	;#??Ping???

#???92???(Ping)
set ping_a(92) [new Agent/Ping]
$ns attach-agent $node_(1) $ping_a(92)
set ping_b(92) [new Agent/Ping]
$ns attach-agent $node_(7) $ping_b(92)
$ns connect $ping_a(92) $ping_b(92)	;#????Ping Agents
$ns at 1.0 "$ping_a(92) send"	;#??Ping???

#???93???(Ping)
set ping_a(93) [new Agent/Ping]
$ns attach-agent $node_(1) $ping_a(93)
set ping_b(93) [new Agent/Ping]
$ns attach-agent $node_(10) $ping_b(93)
$ns connect $ping_a(93) $ping_b(93)	;#????Ping Agents
$ns at 1.0 "$ping_a(93) send"	;#??Ping???

#???94???(Ping)
set ping_a(94) [new Agent/Ping]
$ns attach-agent $node_(1) $ping_a(94)
set ping_b(94) [new Agent/Ping]
$ns attach-agent $node_(11) $ping_b(94)
$ns connect $ping_a(94) $ping_b(94)	;#????Ping Agents
$ns at 1.0 "$ping_a(94) send"	;#??Ping???

#???95???(Ping)
set ping_a(95) [new Agent/Ping]
$ns attach-agent $node_(1) $ping_a(95)
set ping_b(95) [new Agent/Ping]
$ns attach-agent $node_(12) $ping_b(95)
$ns connect $ping_a(95) $ping_b(95)	;#????Ping Agents
$ns at 1.0 "$ping_a(95) send"	;#??Ping???

#???96???(Ping)
set ping_a(96) [new Agent/Ping]
$ns attach-agent $node_(1) $ping_a(96)
set ping_b(96) [new Agent/Ping]
$ns attach-agent $node_(13) $ping_b(96)
$ns connect $ping_a(96) $ping_b(96)	;#????Ping Agents
$ns at 1.0 "$ping_a(96) send"	;#??Ping???

#???97???(Ping)
set ping_a(97) [new Agent/Ping]
$ns attach-agent $node_(1) $ping_a(97)
set ping_b(97) [new Agent/Ping]
$ns attach-agent $node_(14) $ping_b(97)
$ns connect $ping_a(97) $ping_b(97)	;#????Ping Agents
$ns at 1.0 "$ping_a(97) send"	;#??Ping???

#???98???(Ping)
set ping_a(98) [new Agent/Ping]
$ns attach-agent $node_(1) $ping_a(98)
set ping_b(98) [new Agent/Ping]
$ns attach-agent $node_(15) $ping_b(98)
$ns connect $ping_a(98) $ping_b(98)	;#????Ping Agents
$ns at 1.0 "$ping_a(98) send"	;#??Ping???

#???99???(Ping)
set ping_a(99) [new Agent/Ping]
$ns attach-agent $node_(1) $ping_a(99)
set ping_b(99) [new Agent/Ping]
$ns attach-agent $node_(16) $ping_b(99)
$ns connect $ping_a(99) $ping_b(99)	;#????Ping Agents
$ns at 1.0 "$ping_a(99) send"	;#??Ping???

#???100???(Ping)
set ping_a(100) [new Agent/Ping]
$ns attach-agent $node_(1) $ping_a(100)
set ping_b(100) [new Agent/Ping]
$ns attach-agent $node_(19) $ping_b(100)
$ns connect $ping_a(100) $ping_b(100)	;#????Ping Agents
$ns at 1.0 "$ping_a(100) send"	;#??Ping???

#???101???(Ping)
set ping_a(101) [new Agent/Ping]
$ns attach-agent $node_(1) $ping_a(101)
set ping_b(101) [new Agent/Ping]
$ns attach-agent $node_(20) $ping_b(101)
$ns connect $ping_a(101) $ping_b(101)	;#????Ping Agents
$ns at 1.0 "$ping_a(101) send"	;#??Ping???

#???102???(Ping)
set ping_a(102) [new Agent/Ping]
$ns attach-agent $node_(1) $ping_a(102)
set ping_b(102) [new Agent/Ping]
$ns attach-agent $node_(21) $ping_b(102)
$ns connect $ping_a(102) $ping_b(102)	;#????Ping Agents
$ns at 1.0 "$ping_a(102) send"	;#??Ping???

#???103???(Ping)
set ping_a(103) [new Agent/Ping]
$ns attach-agent $node_(1) $ping_a(103)
set ping_b(103) [new Agent/Ping]
$ns attach-agent $node_(22) $ping_b(103)
$ns connect $ping_a(103) $ping_b(103)	;#????Ping Agents
$ns at 1.0 "$ping_a(103) send"	;#??Ping???

#???104???(Ping)
set ping_a(104) [new Agent/Ping]
$ns attach-agent $node_(1) $ping_a(104)
set ping_b(104) [new Agent/Ping]
$ns attach-agent $node_(23) $ping_b(104)
$ns connect $ping_a(104) $ping_b(104)	;#????Ping Agents
$ns at 1.0 "$ping_a(104) send"	;#??Ping???

#???105???(Ping)
set ping_a(105) [new Agent/Ping]
$ns attach-agent $node_(1) $ping_a(105)
set ping_b(105) [new Agent/Ping]
$ns attach-agent $node_(24) $ping_b(105)
$ns connect $ping_a(105) $ping_b(105)	;#????Ping Agents
$ns at 1.0 "$ping_a(105) send"	;#??Ping???

#???106???(Ping)
set ping_a(106) [new Agent/Ping]
$ns attach-agent $node_(1) $ping_a(106)
set ping_b(106) [new Agent/Ping]
$ns attach-agent $node_(25) $ping_b(106)
$ns connect $ping_a(106) $ping_b(106)	;#????Ping Agents
$ns at 1.0 "$ping_a(106) send"	;#??Ping???

#???107???(Ping)
set ping_a(107) [new Agent/Ping]
$ns attach-agent $node_(1) $ping_a(107)
set ping_b(107) [new Agent/Ping]
$ns attach-agent $node_(26) $ping_b(107)
$ns connect $ping_a(107) $ping_b(107)	;#????Ping Agents
$ns at 1.0 "$ping_a(107) send"	;#??Ping???

#???108???(Ping)
set ping_a(108) [new Agent/Ping]
$ns attach-agent $node_(1) $ping_a(108)
set ping_b(108) [new Agent/Ping]
$ns attach-agent $node_(27) $ping_b(108)
$ns connect $ping_a(108) $ping_b(108)	;#????Ping Agents
$ns at 1.0 "$ping_a(108) send"	;#??Ping???

#???109???(Ping)
set ping_a(109) [new Agent/Ping]
$ns attach-agent $node_(2) $ping_a(109)
set ping_b(109) [new Agent/Ping]
$ns attach-agent $node_(0) $ping_b(109)
$ns connect $ping_a(109) $ping_b(109)	;#????Ping Agents
$ns at 1.0 "$ping_a(109) send"	;#??Ping???

#???110???(Ping)
set ping_a(110) [new Agent/Ping]
$ns attach-agent $node_(2) $ping_a(110)
set ping_b(110) [new Agent/Ping]
$ns attach-agent $node_(1) $ping_b(110)
$ns connect $ping_a(110) $ping_b(110)	;#????Ping Agents
$ns at 1.0 "$ping_a(110) send"	;#??Ping???

#???111???(Ping)
set ping_a(111) [new Agent/Ping]
$ns attach-agent $node_(2) $ping_a(111)
set ping_b(111) [new Agent/Ping]
$ns attach-agent $node_(3) $ping_b(111)
$ns connect $ping_a(111) $ping_b(111)	;#????Ping Agents
$ns at 1.0 "$ping_a(111) send"	;#??Ping???

#???112???(Ping)
set ping_a(112) [new Agent/Ping]
$ns attach-agent $node_(2) $ping_a(112)
set ping_b(112) [new Agent/Ping]
$ns attach-agent $node_(4) $ping_b(112)
$ns connect $ping_a(112) $ping_b(112)	;#????Ping Agents
$ns at 1.0 "$ping_a(112) send"	;#??Ping???

#???113???(Ping)
set ping_a(113) [new Agent/Ping]
$ns attach-agent $node_(2) $ping_a(113)
set ping_b(113) [new Agent/Ping]
$ns attach-agent $node_(5) $ping_b(113)
$ns connect $ping_a(113) $ping_b(113)	;#????Ping Agents
$ns at 1.0 "$ping_a(113) send"	;#??Ping???

#???114???(Ping)
set ping_a(114) [new Agent/Ping]
$ns attach-agent $node_(2) $ping_a(114)
set ping_b(114) [new Agent/Ping]
$ns attach-agent $node_(6) $ping_b(114)
$ns connect $ping_a(114) $ping_b(114)	;#????Ping Agents
$ns at 1.0 "$ping_a(114) send"	;#??Ping???

#???115???(Ping)
set ping_a(115) [new Agent/Ping]
$ns attach-agent $node_(2) $ping_a(115)
set ping_b(115) [new Agent/Ping]
$ns attach-agent $node_(7) $ping_b(115)
$ns connect $ping_a(115) $ping_b(115)	;#????Ping Agents
$ns at 1.0 "$ping_a(115) send"	;#??Ping???

#???116???(Ping)
set ping_a(116) [new Agent/Ping]
$ns attach-agent $node_(2) $ping_a(116)
set ping_b(116) [new Agent/Ping]
$ns attach-agent $node_(10) $ping_b(116)
$ns connect $ping_a(116) $ping_b(116)	;#????Ping Agents
$ns at 1.0 "$ping_a(116) send"	;#??Ping???

#???117???(Ping)
set ping_a(117) [new Agent/Ping]
$ns attach-agent $node_(2) $ping_a(117)
set ping_b(117) [new Agent/Ping]
$ns attach-agent $node_(11) $ping_b(117)
$ns connect $ping_a(117) $ping_b(117)	;#????Ping Agents
$ns at 1.0 "$ping_a(117) send"	;#??Ping???

#???118???(Ping)
set ping_a(118) [new Agent/Ping]
$ns attach-agent $node_(2) $ping_a(118)
set ping_b(118) [new Agent/Ping]
$ns attach-agent $node_(12) $ping_b(118)
$ns connect $ping_a(118) $ping_b(118)	;#????Ping Agents
$ns at 1.0 "$ping_a(118) send"	;#??Ping???

#???119???(Ping)
set ping_a(119) [new Agent/Ping]
$ns attach-agent $node_(2) $ping_a(119)
set ping_b(119) [new Agent/Ping]
$ns attach-agent $node_(13) $ping_b(119)
$ns connect $ping_a(119) $ping_b(119)	;#????Ping Agents
$ns at 1.0 "$ping_a(119) send"	;#??Ping???

#???120???(Ping)
set ping_a(120) [new Agent/Ping]
$ns attach-agent $node_(2) $ping_a(120)
set ping_b(120) [new Agent/Ping]
$ns attach-agent $node_(14) $ping_b(120)
$ns connect $ping_a(120) $ping_b(120)	;#????Ping Agents
$ns at 1.0 "$ping_a(120) send"	;#??Ping???

#???121???(Ping)
set ping_a(121) [new Agent/Ping]
$ns attach-agent $node_(2) $ping_a(121)
set ping_b(121) [new Agent/Ping]
$ns attach-agent $node_(15) $ping_b(121)
$ns connect $ping_a(121) $ping_b(121)	;#????Ping Agents
$ns at 1.0 "$ping_a(121) send"	;#??Ping???

#???122???(Ping)
set ping_a(122) [new Agent/Ping]
$ns attach-agent $node_(2) $ping_a(122)
set ping_b(122) [new Agent/Ping]
$ns attach-agent $node_(16) $ping_b(122)
$ns connect $ping_a(122) $ping_b(122)	;#????Ping Agents
$ns at 1.0 "$ping_a(122) send"	;#??Ping???

#???123???(Ping)
set ping_a(123) [new Agent/Ping]
$ns attach-agent $node_(2) $ping_a(123)
set ping_b(123) [new Agent/Ping]
$ns attach-agent $node_(19) $ping_b(123)
$ns connect $ping_a(123) $ping_b(123)	;#????Ping Agents
$ns at 1.0 "$ping_a(123) send"	;#??Ping???

#???124???(Ping)
set ping_a(124) [new Agent/Ping]
$ns attach-agent $node_(2) $ping_a(124)
set ping_b(124) [new Agent/Ping]
$ns attach-agent $node_(20) $ping_b(124)
$ns connect $ping_a(124) $ping_b(124)	;#????Ping Agents
$ns at 1.0 "$ping_a(124) send"	;#??Ping???

#???125???(Ping)
set ping_a(125) [new Agent/Ping]
$ns attach-agent $node_(2) $ping_a(125)
set ping_b(125) [new Agent/Ping]
$ns attach-agent $node_(21) $ping_b(125)
$ns connect $ping_a(125) $ping_b(125)	;#????Ping Agents
$ns at 1.0 "$ping_a(125) send"	;#??Ping???

#???126???(Ping)
set ping_a(126) [new Agent/Ping]
$ns attach-agent $node_(2) $ping_a(126)
set ping_b(126) [new Agent/Ping]
$ns attach-agent $node_(22) $ping_b(126)
$ns connect $ping_a(126) $ping_b(126)	;#????Ping Agents
$ns at 1.0 "$ping_a(126) send"	;#??Ping???

#???127???(Ping)
set ping_a(127) [new Agent/Ping]
$ns attach-agent $node_(2) $ping_a(127)
set ping_b(127) [new Agent/Ping]
$ns attach-agent $node_(23) $ping_b(127)
$ns connect $ping_a(127) $ping_b(127)	;#????Ping Agents
$ns at 1.0 "$ping_a(127) send"	;#??Ping???

#???128???(Ping)
set ping_a(128) [new Agent/Ping]
$ns attach-agent $node_(2) $ping_a(128)
set ping_b(128) [new Agent/Ping]
$ns attach-agent $node_(24) $ping_b(128)
$ns connect $ping_a(128) $ping_b(128)	;#????Ping Agents
$ns at 1.0 "$ping_a(128) send"	;#??Ping???

#???129???(Ping)
set ping_a(129) [new Agent/Ping]
$ns attach-agent $node_(2) $ping_a(129)
set ping_b(129) [new Agent/Ping]
$ns attach-agent $node_(25) $ping_b(129)
$ns connect $ping_a(129) $ping_b(129)	;#????Ping Agents
$ns at 1.0 "$ping_a(129) send"	;#??Ping???

#???130???(Ping)
set ping_a(130) [new Agent/Ping]
$ns attach-agent $node_(2) $ping_a(130)
set ping_b(130) [new Agent/Ping]
$ns attach-agent $node_(26) $ping_b(130)
$ns connect $ping_a(130) $ping_b(130)	;#????Ping Agents
$ns at 1.0 "$ping_a(130) send"	;#??Ping???

#???131???(Ping)
set ping_a(131) [new Agent/Ping]
$ns attach-agent $node_(2) $ping_a(131)
set ping_b(131) [new Agent/Ping]
$ns attach-agent $node_(27) $ping_b(131)
$ns connect $ping_a(131) $ping_b(131)	;#????Ping Agents
$ns at 1.0 "$ping_a(131) send"	;#??Ping???

#???132???(Ping)
set ping_a(132) [new Agent/Ping]
$ns attach-agent $node_(3) $ping_a(132)
set ping_b(132) [new Agent/Ping]
$ns attach-agent $node_(0) $ping_b(132)
$ns connect $ping_a(132) $ping_b(132)	;#????Ping Agents
$ns at 1.0 "$ping_a(132) send"	;#??Ping???

#???133???(Ping)
set ping_a(133) [new Agent/Ping]
$ns attach-agent $node_(3) $ping_a(133)
set ping_b(133) [new Agent/Ping]
$ns attach-agent $node_(1) $ping_b(133)
$ns connect $ping_a(133) $ping_b(133)	;#????Ping Agents
$ns at 1.0 "$ping_a(133) send"	;#??Ping???

#???134???(Ping)
set ping_a(134) [new Agent/Ping]
$ns attach-agent $node_(3) $ping_a(134)
set ping_b(134) [new Agent/Ping]
$ns attach-agent $node_(2) $ping_b(134)
$ns connect $ping_a(134) $ping_b(134)	;#????Ping Agents
$ns at 1.0 "$ping_a(134) send"	;#??Ping???

#???135???(Ping)
set ping_a(135) [new Agent/Ping]
$ns attach-agent $node_(3) $ping_a(135)
set ping_b(135) [new Agent/Ping]
$ns attach-agent $node_(4) $ping_b(135)
$ns connect $ping_a(135) $ping_b(135)	;#????Ping Agents
$ns at 1.0 "$ping_a(135) send"	;#??Ping???

#???136???(Ping)
set ping_a(136) [new Agent/Ping]
$ns attach-agent $node_(3) $ping_a(136)
set ping_b(136) [new Agent/Ping]
$ns attach-agent $node_(5) $ping_b(136)
$ns connect $ping_a(136) $ping_b(136)	;#????Ping Agents
$ns at 1.0 "$ping_a(136) send"	;#??Ping???

#???137???(Ping)
set ping_a(137) [new Agent/Ping]
$ns attach-agent $node_(3) $ping_a(137)
set ping_b(137) [new Agent/Ping]
$ns attach-agent $node_(6) $ping_b(137)
$ns connect $ping_a(137) $ping_b(137)	;#????Ping Agents
$ns at 1.0 "$ping_a(137) send"	;#??Ping???

#???138???(Ping)
set ping_a(138) [new Agent/Ping]
$ns attach-agent $node_(3) $ping_a(138)
set ping_b(138) [new Agent/Ping]
$ns attach-agent $node_(7) $ping_b(138)
$ns connect $ping_a(138) $ping_b(138)	;#????Ping Agents
$ns at 1.0 "$ping_a(138) send"	;#??Ping???

#???139???(Ping)
set ping_a(139) [new Agent/Ping]
$ns attach-agent $node_(3) $ping_a(139)
set ping_b(139) [new Agent/Ping]
$ns attach-agent $node_(10) $ping_b(139)
$ns connect $ping_a(139) $ping_b(139)	;#????Ping Agents
$ns at 1.0 "$ping_a(139) send"	;#??Ping???

#???140???(Ping)
set ping_a(140) [new Agent/Ping]
$ns attach-agent $node_(3) $ping_a(140)
set ping_b(140) [new Agent/Ping]
$ns attach-agent $node_(11) $ping_b(140)
$ns connect $ping_a(140) $ping_b(140)	;#????Ping Agents
$ns at 1.0 "$ping_a(140) send"	;#??Ping???

#???141???(Ping)
set ping_a(141) [new Agent/Ping]
$ns attach-agent $node_(3) $ping_a(141)
set ping_b(141) [new Agent/Ping]
$ns attach-agent $node_(12) $ping_b(141)
$ns connect $ping_a(141) $ping_b(141)	;#????Ping Agents
$ns at 1.0 "$ping_a(141) send"	;#??Ping???

#???142???(Ping)
set ping_a(142) [new Agent/Ping]
$ns attach-agent $node_(3) $ping_a(142)
set ping_b(142) [new Agent/Ping]
$ns attach-agent $node_(13) $ping_b(142)
$ns connect $ping_a(142) $ping_b(142)	;#????Ping Agents
$ns at 1.0 "$ping_a(142) send"	;#??Ping???

#???143???(Ping)
set ping_a(143) [new Agent/Ping]
$ns attach-agent $node_(3) $ping_a(143)
set ping_b(143) [new Agent/Ping]
$ns attach-agent $node_(14) $ping_b(143)
$ns connect $ping_a(143) $ping_b(143)	;#????Ping Agents
$ns at 1.0 "$ping_a(143) send"	;#??Ping???

#???144???(Ping)
set ping_a(144) [new Agent/Ping]
$ns attach-agent $node_(3) $ping_a(144)
set ping_b(144) [new Agent/Ping]
$ns attach-agent $node_(15) $ping_b(144)
$ns connect $ping_a(144) $ping_b(144)	;#????Ping Agents
$ns at 1.0 "$ping_a(144) send"	;#??Ping???

#???145???(Ping)
set ping_a(145) [new Agent/Ping]
$ns attach-agent $node_(3) $ping_a(145)
set ping_b(145) [new Agent/Ping]
$ns attach-agent $node_(16) $ping_b(145)
$ns connect $ping_a(145) $ping_b(145)	;#????Ping Agents
$ns at 1.0 "$ping_a(145) send"	;#??Ping???

#???146???(Ping)
set ping_a(146) [new Agent/Ping]
$ns attach-agent $node_(3) $ping_a(146)
set ping_b(146) [new Agent/Ping]
$ns attach-agent $node_(19) $ping_b(146)
$ns connect $ping_a(146) $ping_b(146)	;#????Ping Agents
$ns at 1.0 "$ping_a(146) send"	;#??Ping???

#???147???(Ping)
set ping_a(147) [new Agent/Ping]
$ns attach-agent $node_(3) $ping_a(147)
set ping_b(147) [new Agent/Ping]
$ns attach-agent $node_(20) $ping_b(147)
$ns connect $ping_a(147) $ping_b(147)	;#????Ping Agents
$ns at 1.0 "$ping_a(147) send"	;#??Ping???

#???148???(Ping)
set ping_a(148) [new Agent/Ping]
$ns attach-agent $node_(3) $ping_a(148)
set ping_b(148) [new Agent/Ping]
$ns attach-agent $node_(21) $ping_b(148)
$ns connect $ping_a(148) $ping_b(148)	;#????Ping Agents
$ns at 1.0 "$ping_a(148) send"	;#??Ping???

#???149???(Ping)
set ping_a(149) [new Agent/Ping]
$ns attach-agent $node_(3) $ping_a(149)
set ping_b(149) [new Agent/Ping]
$ns attach-agent $node_(22) $ping_b(149)
$ns connect $ping_a(149) $ping_b(149)	;#????Ping Agents
$ns at 1.0 "$ping_a(149) send"	;#??Ping???

#???150???(Ping)
set ping_a(150) [new Agent/Ping]
$ns attach-agent $node_(3) $ping_a(150)
set ping_b(150) [new Agent/Ping]
$ns attach-agent $node_(23) $ping_b(150)
$ns connect $ping_a(150) $ping_b(150)	;#????Ping Agents
$ns at 1.0 "$ping_a(150) send"	;#??Ping???

#???151???(Ping)
set ping_a(151) [new Agent/Ping]
$ns attach-agent $node_(3) $ping_a(151)
set ping_b(151) [new Agent/Ping]
$ns attach-agent $node_(24) $ping_b(151)
$ns connect $ping_a(151) $ping_b(151)	;#????Ping Agents
$ns at 1.0 "$ping_a(151) send"	;#??Ping???

#???152???(Ping)
set ping_a(152) [new Agent/Ping]
$ns attach-agent $node_(3) $ping_a(152)
set ping_b(152) [new Agent/Ping]
$ns attach-agent $node_(25) $ping_b(152)
$ns connect $ping_a(152) $ping_b(152)	;#????Ping Agents
$ns at 1.0 "$ping_a(152) send"	;#??Ping???

#???153???(Ping)
set ping_a(153) [new Agent/Ping]
$ns attach-agent $node_(3) $ping_a(153)
set ping_b(153) [new Agent/Ping]
$ns attach-agent $node_(26) $ping_b(153)
$ns connect $ping_a(153) $ping_b(153)	;#????Ping Agents
$ns at 1.0 "$ping_a(153) send"	;#??Ping???

#???154???(Ping)
set ping_a(154) [new Agent/Ping]
$ns attach-agent $node_(3) $ping_a(154)
set ping_b(154) [new Agent/Ping]
$ns attach-agent $node_(27) $ping_b(154)
$ns connect $ping_a(154) $ping_b(154)	;#????Ping Agents
$ns at 1.0 "$ping_a(154) send"	;#??Ping???

#???155???(Ping)
set ping_a(155) [new Agent/Ping]
$ns attach-agent $node_(4) $ping_a(155)
set ping_b(155) [new Agent/Ping]
$ns attach-agent $node_(0) $ping_b(155)
$ns connect $ping_a(155) $ping_b(155)	;#????Ping Agents
$ns at 1.0 "$ping_a(155) send"	;#??Ping???

#???156???(Ping)
set ping_a(156) [new Agent/Ping]
$ns attach-agent $node_(4) $ping_a(156)
set ping_b(156) [new Agent/Ping]
$ns attach-agent $node_(1) $ping_b(156)
$ns connect $ping_a(156) $ping_b(156)	;#????Ping Agents
$ns at 1.0 "$ping_a(156) send"	;#??Ping???

#???157???(Ping)
set ping_a(157) [new Agent/Ping]
$ns attach-agent $node_(4) $ping_a(157)
set ping_b(157) [new Agent/Ping]
$ns attach-agent $node_(2) $ping_b(157)
$ns connect $ping_a(157) $ping_b(157)	;#????Ping Agents
$ns at 1.0 "$ping_a(157) send"	;#??Ping???

#???158???(Ping)
set ping_a(158) [new Agent/Ping]
$ns attach-agent $node_(4) $ping_a(158)
set ping_b(158) [new Agent/Ping]
$ns attach-agent $node_(3) $ping_b(158)
$ns connect $ping_a(158) $ping_b(158)	;#????Ping Agents
$ns at 1.0 "$ping_a(158) send"	;#??Ping???

#???159???(Ping)
set ping_a(159) [new Agent/Ping]
$ns attach-agent $node_(4) $ping_a(159)
set ping_b(159) [new Agent/Ping]
$ns attach-agent $node_(5) $ping_b(159)
$ns connect $ping_a(159) $ping_b(159)	;#????Ping Agents
$ns at 1.0 "$ping_a(159) send"	;#??Ping???

#???160???(Ping)
set ping_a(160) [new Agent/Ping]
$ns attach-agent $node_(4) $ping_a(160)
set ping_b(160) [new Agent/Ping]
$ns attach-agent $node_(6) $ping_b(160)
$ns connect $ping_a(160) $ping_b(160)	;#????Ping Agents
$ns at 1.0 "$ping_a(160) send"	;#??Ping???

#???161???(Ping)
set ping_a(161) [new Agent/Ping]
$ns attach-agent $node_(4) $ping_a(161)
set ping_b(161) [new Agent/Ping]
$ns attach-agent $node_(7) $ping_b(161)
$ns connect $ping_a(161) $ping_b(161)	;#????Ping Agents
$ns at 1.0 "$ping_a(161) send"	;#??Ping???

#???162???(Ping)
set ping_a(162) [new Agent/Ping]
$ns attach-agent $node_(4) $ping_a(162)
set ping_b(162) [new Agent/Ping]
$ns attach-agent $node_(10) $ping_b(162)
$ns connect $ping_a(162) $ping_b(162)	;#????Ping Agents
$ns at 1.0 "$ping_a(162) send"	;#??Ping???

#???163???(Ping)
set ping_a(163) [new Agent/Ping]
$ns attach-agent $node_(4) $ping_a(163)
set ping_b(163) [new Agent/Ping]
$ns attach-agent $node_(11) $ping_b(163)
$ns connect $ping_a(163) $ping_b(163)	;#????Ping Agents
$ns at 1.0 "$ping_a(163) send"	;#??Ping???

#???164???(Ping)
set ping_a(164) [new Agent/Ping]
$ns attach-agent $node_(4) $ping_a(164)
set ping_b(164) [new Agent/Ping]
$ns attach-agent $node_(12) $ping_b(164)
$ns connect $ping_a(164) $ping_b(164)	;#????Ping Agents
$ns at 1.0 "$ping_a(164) send"	;#??Ping???

#???165???(Ping)
set ping_a(165) [new Agent/Ping]
$ns attach-agent $node_(4) $ping_a(165)
set ping_b(165) [new Agent/Ping]
$ns attach-agent $node_(13) $ping_b(165)
$ns connect $ping_a(165) $ping_b(165)	;#????Ping Agents
$ns at 1.0 "$ping_a(165) send"	;#??Ping???

#???166???(Ping)
set ping_a(166) [new Agent/Ping]
$ns attach-agent $node_(4) $ping_a(166)
set ping_b(166) [new Agent/Ping]
$ns attach-agent $node_(14) $ping_b(166)
$ns connect $ping_a(166) $ping_b(166)	;#????Ping Agents
$ns at 1.0 "$ping_a(166) send"	;#??Ping???

#???167???(Ping)
set ping_a(167) [new Agent/Ping]
$ns attach-agent $node_(4) $ping_a(167)
set ping_b(167) [new Agent/Ping]
$ns attach-agent $node_(15) $ping_b(167)
$ns connect $ping_a(167) $ping_b(167)	;#????Ping Agents
$ns at 1.0 "$ping_a(167) send"	;#??Ping???

#???168???(Ping)
set ping_a(168) [new Agent/Ping]
$ns attach-agent $node_(4) $ping_a(168)
set ping_b(168) [new Agent/Ping]
$ns attach-agent $node_(16) $ping_b(168)
$ns connect $ping_a(168) $ping_b(168)	;#????Ping Agents
$ns at 1.0 "$ping_a(168) send"	;#??Ping???

#???169???(Ping)
set ping_a(169) [new Agent/Ping]
$ns attach-agent $node_(4) $ping_a(169)
set ping_b(169) [new Agent/Ping]
$ns attach-agent $node_(19) $ping_b(169)
$ns connect $ping_a(169) $ping_b(169)	;#????Ping Agents
$ns at 1.0 "$ping_a(169) send"	;#??Ping???

#???170???(Ping)
set ping_a(170) [new Agent/Ping]
$ns attach-agent $node_(4) $ping_a(170)
set ping_b(170) [new Agent/Ping]
$ns attach-agent $node_(20) $ping_b(170)
$ns connect $ping_a(170) $ping_b(170)	;#????Ping Agents
$ns at 1.0 "$ping_a(170) send"	;#??Ping???

#???171???(Ping)
set ping_a(171) [new Agent/Ping]
$ns attach-agent $node_(4) $ping_a(171)
set ping_b(171) [new Agent/Ping]
$ns attach-agent $node_(21) $ping_b(171)
$ns connect $ping_a(171) $ping_b(171)	;#????Ping Agents
$ns at 1.0 "$ping_a(171) send"	;#??Ping???

#???172???(Ping)
set ping_a(172) [new Agent/Ping]
$ns attach-agent $node_(4) $ping_a(172)
set ping_b(172) [new Agent/Ping]
$ns attach-agent $node_(22) $ping_b(172)
$ns connect $ping_a(172) $ping_b(172)	;#????Ping Agents
$ns at 1.0 "$ping_a(172) send"	;#??Ping???

#???173???(Ping)
set ping_a(173) [new Agent/Ping]
$ns attach-agent $node_(4) $ping_a(173)
set ping_b(173) [new Agent/Ping]
$ns attach-agent $node_(23) $ping_b(173)
$ns connect $ping_a(173) $ping_b(173)	;#????Ping Agents
$ns at 1.0 "$ping_a(173) send"	;#??Ping???

#???174???(Ping)
set ping_a(174) [new Agent/Ping]
$ns attach-agent $node_(4) $ping_a(174)
set ping_b(174) [new Agent/Ping]
$ns attach-agent $node_(24) $ping_b(174)
$ns connect $ping_a(174) $ping_b(174)	;#????Ping Agents
$ns at 1.0 "$ping_a(174) send"	;#??Ping???

#???175???(Ping)
set ping_a(175) [new Agent/Ping]
$ns attach-agent $node_(4) $ping_a(175)
set ping_b(175) [new Agent/Ping]
$ns attach-agent $node_(25) $ping_b(175)
$ns connect $ping_a(175) $ping_b(175)	;#????Ping Agents
$ns at 1.0 "$ping_a(175) send"	;#??Ping???

#???176???(Ping)
set ping_a(176) [new Agent/Ping]
$ns attach-agent $node_(4) $ping_a(176)
set ping_b(176) [new Agent/Ping]
$ns attach-agent $node_(26) $ping_b(176)
$ns connect $ping_a(176) $ping_b(176)	;#????Ping Agents
$ns at 1.0 "$ping_a(176) send"	;#??Ping???

#???177???(Ping)
set ping_a(177) [new Agent/Ping]
$ns attach-agent $node_(4) $ping_a(177)
set ping_b(177) [new Agent/Ping]
$ns attach-agent $node_(27) $ping_b(177)
$ns connect $ping_a(177) $ping_b(177)	;#????Ping Agents
$ns at 1.0 "$ping_a(177) send"	;#??Ping???

#???178???(Ping)
set ping_a(178) [new Agent/Ping]
$ns attach-agent $node_(5) $ping_a(178)
set ping_b(178) [new Agent/Ping]
$ns attach-agent $node_(0) $ping_b(178)
$ns connect $ping_a(178) $ping_b(178)	;#????Ping Agents
$ns at 1.0 "$ping_a(178) send"	;#??Ping???

#???179???(Ping)
set ping_a(179) [new Agent/Ping]
$ns attach-agent $node_(5) $ping_a(179)
set ping_b(179) [new Agent/Ping]
$ns attach-agent $node_(1) $ping_b(179)
$ns connect $ping_a(179) $ping_b(179)	;#????Ping Agents
$ns at 1.0 "$ping_a(179) send"	;#??Ping???

#???180???(Ping)
set ping_a(180) [new Agent/Ping]
$ns attach-agent $node_(5) $ping_a(180)
set ping_b(180) [new Agent/Ping]
$ns attach-agent $node_(2) $ping_b(180)
$ns connect $ping_a(180) $ping_b(180)	;#????Ping Agents
$ns at 1.0 "$ping_a(180) send"	;#??Ping???

#???181???(Ping)
set ping_a(181) [new Agent/Ping]
$ns attach-agent $node_(5) $ping_a(181)
set ping_b(181) [new Agent/Ping]
$ns attach-agent $node_(3) $ping_b(181)
$ns connect $ping_a(181) $ping_b(181)	;#????Ping Agents
$ns at 1.0 "$ping_a(181) send"	;#??Ping???

#???182???(Ping)
set ping_a(182) [new Agent/Ping]
$ns attach-agent $node_(5) $ping_a(182)
set ping_b(182) [new Agent/Ping]
$ns attach-agent $node_(4) $ping_b(182)
$ns connect $ping_a(182) $ping_b(182)	;#????Ping Agents
$ns at 1.0 "$ping_a(182) send"	;#??Ping???

#???183???(Ping)
set ping_a(183) [new Agent/Ping]
$ns attach-agent $node_(5) $ping_a(183)
set ping_b(183) [new Agent/Ping]
$ns attach-agent $node_(6) $ping_b(183)
$ns connect $ping_a(183) $ping_b(183)	;#????Ping Agents
$ns at 1.0 "$ping_a(183) send"	;#??Ping???

#???184???(Ping)
set ping_a(184) [new Agent/Ping]
$ns attach-agent $node_(5) $ping_a(184)
set ping_b(184) [new Agent/Ping]
$ns attach-agent $node_(7) $ping_b(184)
$ns connect $ping_a(184) $ping_b(184)	;#????Ping Agents
$ns at 1.0 "$ping_a(184) send"	;#??Ping???

#???185???(Ping)
set ping_a(185) [new Agent/Ping]
$ns attach-agent $node_(5) $ping_a(185)
set ping_b(185) [new Agent/Ping]
$ns attach-agent $node_(10) $ping_b(185)
$ns connect $ping_a(185) $ping_b(185)	;#????Ping Agents
$ns at 1.0 "$ping_a(185) send"	;#??Ping???

#???186???(Ping)
set ping_a(186) [new Agent/Ping]
$ns attach-agent $node_(5) $ping_a(186)
set ping_b(186) [new Agent/Ping]
$ns attach-agent $node_(11) $ping_b(186)
$ns connect $ping_a(186) $ping_b(186)	;#????Ping Agents
$ns at 1.0 "$ping_a(186) send"	;#??Ping???

#???187???(Ping)
set ping_a(187) [new Agent/Ping]
$ns attach-agent $node_(5) $ping_a(187)
set ping_b(187) [new Agent/Ping]
$ns attach-agent $node_(12) $ping_b(187)
$ns connect $ping_a(187) $ping_b(187)	;#????Ping Agents
$ns at 1.0 "$ping_a(187) send"	;#??Ping???

#???188???(Ping)
set ping_a(188) [new Agent/Ping]
$ns attach-agent $node_(5) $ping_a(188)
set ping_b(188) [new Agent/Ping]
$ns attach-agent $node_(13) $ping_b(188)
$ns connect $ping_a(188) $ping_b(188)	;#????Ping Agents
$ns at 1.0 "$ping_a(188) send"	;#??Ping???

#???189???(Ping)
set ping_a(189) [new Agent/Ping]
$ns attach-agent $node_(5) $ping_a(189)
set ping_b(189) [new Agent/Ping]
$ns attach-agent $node_(14) $ping_b(189)
$ns connect $ping_a(189) $ping_b(189)	;#????Ping Agents
$ns at 1.0 "$ping_a(189) send"	;#??Ping???

#???190???(Ping)
set ping_a(190) [new Agent/Ping]
$ns attach-agent $node_(5) $ping_a(190)
set ping_b(190) [new Agent/Ping]
$ns attach-agent $node_(15) $ping_b(190)
$ns connect $ping_a(190) $ping_b(190)	;#????Ping Agents
$ns at 1.0 "$ping_a(190) send"	;#??Ping???

#???191???(Ping)
set ping_a(191) [new Agent/Ping]
$ns attach-agent $node_(5) $ping_a(191)
set ping_b(191) [new Agent/Ping]
$ns attach-agent $node_(16) $ping_b(191)
$ns connect $ping_a(191) $ping_b(191)	;#????Ping Agents
$ns at 1.0 "$ping_a(191) send"	;#??Ping???

#???192???(Ping)
set ping_a(192) [new Agent/Ping]
$ns attach-agent $node_(5) $ping_a(192)
set ping_b(192) [new Agent/Ping]
$ns attach-agent $node_(19) $ping_b(192)
$ns connect $ping_a(192) $ping_b(192)	;#????Ping Agents
$ns at 1.0 "$ping_a(192) send"	;#??Ping???

#???193???(Ping)
set ping_a(193) [new Agent/Ping]
$ns attach-agent $node_(5) $ping_a(193)
set ping_b(193) [new Agent/Ping]
$ns attach-agent $node_(20) $ping_b(193)
$ns connect $ping_a(193) $ping_b(193)	;#????Ping Agents
$ns at 1.0 "$ping_a(193) send"	;#??Ping???

#???194???(Ping)
set ping_a(194) [new Agent/Ping]
$ns attach-agent $node_(5) $ping_a(194)
set ping_b(194) [new Agent/Ping]
$ns attach-agent $node_(21) $ping_b(194)
$ns connect $ping_a(194) $ping_b(194)	;#????Ping Agents
$ns at 1.0 "$ping_a(194) send"	;#??Ping???

#???195???(Ping)
set ping_a(195) [new Agent/Ping]
$ns attach-agent $node_(5) $ping_a(195)
set ping_b(195) [new Agent/Ping]
$ns attach-agent $node_(22) $ping_b(195)
$ns connect $ping_a(195) $ping_b(195)	;#????Ping Agents
$ns at 1.0 "$ping_a(195) send"	;#??Ping???

#???196???(Ping)
set ping_a(196) [new Agent/Ping]
$ns attach-agent $node_(5) $ping_a(196)
set ping_b(196) [new Agent/Ping]
$ns attach-agent $node_(23) $ping_b(196)
$ns connect $ping_a(196) $ping_b(196)	;#????Ping Agents
$ns at 1.0 "$ping_a(196) send"	;#??Ping???

#???197???(Ping)
set ping_a(197) [new Agent/Ping]
$ns attach-agent $node_(5) $ping_a(197)
set ping_b(197) [new Agent/Ping]
$ns attach-agent $node_(24) $ping_b(197)
$ns connect $ping_a(197) $ping_b(197)	;#????Ping Agents
$ns at 1.0 "$ping_a(197) send"	;#??Ping???

#???198???(Ping)
set ping_a(198) [new Agent/Ping]
$ns attach-agent $node_(5) $ping_a(198)
set ping_b(198) [new Agent/Ping]
$ns attach-agent $node_(25) $ping_b(198)
$ns connect $ping_a(198) $ping_b(198)	;#????Ping Agents
$ns at 1.0 "$ping_a(198) send"	;#??Ping???

#???199???(Ping)
set ping_a(199) [new Agent/Ping]
$ns attach-agent $node_(5) $ping_a(199)
set ping_b(199) [new Agent/Ping]
$ns attach-agent $node_(26) $ping_b(199)
$ns connect $ping_a(199) $ping_b(199)	;#????Ping Agents
$ns at 1.0 "$ping_a(199) send"	;#??Ping???

#???200???(Ping)
set ping_a(200) [new Agent/Ping]
$ns attach-agent $node_(5) $ping_a(200)
set ping_b(200) [new Agent/Ping]
$ns attach-agent $node_(27) $ping_b(200)
$ns connect $ping_a(200) $ping_b(200)	;#????Ping Agents
$ns at 1.0 "$ping_a(200) send"	;#??Ping???

#???201???(Ping)
set ping_a(201) [new Agent/Ping]
$ns attach-agent $node_(6) $ping_a(201)
set ping_b(201) [new Agent/Ping]
$ns attach-agent $node_(0) $ping_b(201)
$ns connect $ping_a(201) $ping_b(201)	;#????Ping Agents
$ns at 1.0 "$ping_a(201) send"	;#??Ping???

#???202???(Ping)
set ping_a(202) [new Agent/Ping]
$ns attach-agent $node_(6) $ping_a(202)
set ping_b(202) [new Agent/Ping]
$ns attach-agent $node_(1) $ping_b(202)
$ns connect $ping_a(202) $ping_b(202)	;#????Ping Agents
$ns at 1.0 "$ping_a(202) send"	;#??Ping???

#???203???(Ping)
set ping_a(203) [new Agent/Ping]
$ns attach-agent $node_(6) $ping_a(203)
set ping_b(203) [new Agent/Ping]
$ns attach-agent $node_(2) $ping_b(203)
$ns connect $ping_a(203) $ping_b(203)	;#????Ping Agents
$ns at 1.0 "$ping_a(203) send"	;#??Ping???

#???204???(Ping)
set ping_a(204) [new Agent/Ping]
$ns attach-agent $node_(6) $ping_a(204)
set ping_b(204) [new Agent/Ping]
$ns attach-agent $node_(3) $ping_b(204)
$ns connect $ping_a(204) $ping_b(204)	;#????Ping Agents
$ns at 1.0 "$ping_a(204) send"	;#??Ping???

#???205???(Ping)
set ping_a(205) [new Agent/Ping]
$ns attach-agent $node_(6) $ping_a(205)
set ping_b(205) [new Agent/Ping]
$ns attach-agent $node_(4) $ping_b(205)
$ns connect $ping_a(205) $ping_b(205)	;#????Ping Agents
$ns at 1.0 "$ping_a(205) send"	;#??Ping???

#???206???(Ping)
set ping_a(206) [new Agent/Ping]
$ns attach-agent $node_(6) $ping_a(206)
set ping_b(206) [new Agent/Ping]
$ns attach-agent $node_(5) $ping_b(206)
$ns connect $ping_a(206) $ping_b(206)	;#????Ping Agents
$ns at 1.0 "$ping_a(206) send"	;#??Ping???

#???207???(Ping)
set ping_a(207) [new Agent/Ping]
$ns attach-agent $node_(6) $ping_a(207)
set ping_b(207) [new Agent/Ping]
$ns attach-agent $node_(7) $ping_b(207)
$ns connect $ping_a(207) $ping_b(207)	;#????Ping Agents
$ns at 1.0 "$ping_a(207) send"	;#??Ping???

#???208???(Ping)
set ping_a(208) [new Agent/Ping]
$ns attach-agent $node_(6) $ping_a(208)
set ping_b(208) [new Agent/Ping]
$ns attach-agent $node_(10) $ping_b(208)
$ns connect $ping_a(208) $ping_b(208)	;#????Ping Agents
$ns at 1.0 "$ping_a(208) send"	;#??Ping???

#???209???(Ping)
set ping_a(209) [new Agent/Ping]
$ns attach-agent $node_(6) $ping_a(209)
set ping_b(209) [new Agent/Ping]
$ns attach-agent $node_(11) $ping_b(209)
$ns connect $ping_a(209) $ping_b(209)	;#????Ping Agents
$ns at 1.0 "$ping_a(209) send"	;#??Ping???

#???210???(Ping)
set ping_a(210) [new Agent/Ping]
$ns attach-agent $node_(6) $ping_a(210)
set ping_b(210) [new Agent/Ping]
$ns attach-agent $node_(12) $ping_b(210)
$ns connect $ping_a(210) $ping_b(210)	;#????Ping Agents
$ns at 1.0 "$ping_a(210) send"	;#??Ping???

#???211???(Ping)
set ping_a(211) [new Agent/Ping]
$ns attach-agent $node_(6) $ping_a(211)
set ping_b(211) [new Agent/Ping]
$ns attach-agent $node_(13) $ping_b(211)
$ns connect $ping_a(211) $ping_b(211)	;#????Ping Agents
$ns at 1.0 "$ping_a(211) send"	;#??Ping???

#???212???(Ping)
set ping_a(212) [new Agent/Ping]
$ns attach-agent $node_(6) $ping_a(212)
set ping_b(212) [new Agent/Ping]
$ns attach-agent $node_(14) $ping_b(212)
$ns connect $ping_a(212) $ping_b(212)	;#????Ping Agents
$ns at 1.0 "$ping_a(212) send"	;#??Ping???

#???213???(Ping)
set ping_a(213) [new Agent/Ping]
$ns attach-agent $node_(6) $ping_a(213)
set ping_b(213) [new Agent/Ping]
$ns attach-agent $node_(15) $ping_b(213)
$ns connect $ping_a(213) $ping_b(213)	;#????Ping Agents
$ns at 1.0 "$ping_a(213) send"	;#??Ping???

#???214???(Ping)
set ping_a(214) [new Agent/Ping]
$ns attach-agent $node_(6) $ping_a(214)
set ping_b(214) [new Agent/Ping]
$ns attach-agent $node_(16) $ping_b(214)
$ns connect $ping_a(214) $ping_b(214)	;#????Ping Agents
$ns at 1.0 "$ping_a(214) send"	;#??Ping???

#???215???(Ping)
set ping_a(215) [new Agent/Ping]
$ns attach-agent $node_(6) $ping_a(215)
set ping_b(215) [new Agent/Ping]
$ns attach-agent $node_(19) $ping_b(215)
$ns connect $ping_a(215) $ping_b(215)	;#????Ping Agents
$ns at 1.0 "$ping_a(215) send"	;#??Ping???

#???216???(Ping)
set ping_a(216) [new Agent/Ping]
$ns attach-agent $node_(6) $ping_a(216)
set ping_b(216) [new Agent/Ping]
$ns attach-agent $node_(20) $ping_b(216)
$ns connect $ping_a(216) $ping_b(216)	;#????Ping Agents
$ns at 1.0 "$ping_a(216) send"	;#??Ping???

#???217???(Ping)
set ping_a(217) [new Agent/Ping]
$ns attach-agent $node_(6) $ping_a(217)
set ping_b(217) [new Agent/Ping]
$ns attach-agent $node_(21) $ping_b(217)
$ns connect $ping_a(217) $ping_b(217)	;#????Ping Agents
$ns at 1.0 "$ping_a(217) send"	;#??Ping???

#???218???(Ping)
set ping_a(218) [new Agent/Ping]
$ns attach-agent $node_(6) $ping_a(218)
set ping_b(218) [new Agent/Ping]
$ns attach-agent $node_(22) $ping_b(218)
$ns connect $ping_a(218) $ping_b(218)	;#????Ping Agents
$ns at 1.0 "$ping_a(218) send"	;#??Ping???

#???219???(Ping)
set ping_a(219) [new Agent/Ping]
$ns attach-agent $node_(6) $ping_a(219)
set ping_b(219) [new Agent/Ping]
$ns attach-agent $node_(23) $ping_b(219)
$ns connect $ping_a(219) $ping_b(219)	;#????Ping Agents
$ns at 1.0 "$ping_a(219) send"	;#??Ping???

#???220???(Ping)
set ping_a(220) [new Agent/Ping]
$ns attach-agent $node_(6) $ping_a(220)
set ping_b(220) [new Agent/Ping]
$ns attach-agent $node_(24) $ping_b(220)
$ns connect $ping_a(220) $ping_b(220)	;#????Ping Agents
$ns at 1.0 "$ping_a(220) send"	;#??Ping???

#???221???(Ping)
set ping_a(221) [new Agent/Ping]
$ns attach-agent $node_(6) $ping_a(221)
set ping_b(221) [new Agent/Ping]
$ns attach-agent $node_(25) $ping_b(221)
$ns connect $ping_a(221) $ping_b(221)	;#????Ping Agents
$ns at 1.0 "$ping_a(221) send"	;#??Ping???

#???222???(Ping)
set ping_a(222) [new Agent/Ping]
$ns attach-agent $node_(6) $ping_a(222)
set ping_b(222) [new Agent/Ping]
$ns attach-agent $node_(26) $ping_b(222)
$ns connect $ping_a(222) $ping_b(222)	;#????Ping Agents
$ns at 1.0 "$ping_a(222) send"	;#??Ping???

#???223???(Ping)
set ping_a(223) [new Agent/Ping]
$ns attach-agent $node_(6) $ping_a(223)
set ping_b(223) [new Agent/Ping]
$ns attach-agent $node_(27) $ping_b(223)
$ns connect $ping_a(223) $ping_b(223)	;#????Ping Agents
$ns at 1.0 "$ping_a(223) send"	;#??Ping???

#???224???(Ping)
set ping_a(224) [new Agent/Ping]
$ns attach-agent $node_(7) $ping_a(224)
set ping_b(224) [new Agent/Ping]
$ns attach-agent $node_(0) $ping_b(224)
$ns connect $ping_a(224) $ping_b(224)	;#????Ping Agents
$ns at 1.0 "$ping_a(224) send"	;#??Ping???

#???225???(Ping)
set ping_a(225) [new Agent/Ping]
$ns attach-agent $node_(7) $ping_a(225)
set ping_b(225) [new Agent/Ping]
$ns attach-agent $node_(1) $ping_b(225)
$ns connect $ping_a(225) $ping_b(225)	;#????Ping Agents
$ns at 1.0 "$ping_a(225) send"	;#??Ping???

#???226???(Ping)
set ping_a(226) [new Agent/Ping]
$ns attach-agent $node_(7) $ping_a(226)
set ping_b(226) [new Agent/Ping]
$ns attach-agent $node_(2) $ping_b(226)
$ns connect $ping_a(226) $ping_b(226)	;#????Ping Agents
$ns at 1.0 "$ping_a(226) send"	;#??Ping???

#???227???(Ping)
set ping_a(227) [new Agent/Ping]
$ns attach-agent $node_(7) $ping_a(227)
set ping_b(227) [new Agent/Ping]
$ns attach-agent $node_(3) $ping_b(227)
$ns connect $ping_a(227) $ping_b(227)	;#????Ping Agents
$ns at 1.0 "$ping_a(227) send"	;#??Ping???

#???228???(Ping)
set ping_a(228) [new Agent/Ping]
$ns attach-agent $node_(7) $ping_a(228)
set ping_b(228) [new Agent/Ping]
$ns attach-agent $node_(4) $ping_b(228)
$ns connect $ping_a(228) $ping_b(228)	;#????Ping Agents
$ns at 1.0 "$ping_a(228) send"	;#??Ping???

#???229???(Ping)
set ping_a(229) [new Agent/Ping]
$ns attach-agent $node_(7) $ping_a(229)
set ping_b(229) [new Agent/Ping]
$ns attach-agent $node_(5) $ping_b(229)
$ns connect $ping_a(229) $ping_b(229)	;#????Ping Agents
$ns at 1.0 "$ping_a(229) send"	;#??Ping???

#???230???(Ping)
set ping_a(230) [new Agent/Ping]
$ns attach-agent $node_(7) $ping_a(230)
set ping_b(230) [new Agent/Ping]
$ns attach-agent $node_(6) $ping_b(230)
$ns connect $ping_a(230) $ping_b(230)	;#????Ping Agents
$ns at 1.0 "$ping_a(230) send"	;#??Ping???

#???231???(Ping)
set ping_a(231) [new Agent/Ping]
$ns attach-agent $node_(7) $ping_a(231)
set ping_b(231) [new Agent/Ping]
$ns attach-agent $node_(10) $ping_b(231)
$ns connect $ping_a(231) $ping_b(231)	;#????Ping Agents
$ns at 1.0 "$ping_a(231) send"	;#??Ping???

#???232???(Ping)
set ping_a(232) [new Agent/Ping]
$ns attach-agent $node_(7) $ping_a(232)
set ping_b(232) [new Agent/Ping]
$ns attach-agent $node_(11) $ping_b(232)
$ns connect $ping_a(232) $ping_b(232)	;#????Ping Agents
$ns at 1.0 "$ping_a(232) send"	;#??Ping???

#???233???(Ping)
set ping_a(233) [new Agent/Ping]
$ns attach-agent $node_(7) $ping_a(233)
set ping_b(233) [new Agent/Ping]
$ns attach-agent $node_(12) $ping_b(233)
$ns connect $ping_a(233) $ping_b(233)	;#????Ping Agents
$ns at 1.0 "$ping_a(233) send"	;#??Ping???

#???234???(Ping)
set ping_a(234) [new Agent/Ping]
$ns attach-agent $node_(7) $ping_a(234)
set ping_b(234) [new Agent/Ping]
$ns attach-agent $node_(13) $ping_b(234)
$ns connect $ping_a(234) $ping_b(234)	;#????Ping Agents
$ns at 1.0 "$ping_a(234) send"	;#??Ping???

#???235???(Ping)
set ping_a(235) [new Agent/Ping]
$ns attach-agent $node_(7) $ping_a(235)
set ping_b(235) [new Agent/Ping]
$ns attach-agent $node_(14) $ping_b(235)
$ns connect $ping_a(235) $ping_b(235)	;#????Ping Agents
$ns at 1.0 "$ping_a(235) send"	;#??Ping???

#???236???(Ping)
set ping_a(236) [new Agent/Ping]
$ns attach-agent $node_(7) $ping_a(236)
set ping_b(236) [new Agent/Ping]
$ns attach-agent $node_(15) $ping_b(236)
$ns connect $ping_a(236) $ping_b(236)	;#????Ping Agents
$ns at 1.0 "$ping_a(236) send"	;#??Ping???

#???237???(Ping)
set ping_a(237) [new Agent/Ping]
$ns attach-agent $node_(7) $ping_a(237)
set ping_b(237) [new Agent/Ping]
$ns attach-agent $node_(16) $ping_b(237)
$ns connect $ping_a(237) $ping_b(237)	;#????Ping Agents
$ns at 1.0 "$ping_a(237) send"	;#??Ping???

#???238???(Ping)
set ping_a(238) [new Agent/Ping]
$ns attach-agent $node_(7) $ping_a(238)
set ping_b(238) [new Agent/Ping]
$ns attach-agent $node_(19) $ping_b(238)
$ns connect $ping_a(238) $ping_b(238)	;#????Ping Agents
$ns at 1.0 "$ping_a(238) send"	;#??Ping???

#???239???(Ping)
set ping_a(239) [new Agent/Ping]
$ns attach-agent $node_(7) $ping_a(239)
set ping_b(239) [new Agent/Ping]
$ns attach-agent $node_(20) $ping_b(239)
$ns connect $ping_a(239) $ping_b(239)	;#????Ping Agents
$ns at 1.0 "$ping_a(239) send"	;#??Ping???

#???240???(Ping)
set ping_a(240) [new Agent/Ping]
$ns attach-agent $node_(7) $ping_a(240)
set ping_b(240) [new Agent/Ping]
$ns attach-agent $node_(21) $ping_b(240)
$ns connect $ping_a(240) $ping_b(240)	;#????Ping Agents
$ns at 1.0 "$ping_a(240) send"	;#??Ping???

#???241???(Ping)
set ping_a(241) [new Agent/Ping]
$ns attach-agent $node_(7) $ping_a(241)
set ping_b(241) [new Agent/Ping]
$ns attach-agent $node_(22) $ping_b(241)
$ns connect $ping_a(241) $ping_b(241)	;#????Ping Agents
$ns at 1.0 "$ping_a(241) send"	;#??Ping???

#???242???(Ping)
set ping_a(242) [new Agent/Ping]
$ns attach-agent $node_(7) $ping_a(242)
set ping_b(242) [new Agent/Ping]
$ns attach-agent $node_(23) $ping_b(242)
$ns connect $ping_a(242) $ping_b(242)	;#????Ping Agents
$ns at 1.0 "$ping_a(242) send"	;#??Ping???

#???243???(Ping)
set ping_a(243) [new Agent/Ping]
$ns attach-agent $node_(7) $ping_a(243)
set ping_b(243) [new Agent/Ping]
$ns attach-agent $node_(24) $ping_b(243)
$ns connect $ping_a(243) $ping_b(243)	;#????Ping Agents
$ns at 1.0 "$ping_a(243) send"	;#??Ping???

#???244???(Ping)
set ping_a(244) [new Agent/Ping]
$ns attach-agent $node_(7) $ping_a(244)
set ping_b(244) [new Agent/Ping]
$ns attach-agent $node_(25) $ping_b(244)
$ns connect $ping_a(244) $ping_b(244)	;#????Ping Agents
$ns at 1.0 "$ping_a(244) send"	;#??Ping???

#???245???(Ping)
set ping_a(245) [new Agent/Ping]
$ns attach-agent $node_(7) $ping_a(245)
set ping_b(245) [new Agent/Ping]
$ns attach-agent $node_(26) $ping_b(245)
$ns connect $ping_a(245) $ping_b(245)	;#????Ping Agents
$ns at 1.0 "$ping_a(245) send"	;#??Ping???

#???246???(Ping)
set ping_a(246) [new Agent/Ping]
$ns attach-agent $node_(7) $ping_a(246)
set ping_b(246) [new Agent/Ping]
$ns attach-agent $node_(27) $ping_b(246)
$ns connect $ping_a(246) $ping_b(246)	;#????Ping Agents
$ns at 1.0 "$ping_a(246) send"	;#??Ping???

#???247???(Ping)
set ping_a(247) [new Agent/Ping]
$ns attach-agent $node_(10) $ping_a(247)
set ping_b(247) [new Agent/Ping]
$ns attach-agent $node_(0) $ping_b(247)
$ns connect $ping_a(247) $ping_b(247)	;#????Ping Agents
$ns at 1.0 "$ping_a(247) send"	;#??Ping???

#???248???(Ping)
set ping_a(248) [new Agent/Ping]
$ns attach-agent $node_(10) $ping_a(248)
set ping_b(248) [new Agent/Ping]
$ns attach-agent $node_(1) $ping_b(248)
$ns connect $ping_a(248) $ping_b(248)	;#????Ping Agents
$ns at 1.0 "$ping_a(248) send"	;#??Ping???

#???249???(Ping)
set ping_a(249) [new Agent/Ping]
$ns attach-agent $node_(10) $ping_a(249)
set ping_b(249) [new Agent/Ping]
$ns attach-agent $node_(2) $ping_b(249)
$ns connect $ping_a(249) $ping_b(249)	;#????Ping Agents
$ns at 1.0 "$ping_a(249) send"	;#??Ping???

#???250???(Ping)
set ping_a(250) [new Agent/Ping]
$ns attach-agent $node_(10) $ping_a(250)
set ping_b(250) [new Agent/Ping]
$ns attach-agent $node_(3) $ping_b(250)
$ns connect $ping_a(250) $ping_b(250)	;#????Ping Agents
$ns at 1.0 "$ping_a(250) send"	;#??Ping???

#???251???(Ping)
set ping_a(251) [new Agent/Ping]
$ns attach-agent $node_(10) $ping_a(251)
set ping_b(251) [new Agent/Ping]
$ns attach-agent $node_(4) $ping_b(251)
$ns connect $ping_a(251) $ping_b(251)	;#????Ping Agents
$ns at 1.0 "$ping_a(251) send"	;#??Ping???

#???252???(Ping)
set ping_a(252) [new Agent/Ping]
$ns attach-agent $node_(10) $ping_a(252)
set ping_b(252) [new Agent/Ping]
$ns attach-agent $node_(5) $ping_b(252)
$ns connect $ping_a(252) $ping_b(252)	;#????Ping Agents
$ns at 1.0 "$ping_a(252) send"	;#??Ping???

#???253???(Ping)
set ping_a(253) [new Agent/Ping]
$ns attach-agent $node_(10) $ping_a(253)
set ping_b(253) [new Agent/Ping]
$ns attach-agent $node_(6) $ping_b(253)
$ns connect $ping_a(253) $ping_b(253)	;#????Ping Agents
$ns at 1.0 "$ping_a(253) send"	;#??Ping???

#???254???(Ping)
set ping_a(254) [new Agent/Ping]
$ns attach-agent $node_(10) $ping_a(254)
set ping_b(254) [new Agent/Ping]
$ns attach-agent $node_(7) $ping_b(254)
$ns connect $ping_a(254) $ping_b(254)	;#????Ping Agents
$ns at 1.0 "$ping_a(254) send"	;#??Ping???

#???255???(Ping)
set ping_a(255) [new Agent/Ping]
$ns attach-agent $node_(10) $ping_a(255)
set ping_b(255) [new Agent/Ping]
$ns attach-agent $node_(11) $ping_b(255)
$ns connect $ping_a(255) $ping_b(255)	;#????Ping Agents
$ns at 1.0 "$ping_a(255) send"	;#??Ping???

#???256???(Ping)
set ping_a(256) [new Agent/Ping]
$ns attach-agent $node_(10) $ping_a(256)
set ping_b(256) [new Agent/Ping]
$ns attach-agent $node_(12) $ping_b(256)
$ns connect $ping_a(256) $ping_b(256)	;#????Ping Agents
$ns at 1.0 "$ping_a(256) send"	;#??Ping???

#???257???(Ping)
set ping_a(257) [new Agent/Ping]
$ns attach-agent $node_(10) $ping_a(257)
set ping_b(257) [new Agent/Ping]
$ns attach-agent $node_(13) $ping_b(257)
$ns connect $ping_a(257) $ping_b(257)	;#????Ping Agents
$ns at 1.0 "$ping_a(257) send"	;#??Ping???

#???258???(Ping)
set ping_a(258) [new Agent/Ping]
$ns attach-agent $node_(10) $ping_a(258)
set ping_b(258) [new Agent/Ping]
$ns attach-agent $node_(14) $ping_b(258)
$ns connect $ping_a(258) $ping_b(258)	;#????Ping Agents
$ns at 1.0 "$ping_a(258) send"	;#??Ping???

#???259???(Ping)
set ping_a(259) [new Agent/Ping]
$ns attach-agent $node_(10) $ping_a(259)
set ping_b(259) [new Agent/Ping]
$ns attach-agent $node_(15) $ping_b(259)
$ns connect $ping_a(259) $ping_b(259)	;#????Ping Agents
$ns at 1.0 "$ping_a(259) send"	;#??Ping???

#???260???(Ping)
set ping_a(260) [new Agent/Ping]
$ns attach-agent $node_(10) $ping_a(260)
set ping_b(260) [new Agent/Ping]
$ns attach-agent $node_(16) $ping_b(260)
$ns connect $ping_a(260) $ping_b(260)	;#????Ping Agents
$ns at 1.0 "$ping_a(260) send"	;#??Ping???

#???261???(Ping)
set ping_a(261) [new Agent/Ping]
$ns attach-agent $node_(10) $ping_a(261)
set ping_b(261) [new Agent/Ping]
$ns attach-agent $node_(19) $ping_b(261)
$ns connect $ping_a(261) $ping_b(261)	;#????Ping Agents
$ns at 1.0 "$ping_a(261) send"	;#??Ping???

#???262???(Ping)
set ping_a(262) [new Agent/Ping]
$ns attach-agent $node_(10) $ping_a(262)
set ping_b(262) [new Agent/Ping]
$ns attach-agent $node_(20) $ping_b(262)
$ns connect $ping_a(262) $ping_b(262)	;#????Ping Agents
$ns at 1.0 "$ping_a(262) send"	;#??Ping???

#???263???(Ping)
set ping_a(263) [new Agent/Ping]
$ns attach-agent $node_(10) $ping_a(263)
set ping_b(263) [new Agent/Ping]
$ns attach-agent $node_(21) $ping_b(263)
$ns connect $ping_a(263) $ping_b(263)	;#????Ping Agents
$ns at 1.0 "$ping_a(263) send"	;#??Ping???

#???264???(Ping)
set ping_a(264) [new Agent/Ping]
$ns attach-agent $node_(10) $ping_a(264)
set ping_b(264) [new Agent/Ping]
$ns attach-agent $node_(22) $ping_b(264)
$ns connect $ping_a(264) $ping_b(264)	;#????Ping Agents
$ns at 1.0 "$ping_a(264) send"	;#??Ping???

#???265???(Ping)
set ping_a(265) [new Agent/Ping]
$ns attach-agent $node_(10) $ping_a(265)
set ping_b(265) [new Agent/Ping]
$ns attach-agent $node_(23) $ping_b(265)
$ns connect $ping_a(265) $ping_b(265)	;#????Ping Agents
$ns at 1.0 "$ping_a(265) send"	;#??Ping???

#???266???(Ping)
set ping_a(266) [new Agent/Ping]
$ns attach-agent $node_(10) $ping_a(266)
set ping_b(266) [new Agent/Ping]
$ns attach-agent $node_(24) $ping_b(266)
$ns connect $ping_a(266) $ping_b(266)	;#????Ping Agents
$ns at 1.0 "$ping_a(266) send"	;#??Ping???

#???267???(Ping)
set ping_a(267) [new Agent/Ping]
$ns attach-agent $node_(10) $ping_a(267)
set ping_b(267) [new Agent/Ping]
$ns attach-agent $node_(25) $ping_b(267)
$ns connect $ping_a(267) $ping_b(267)	;#????Ping Agents
$ns at 1.0 "$ping_a(267) send"	;#??Ping???

#???268???(Ping)
set ping_a(268) [new Agent/Ping]
$ns attach-agent $node_(10) $ping_a(268)
set ping_b(268) [new Agent/Ping]
$ns attach-agent $node_(26) $ping_b(268)
$ns connect $ping_a(268) $ping_b(268)	;#????Ping Agents
$ns at 1.0 "$ping_a(268) send"	;#??Ping???

#???269???(Ping)
set ping_a(269) [new Agent/Ping]
$ns attach-agent $node_(10) $ping_a(269)
set ping_b(269) [new Agent/Ping]
$ns attach-agent $node_(27) $ping_b(269)
$ns connect $ping_a(269) $ping_b(269)	;#????Ping Agents
$ns at 1.0 "$ping_a(269) send"	;#??Ping???

#???270???(Ping)
set ping_a(270) [new Agent/Ping]
$ns attach-agent $node_(11) $ping_a(270)
set ping_b(270) [new Agent/Ping]
$ns attach-agent $node_(0) $ping_b(270)
$ns connect $ping_a(270) $ping_b(270)	;#????Ping Agents
$ns at 1.0 "$ping_a(270) send"	;#??Ping???

#???271???(Ping)
set ping_a(271) [new Agent/Ping]
$ns attach-agent $node_(11) $ping_a(271)
set ping_b(271) [new Agent/Ping]
$ns attach-agent $node_(1) $ping_b(271)
$ns connect $ping_a(271) $ping_b(271)	;#????Ping Agents
$ns at 1.0 "$ping_a(271) send"	;#??Ping???

#???272???(Ping)
set ping_a(272) [new Agent/Ping]
$ns attach-agent $node_(11) $ping_a(272)
set ping_b(272) [new Agent/Ping]
$ns attach-agent $node_(2) $ping_b(272)
$ns connect $ping_a(272) $ping_b(272)	;#????Ping Agents
$ns at 1.0 "$ping_a(272) send"	;#??Ping???

#???273???(Ping)
set ping_a(273) [new Agent/Ping]
$ns attach-agent $node_(11) $ping_a(273)
set ping_b(273) [new Agent/Ping]
$ns attach-agent $node_(3) $ping_b(273)
$ns connect $ping_a(273) $ping_b(273)	;#????Ping Agents
$ns at 1.0 "$ping_a(273) send"	;#??Ping???

#???274???(Ping)
set ping_a(274) [new Agent/Ping]
$ns attach-agent $node_(11) $ping_a(274)
set ping_b(274) [new Agent/Ping]
$ns attach-agent $node_(4) $ping_b(274)
$ns connect $ping_a(274) $ping_b(274)	;#????Ping Agents
$ns at 1.0 "$ping_a(274) send"	;#??Ping???

#???275???(Ping)
set ping_a(275) [new Agent/Ping]
$ns attach-agent $node_(11) $ping_a(275)
set ping_b(275) [new Agent/Ping]
$ns attach-agent $node_(5) $ping_b(275)
$ns connect $ping_a(275) $ping_b(275)	;#????Ping Agents
$ns at 1.0 "$ping_a(275) send"	;#??Ping???

#???276???(Ping)
set ping_a(276) [new Agent/Ping]
$ns attach-agent $node_(11) $ping_a(276)
set ping_b(276) [new Agent/Ping]
$ns attach-agent $node_(6) $ping_b(276)
$ns connect $ping_a(276) $ping_b(276)	;#????Ping Agents
$ns at 1.0 "$ping_a(276) send"	;#??Ping???

#???277???(Ping)
set ping_a(277) [new Agent/Ping]
$ns attach-agent $node_(11) $ping_a(277)
set ping_b(277) [new Agent/Ping]
$ns attach-agent $node_(7) $ping_b(277)
$ns connect $ping_a(277) $ping_b(277)	;#????Ping Agents
$ns at 1.0 "$ping_a(277) send"	;#??Ping???

#???278???(Ping)
set ping_a(278) [new Agent/Ping]
$ns attach-agent $node_(11) $ping_a(278)
set ping_b(278) [new Agent/Ping]
$ns attach-agent $node_(10) $ping_b(278)
$ns connect $ping_a(278) $ping_b(278)	;#????Ping Agents
$ns at 1.0 "$ping_a(278) send"	;#??Ping???

#???279???(Ping)
set ping_a(279) [new Agent/Ping]
$ns attach-agent $node_(11) $ping_a(279)
set ping_b(279) [new Agent/Ping]
$ns attach-agent $node_(12) $ping_b(279)
$ns connect $ping_a(279) $ping_b(279)	;#????Ping Agents
$ns at 1.0 "$ping_a(279) send"	;#??Ping???

#???280???(Ping)
set ping_a(280) [new Agent/Ping]
$ns attach-agent $node_(11) $ping_a(280)
set ping_b(280) [new Agent/Ping]
$ns attach-agent $node_(13) $ping_b(280)
$ns connect $ping_a(280) $ping_b(280)	;#????Ping Agents
$ns at 1.0 "$ping_a(280) send"	;#??Ping???

#???281???(Ping)
set ping_a(281) [new Agent/Ping]
$ns attach-agent $node_(11) $ping_a(281)
set ping_b(281) [new Agent/Ping]
$ns attach-agent $node_(14) $ping_b(281)
$ns connect $ping_a(281) $ping_b(281)	;#????Ping Agents
$ns at 1.0 "$ping_a(281) send"	;#??Ping???

#???282???(Ping)
set ping_a(282) [new Agent/Ping]
$ns attach-agent $node_(11) $ping_a(282)
set ping_b(282) [new Agent/Ping]
$ns attach-agent $node_(15) $ping_b(282)
$ns connect $ping_a(282) $ping_b(282)	;#????Ping Agents
$ns at 1.0 "$ping_a(282) send"	;#??Ping???

#???283???(Ping)
set ping_a(283) [new Agent/Ping]
$ns attach-agent $node_(11) $ping_a(283)
set ping_b(283) [new Agent/Ping]
$ns attach-agent $node_(16) $ping_b(283)
$ns connect $ping_a(283) $ping_b(283)	;#????Ping Agents
$ns at 1.0 "$ping_a(283) send"	;#??Ping???

#???284???(Ping)
set ping_a(284) [new Agent/Ping]
$ns attach-agent $node_(11) $ping_a(284)
set ping_b(284) [new Agent/Ping]
$ns attach-agent $node_(19) $ping_b(284)
$ns connect $ping_a(284) $ping_b(284)	;#????Ping Agents
$ns at 1.0 "$ping_a(284) send"	;#??Ping???

#???285???(Ping)
set ping_a(285) [new Agent/Ping]
$ns attach-agent $node_(11) $ping_a(285)
set ping_b(285) [new Agent/Ping]
$ns attach-agent $node_(20) $ping_b(285)
$ns connect $ping_a(285) $ping_b(285)	;#????Ping Agents
$ns at 1.0 "$ping_a(285) send"	;#??Ping???

#???286???(Ping)
set ping_a(286) [new Agent/Ping]
$ns attach-agent $node_(11) $ping_a(286)
set ping_b(286) [new Agent/Ping]
$ns attach-agent $node_(21) $ping_b(286)
$ns connect $ping_a(286) $ping_b(286)	;#????Ping Agents
$ns at 1.0 "$ping_a(286) send"	;#??Ping???

#???287???(Ping)
set ping_a(287) [new Agent/Ping]
$ns attach-agent $node_(11) $ping_a(287)
set ping_b(287) [new Agent/Ping]
$ns attach-agent $node_(22) $ping_b(287)
$ns connect $ping_a(287) $ping_b(287)	;#????Ping Agents
$ns at 1.0 "$ping_a(287) send"	;#??Ping???

#???288???(Ping)
set ping_a(288) [new Agent/Ping]
$ns attach-agent $node_(11) $ping_a(288)
set ping_b(288) [new Agent/Ping]
$ns attach-agent $node_(23) $ping_b(288)
$ns connect $ping_a(288) $ping_b(288)	;#????Ping Agents
$ns at 1.0 "$ping_a(288) send"	;#??Ping???

#???289???(Ping)
set ping_a(289) [new Agent/Ping]
$ns attach-agent $node_(11) $ping_a(289)
set ping_b(289) [new Agent/Ping]
$ns attach-agent $node_(24) $ping_b(289)
$ns connect $ping_a(289) $ping_b(289)	;#????Ping Agents
$ns at 1.0 "$ping_a(289) send"	;#??Ping???

#???290???(Ping)
set ping_a(290) [new Agent/Ping]
$ns attach-agent $node_(11) $ping_a(290)
set ping_b(290) [new Agent/Ping]
$ns attach-agent $node_(25) $ping_b(290)
$ns connect $ping_a(290) $ping_b(290)	;#????Ping Agents
$ns at 1.0 "$ping_a(290) send"	;#??Ping???

#???291???(Ping)
set ping_a(291) [new Agent/Ping]
$ns attach-agent $node_(11) $ping_a(291)
set ping_b(291) [new Agent/Ping]
$ns attach-agent $node_(26) $ping_b(291)
$ns connect $ping_a(291) $ping_b(291)	;#????Ping Agents
$ns at 1.0 "$ping_a(291) send"	;#??Ping???

#???292???(Ping)
set ping_a(292) [new Agent/Ping]
$ns attach-agent $node_(11) $ping_a(292)
set ping_b(292) [new Agent/Ping]
$ns attach-agent $node_(27) $ping_b(292)
$ns connect $ping_a(292) $ping_b(292)	;#????Ping Agents
$ns at 1.0 "$ping_a(292) send"	;#??Ping???

#???293???(Ping)
set ping_a(293) [new Agent/Ping]
$ns attach-agent $node_(12) $ping_a(293)
set ping_b(293) [new Agent/Ping]
$ns attach-agent $node_(0) $ping_b(293)
$ns connect $ping_a(293) $ping_b(293)	;#????Ping Agents
$ns at 1.0 "$ping_a(293) send"	;#??Ping???

#???294???(Ping)
set ping_a(294) [new Agent/Ping]
$ns attach-agent $node_(12) $ping_a(294)
set ping_b(294) [new Agent/Ping]
$ns attach-agent $node_(1) $ping_b(294)
$ns connect $ping_a(294) $ping_b(294)	;#????Ping Agents
$ns at 1.0 "$ping_a(294) send"	;#??Ping???

#???295???(Ping)
set ping_a(295) [new Agent/Ping]
$ns attach-agent $node_(12) $ping_a(295)
set ping_b(295) [new Agent/Ping]
$ns attach-agent $node_(2) $ping_b(295)
$ns connect $ping_a(295) $ping_b(295)	;#????Ping Agents
$ns at 1.0 "$ping_a(295) send"	;#??Ping???

#???296???(Ping)
set ping_a(296) [new Agent/Ping]
$ns attach-agent $node_(12) $ping_a(296)
set ping_b(296) [new Agent/Ping]
$ns attach-agent $node_(3) $ping_b(296)
$ns connect $ping_a(296) $ping_b(296)	;#????Ping Agents
$ns at 1.0 "$ping_a(296) send"	;#??Ping???

#???297???(Ping)
set ping_a(297) [new Agent/Ping]
$ns attach-agent $node_(12) $ping_a(297)
set ping_b(297) [new Agent/Ping]
$ns attach-agent $node_(4) $ping_b(297)
$ns connect $ping_a(297) $ping_b(297)	;#????Ping Agents
$ns at 1.0 "$ping_a(297) send"	;#??Ping???

#???298???(Ping)
set ping_a(298) [new Agent/Ping]
$ns attach-agent $node_(12) $ping_a(298)
set ping_b(298) [new Agent/Ping]
$ns attach-agent $node_(5) $ping_b(298)
$ns connect $ping_a(298) $ping_b(298)	;#????Ping Agents
$ns at 1.0 "$ping_a(298) send"	;#??Ping???

#???299???(Ping)
set ping_a(299) [new Agent/Ping]
$ns attach-agent $node_(12) $ping_a(299)
set ping_b(299) [new Agent/Ping]
$ns attach-agent $node_(6) $ping_b(299)
$ns connect $ping_a(299) $ping_b(299)	;#????Ping Agents
$ns at 1.0 "$ping_a(299) send"	;#??Ping???

#???300???(Ping)
set ping_a(300) [new Agent/Ping]
$ns attach-agent $node_(12) $ping_a(300)
set ping_b(300) [new Agent/Ping]
$ns attach-agent $node_(7) $ping_b(300)
$ns connect $ping_a(300) $ping_b(300)	;#????Ping Agents
$ns at 1.0 "$ping_a(300) send"	;#??Ping???

#???301???(Ping)
set ping_a(301) [new Agent/Ping]
$ns attach-agent $node_(12) $ping_a(301)
set ping_b(301) [new Agent/Ping]
$ns attach-agent $node_(10) $ping_b(301)
$ns connect $ping_a(301) $ping_b(301)	;#????Ping Agents
$ns at 1.0 "$ping_a(301) send"	;#??Ping???

#???302???(Ping)
set ping_a(302) [new Agent/Ping]
$ns attach-agent $node_(12) $ping_a(302)
set ping_b(302) [new Agent/Ping]
$ns attach-agent $node_(11) $ping_b(302)
$ns connect $ping_a(302) $ping_b(302)	;#????Ping Agents
$ns at 1.0 "$ping_a(302) send"	;#??Ping???

#???303???(Ping)
set ping_a(303) [new Agent/Ping]
$ns attach-agent $node_(12) $ping_a(303)
set ping_b(303) [new Agent/Ping]
$ns attach-agent $node_(13) $ping_b(303)
$ns connect $ping_a(303) $ping_b(303)	;#????Ping Agents
$ns at 1.0 "$ping_a(303) send"	;#??Ping???

#???304???(Ping)
set ping_a(304) [new Agent/Ping]
$ns attach-agent $node_(12) $ping_a(304)
set ping_b(304) [new Agent/Ping]
$ns attach-agent $node_(14) $ping_b(304)
$ns connect $ping_a(304) $ping_b(304)	;#????Ping Agents
$ns at 1.0 "$ping_a(304) send"	;#??Ping???

#???305???(Ping)
set ping_a(305) [new Agent/Ping]
$ns attach-agent $node_(12) $ping_a(305)
set ping_b(305) [new Agent/Ping]
$ns attach-agent $node_(15) $ping_b(305)
$ns connect $ping_a(305) $ping_b(305)	;#????Ping Agents
$ns at 1.0 "$ping_a(305) send"	;#??Ping???

#???306???(Ping)
set ping_a(306) [new Agent/Ping]
$ns attach-agent $node_(12) $ping_a(306)
set ping_b(306) [new Agent/Ping]
$ns attach-agent $node_(16) $ping_b(306)
$ns connect $ping_a(306) $ping_b(306)	;#????Ping Agents
$ns at 1.0 "$ping_a(306) send"	;#??Ping???

#???307???(Ping)
set ping_a(307) [new Agent/Ping]
$ns attach-agent $node_(12) $ping_a(307)
set ping_b(307) [new Agent/Ping]
$ns attach-agent $node_(19) $ping_b(307)
$ns connect $ping_a(307) $ping_b(307)	;#????Ping Agents
$ns at 1.0 "$ping_a(307) send"	;#??Ping???

#???308???(Ping)
set ping_a(308) [new Agent/Ping]
$ns attach-agent $node_(12) $ping_a(308)
set ping_b(308) [new Agent/Ping]
$ns attach-agent $node_(20) $ping_b(308)
$ns connect $ping_a(308) $ping_b(308)	;#????Ping Agents
$ns at 1.0 "$ping_a(308) send"	;#??Ping???

#???309???(Ping)
set ping_a(309) [new Agent/Ping]
$ns attach-agent $node_(12) $ping_a(309)
set ping_b(309) [new Agent/Ping]
$ns attach-agent $node_(21) $ping_b(309)
$ns connect $ping_a(309) $ping_b(309)	;#????Ping Agents
$ns at 1.0 "$ping_a(309) send"	;#??Ping???

#???310???(Ping)
set ping_a(310) [new Agent/Ping]
$ns attach-agent $node_(12) $ping_a(310)
set ping_b(310) [new Agent/Ping]
$ns attach-agent $node_(22) $ping_b(310)
$ns connect $ping_a(310) $ping_b(310)	;#????Ping Agents
$ns at 1.0 "$ping_a(310) send"	;#??Ping???

#???311???(Ping)
set ping_a(311) [new Agent/Ping]
$ns attach-agent $node_(12) $ping_a(311)
set ping_b(311) [new Agent/Ping]
$ns attach-agent $node_(23) $ping_b(311)
$ns connect $ping_a(311) $ping_b(311)	;#????Ping Agents
$ns at 1.0 "$ping_a(311) send"	;#??Ping???

#???312???(Ping)
set ping_a(312) [new Agent/Ping]
$ns attach-agent $node_(12) $ping_a(312)
set ping_b(312) [new Agent/Ping]
$ns attach-agent $node_(24) $ping_b(312)
$ns connect $ping_a(312) $ping_b(312)	;#????Ping Agents
$ns at 1.0 "$ping_a(312) send"	;#??Ping???

#???313???(Ping)
set ping_a(313) [new Agent/Ping]
$ns attach-agent $node_(12) $ping_a(313)
set ping_b(313) [new Agent/Ping]
$ns attach-agent $node_(25) $ping_b(313)
$ns connect $ping_a(313) $ping_b(313)	;#????Ping Agents
$ns at 1.0 "$ping_a(313) send"	;#??Ping???

#???314???(Ping)
set ping_a(314) [new Agent/Ping]
$ns attach-agent $node_(12) $ping_a(314)
set ping_b(314) [new Agent/Ping]
$ns attach-agent $node_(26) $ping_b(314)
$ns connect $ping_a(314) $ping_b(314)	;#????Ping Agents
$ns at 1.0 "$ping_a(314) send"	;#??Ping???

#???315???(Ping)
set ping_a(315) [new Agent/Ping]
$ns attach-agent $node_(12) $ping_a(315)
set ping_b(315) [new Agent/Ping]
$ns attach-agent $node_(27) $ping_b(315)
$ns connect $ping_a(315) $ping_b(315)	;#????Ping Agents
$ns at 1.0 "$ping_a(315) send"	;#??Ping???

#???316???(Ping)
set ping_a(316) [new Agent/Ping]
$ns attach-agent $node_(13) $ping_a(316)
set ping_b(316) [new Agent/Ping]
$ns attach-agent $node_(0) $ping_b(316)
$ns connect $ping_a(316) $ping_b(316)	;#????Ping Agents
$ns at 1.0 "$ping_a(316) send"	;#??Ping???

#???317???(Ping)
set ping_a(317) [new Agent/Ping]
$ns attach-agent $node_(13) $ping_a(317)
set ping_b(317) [new Agent/Ping]
$ns attach-agent $node_(1) $ping_b(317)
$ns connect $ping_a(317) $ping_b(317)	;#????Ping Agents
$ns at 1.0 "$ping_a(317) send"	;#??Ping???

#???318???(Ping)
set ping_a(318) [new Agent/Ping]
$ns attach-agent $node_(13) $ping_a(318)
set ping_b(318) [new Agent/Ping]
$ns attach-agent $node_(2) $ping_b(318)
$ns connect $ping_a(318) $ping_b(318)	;#????Ping Agents
$ns at 1.0 "$ping_a(318) send"	;#??Ping???

#???319???(Ping)
set ping_a(319) [new Agent/Ping]
$ns attach-agent $node_(13) $ping_a(319)
set ping_b(319) [new Agent/Ping]
$ns attach-agent $node_(3) $ping_b(319)
$ns connect $ping_a(319) $ping_b(319)	;#????Ping Agents
$ns at 1.0 "$ping_a(319) send"	;#??Ping???

#???320???(Ping)
set ping_a(320) [new Agent/Ping]
$ns attach-agent $node_(13) $ping_a(320)
set ping_b(320) [new Agent/Ping]
$ns attach-agent $node_(4) $ping_b(320)
$ns connect $ping_a(320) $ping_b(320)	;#????Ping Agents
$ns at 1.0 "$ping_a(320) send"	;#??Ping???

#???321???(Ping)
set ping_a(321) [new Agent/Ping]
$ns attach-agent $node_(13) $ping_a(321)
set ping_b(321) [new Agent/Ping]
$ns attach-agent $node_(5) $ping_b(321)
$ns connect $ping_a(321) $ping_b(321)	;#????Ping Agents
$ns at 1.0 "$ping_a(321) send"	;#??Ping???

#???322???(Ping)
set ping_a(322) [new Agent/Ping]
$ns attach-agent $node_(13) $ping_a(322)
set ping_b(322) [new Agent/Ping]
$ns attach-agent $node_(6) $ping_b(322)
$ns connect $ping_a(322) $ping_b(322)	;#????Ping Agents
$ns at 1.0 "$ping_a(322) send"	;#??Ping???

#???323???(Ping)
set ping_a(323) [new Agent/Ping]
$ns attach-agent $node_(13) $ping_a(323)
set ping_b(323) [new Agent/Ping]
$ns attach-agent $node_(7) $ping_b(323)
$ns connect $ping_a(323) $ping_b(323)	;#????Ping Agents
$ns at 1.0 "$ping_a(323) send"	;#??Ping???

#???324???(Ping)
set ping_a(324) [new Agent/Ping]
$ns attach-agent $node_(13) $ping_a(324)
set ping_b(324) [new Agent/Ping]
$ns attach-agent $node_(10) $ping_b(324)
$ns connect $ping_a(324) $ping_b(324)	;#????Ping Agents
$ns at 1.0 "$ping_a(324) send"	;#??Ping???

#???325???(Ping)
set ping_a(325) [new Agent/Ping]
$ns attach-agent $node_(13) $ping_a(325)
set ping_b(325) [new Agent/Ping]
$ns attach-agent $node_(11) $ping_b(325)
$ns connect $ping_a(325) $ping_b(325)	;#????Ping Agents
$ns at 1.0 "$ping_a(325) send"	;#??Ping???

#???326???(Ping)
set ping_a(326) [new Agent/Ping]
$ns attach-agent $node_(13) $ping_a(326)
set ping_b(326) [new Agent/Ping]
$ns attach-agent $node_(12) $ping_b(326)
$ns connect $ping_a(326) $ping_b(326)	;#????Ping Agents
$ns at 1.0 "$ping_a(326) send"	;#??Ping???

#???327???(Ping)
set ping_a(327) [new Agent/Ping]
$ns attach-agent $node_(13) $ping_a(327)
set ping_b(327) [new Agent/Ping]
$ns attach-agent $node_(14) $ping_b(327)
$ns connect $ping_a(327) $ping_b(327)	;#????Ping Agents
$ns at 1.0 "$ping_a(327) send"	;#??Ping???

#???328???(Ping)
set ping_a(328) [new Agent/Ping]
$ns attach-agent $node_(13) $ping_a(328)
set ping_b(328) [new Agent/Ping]
$ns attach-agent $node_(15) $ping_b(328)
$ns connect $ping_a(328) $ping_b(328)	;#????Ping Agents
$ns at 1.0 "$ping_a(328) send"	;#??Ping???

#???329???(Ping)
set ping_a(329) [new Agent/Ping]
$ns attach-agent $node_(13) $ping_a(329)
set ping_b(329) [new Agent/Ping]
$ns attach-agent $node_(16) $ping_b(329)
$ns connect $ping_a(329) $ping_b(329)	;#????Ping Agents
$ns at 1.0 "$ping_a(329) send"	;#??Ping???

#???330???(Ping)
set ping_a(330) [new Agent/Ping]
$ns attach-agent $node_(13) $ping_a(330)
set ping_b(330) [new Agent/Ping]
$ns attach-agent $node_(19) $ping_b(330)
$ns connect $ping_a(330) $ping_b(330)	;#????Ping Agents
$ns at 1.0 "$ping_a(330) send"	;#??Ping???

#???331???(Ping)
set ping_a(331) [new Agent/Ping]
$ns attach-agent $node_(13) $ping_a(331)
set ping_b(331) [new Agent/Ping]
$ns attach-agent $node_(20) $ping_b(331)
$ns connect $ping_a(331) $ping_b(331)	;#????Ping Agents
$ns at 1.0 "$ping_a(331) send"	;#??Ping???

#???332???(Ping)
set ping_a(332) [new Agent/Ping]
$ns attach-agent $node_(13) $ping_a(332)
set ping_b(332) [new Agent/Ping]
$ns attach-agent $node_(21) $ping_b(332)
$ns connect $ping_a(332) $ping_b(332)	;#????Ping Agents
$ns at 1.0 "$ping_a(332) send"	;#??Ping???

#???333???(Ping)
set ping_a(333) [new Agent/Ping]
$ns attach-agent $node_(13) $ping_a(333)
set ping_b(333) [new Agent/Ping]
$ns attach-agent $node_(22) $ping_b(333)
$ns connect $ping_a(333) $ping_b(333)	;#????Ping Agents
$ns at 1.0 "$ping_a(333) send"	;#??Ping???

#???334???(Ping)
set ping_a(334) [new Agent/Ping]
$ns attach-agent $node_(13) $ping_a(334)
set ping_b(334) [new Agent/Ping]
$ns attach-agent $node_(23) $ping_b(334)
$ns connect $ping_a(334) $ping_b(334)	;#????Ping Agents
$ns at 1.0 "$ping_a(334) send"	;#??Ping???

#???335???(Ping)
set ping_a(335) [new Agent/Ping]
$ns attach-agent $node_(13) $ping_a(335)
set ping_b(335) [new Agent/Ping]
$ns attach-agent $node_(24) $ping_b(335)
$ns connect $ping_a(335) $ping_b(335)	;#????Ping Agents
$ns at 1.0 "$ping_a(335) send"	;#??Ping???

#???336???(Ping)
set ping_a(336) [new Agent/Ping]
$ns attach-agent $node_(13) $ping_a(336)
set ping_b(336) [new Agent/Ping]
$ns attach-agent $node_(25) $ping_b(336)
$ns connect $ping_a(336) $ping_b(336)	;#????Ping Agents
$ns at 1.0 "$ping_a(336) send"	;#??Ping???

#???337???(Ping)
set ping_a(337) [new Agent/Ping]
$ns attach-agent $node_(13) $ping_a(337)
set ping_b(337) [new Agent/Ping]
$ns attach-agent $node_(26) $ping_b(337)
$ns connect $ping_a(337) $ping_b(337)	;#????Ping Agents
$ns at 1.0 "$ping_a(337) send"	;#??Ping???

#???338???(Ping)
set ping_a(338) [new Agent/Ping]
$ns attach-agent $node_(13) $ping_a(338)
set ping_b(338) [new Agent/Ping]
$ns attach-agent $node_(27) $ping_b(338)
$ns connect $ping_a(338) $ping_b(338)	;#????Ping Agents
$ns at 1.0 "$ping_a(338) send"	;#??Ping???

#???339???(Ping)
set ping_a(339) [new Agent/Ping]
$ns attach-agent $node_(14) $ping_a(339)
set ping_b(339) [new Agent/Ping]
$ns attach-agent $node_(0) $ping_b(339)
$ns connect $ping_a(339) $ping_b(339)	;#????Ping Agents
$ns at 1.0 "$ping_a(339) send"	;#??Ping???

#???340???(Ping)
set ping_a(340) [new Agent/Ping]
$ns attach-agent $node_(14) $ping_a(340)
set ping_b(340) [new Agent/Ping]
$ns attach-agent $node_(1) $ping_b(340)
$ns connect $ping_a(340) $ping_b(340)	;#????Ping Agents
$ns at 1.0 "$ping_a(340) send"	;#??Ping???

#???341???(Ping)
set ping_a(341) [new Agent/Ping]
$ns attach-agent $node_(14) $ping_a(341)
set ping_b(341) [new Agent/Ping]
$ns attach-agent $node_(2) $ping_b(341)
$ns connect $ping_a(341) $ping_b(341)	;#????Ping Agents
$ns at 1.0 "$ping_a(341) send"	;#??Ping???

#???342???(Ping)
set ping_a(342) [new Agent/Ping]
$ns attach-agent $node_(14) $ping_a(342)
set ping_b(342) [new Agent/Ping]
$ns attach-agent $node_(3) $ping_b(342)
$ns connect $ping_a(342) $ping_b(342)	;#????Ping Agents
$ns at 1.0 "$ping_a(342) send"	;#??Ping???

#???343???(Ping)
set ping_a(343) [new Agent/Ping]
$ns attach-agent $node_(14) $ping_a(343)
set ping_b(343) [new Agent/Ping]
$ns attach-agent $node_(4) $ping_b(343)
$ns connect $ping_a(343) $ping_b(343)	;#????Ping Agents
$ns at 1.0 "$ping_a(343) send"	;#??Ping???

#???344???(Ping)
set ping_a(344) [new Agent/Ping]
$ns attach-agent $node_(14) $ping_a(344)
set ping_b(344) [new Agent/Ping]
$ns attach-agent $node_(5) $ping_b(344)
$ns connect $ping_a(344) $ping_b(344)	;#????Ping Agents
$ns at 1.0 "$ping_a(344) send"	;#??Ping???

#???345???(Ping)
set ping_a(345) [new Agent/Ping]
$ns attach-agent $node_(14) $ping_a(345)
set ping_b(345) [new Agent/Ping]
$ns attach-agent $node_(6) $ping_b(345)
$ns connect $ping_a(345) $ping_b(345)	;#????Ping Agents
$ns at 1.0 "$ping_a(345) send"	;#??Ping???

#???346???(Ping)
set ping_a(346) [new Agent/Ping]
$ns attach-agent $node_(14) $ping_a(346)
set ping_b(346) [new Agent/Ping]
$ns attach-agent $node_(7) $ping_b(346)
$ns connect $ping_a(346) $ping_b(346)	;#????Ping Agents
$ns at 1.0 "$ping_a(346) send"	;#??Ping???

#???347???(Ping)
set ping_a(347) [new Agent/Ping]
$ns attach-agent $node_(14) $ping_a(347)
set ping_b(347) [new Agent/Ping]
$ns attach-agent $node_(10) $ping_b(347)
$ns connect $ping_a(347) $ping_b(347)	;#????Ping Agents
$ns at 1.0 "$ping_a(347) send"	;#??Ping???

#???348???(Ping)
set ping_a(348) [new Agent/Ping]
$ns attach-agent $node_(14) $ping_a(348)
set ping_b(348) [new Agent/Ping]
$ns attach-agent $node_(11) $ping_b(348)
$ns connect $ping_a(348) $ping_b(348)	;#????Ping Agents
$ns at 1.0 "$ping_a(348) send"	;#??Ping???

#???349???(Ping)
set ping_a(349) [new Agent/Ping]
$ns attach-agent $node_(14) $ping_a(349)
set ping_b(349) [new Agent/Ping]
$ns attach-agent $node_(12) $ping_b(349)
$ns connect $ping_a(349) $ping_b(349)	;#????Ping Agents
$ns at 1.0 "$ping_a(349) send"	;#??Ping???

#???350???(Ping)
set ping_a(350) [new Agent/Ping]
$ns attach-agent $node_(14) $ping_a(350)
set ping_b(350) [new Agent/Ping]
$ns attach-agent $node_(13) $ping_b(350)
$ns connect $ping_a(350) $ping_b(350)	;#????Ping Agents
$ns at 1.0 "$ping_a(350) send"	;#??Ping???

#???351???(Ping)
set ping_a(351) [new Agent/Ping]
$ns attach-agent $node_(14) $ping_a(351)
set ping_b(351) [new Agent/Ping]
$ns attach-agent $node_(15) $ping_b(351)
$ns connect $ping_a(351) $ping_b(351)	;#????Ping Agents
$ns at 1.0 "$ping_a(351) send"	;#??Ping???

#???352???(Ping)
set ping_a(352) [new Agent/Ping]
$ns attach-agent $node_(14) $ping_a(352)
set ping_b(352) [new Agent/Ping]
$ns attach-agent $node_(16) $ping_b(352)
$ns connect $ping_a(352) $ping_b(352)	;#????Ping Agents
$ns at 1.0 "$ping_a(352) send"	;#??Ping???

#???353???(Ping)
set ping_a(353) [new Agent/Ping]
$ns attach-agent $node_(14) $ping_a(353)
set ping_b(353) [new Agent/Ping]
$ns attach-agent $node_(19) $ping_b(353)
$ns connect $ping_a(353) $ping_b(353)	;#????Ping Agents
$ns at 1.0 "$ping_a(353) send"	;#??Ping???

#???354???(Ping)
set ping_a(354) [new Agent/Ping]
$ns attach-agent $node_(14) $ping_a(354)
set ping_b(354) [new Agent/Ping]
$ns attach-agent $node_(20) $ping_b(354)
$ns connect $ping_a(354) $ping_b(354)	;#????Ping Agents
$ns at 1.0 "$ping_a(354) send"	;#??Ping???

#???355???(Ping)
set ping_a(355) [new Agent/Ping]
$ns attach-agent $node_(14) $ping_a(355)
set ping_b(355) [new Agent/Ping]
$ns attach-agent $node_(21) $ping_b(355)
$ns connect $ping_a(355) $ping_b(355)	;#????Ping Agents
$ns at 1.0 "$ping_a(355) send"	;#??Ping???

#???356???(Ping)
set ping_a(356) [new Agent/Ping]
$ns attach-agent $node_(14) $ping_a(356)
set ping_b(356) [new Agent/Ping]
$ns attach-agent $node_(22) $ping_b(356)
$ns connect $ping_a(356) $ping_b(356)	;#????Ping Agents
$ns at 1.0 "$ping_a(356) send"	;#??Ping???

#???357???(Ping)
set ping_a(357) [new Agent/Ping]
$ns attach-agent $node_(14) $ping_a(357)
set ping_b(357) [new Agent/Ping]
$ns attach-agent $node_(23) $ping_b(357)
$ns connect $ping_a(357) $ping_b(357)	;#????Ping Agents
$ns at 1.0 "$ping_a(357) send"	;#??Ping???

#???358???(Ping)
set ping_a(358) [new Agent/Ping]
$ns attach-agent $node_(14) $ping_a(358)
set ping_b(358) [new Agent/Ping]
$ns attach-agent $node_(24) $ping_b(358)
$ns connect $ping_a(358) $ping_b(358)	;#????Ping Agents
$ns at 1.0 "$ping_a(358) send"	;#??Ping???

#???359???(Ping)
set ping_a(359) [new Agent/Ping]
$ns attach-agent $node_(14) $ping_a(359)
set ping_b(359) [new Agent/Ping]
$ns attach-agent $node_(25) $ping_b(359)
$ns connect $ping_a(359) $ping_b(359)	;#????Ping Agents
$ns at 1.0 "$ping_a(359) send"	;#??Ping???

#???360???(Ping)
set ping_a(360) [new Agent/Ping]
$ns attach-agent $node_(14) $ping_a(360)
set ping_b(360) [new Agent/Ping]
$ns attach-agent $node_(26) $ping_b(360)
$ns connect $ping_a(360) $ping_b(360)	;#????Ping Agents
$ns at 1.0 "$ping_a(360) send"	;#??Ping???

#???361???(Ping)
set ping_a(361) [new Agent/Ping]
$ns attach-agent $node_(14) $ping_a(361)
set ping_b(361) [new Agent/Ping]
$ns attach-agent $node_(27) $ping_b(361)
$ns connect $ping_a(361) $ping_b(361)	;#????Ping Agents
$ns at 1.0 "$ping_a(361) send"	;#??Ping???

#???362???(Ping)
set ping_a(362) [new Agent/Ping]
$ns attach-agent $node_(15) $ping_a(362)
set ping_b(362) [new Agent/Ping]
$ns attach-agent $node_(0) $ping_b(362)
$ns connect $ping_a(362) $ping_b(362)	;#????Ping Agents
$ns at 1.0 "$ping_a(362) send"	;#??Ping???

#???363???(Ping)
set ping_a(363) [new Agent/Ping]
$ns attach-agent $node_(15) $ping_a(363)
set ping_b(363) [new Agent/Ping]
$ns attach-agent $node_(1) $ping_b(363)
$ns connect $ping_a(363) $ping_b(363)	;#????Ping Agents
$ns at 1.0 "$ping_a(363) send"	;#??Ping???

#???364???(Ping)
set ping_a(364) [new Agent/Ping]
$ns attach-agent $node_(15) $ping_a(364)
set ping_b(364) [new Agent/Ping]
$ns attach-agent $node_(2) $ping_b(364)
$ns connect $ping_a(364) $ping_b(364)	;#????Ping Agents
$ns at 1.0 "$ping_a(364) send"	;#??Ping???

#???365???(Ping)
set ping_a(365) [new Agent/Ping]
$ns attach-agent $node_(15) $ping_a(365)
set ping_b(365) [new Agent/Ping]
$ns attach-agent $node_(3) $ping_b(365)
$ns connect $ping_a(365) $ping_b(365)	;#????Ping Agents
$ns at 1.0 "$ping_a(365) send"	;#??Ping???

#???366???(Ping)
set ping_a(366) [new Agent/Ping]
$ns attach-agent $node_(15) $ping_a(366)
set ping_b(366) [new Agent/Ping]
$ns attach-agent $node_(4) $ping_b(366)
$ns connect $ping_a(366) $ping_b(366)	;#????Ping Agents
$ns at 1.0 "$ping_a(366) send"	;#??Ping???

#???367???(Ping)
set ping_a(367) [new Agent/Ping]
$ns attach-agent $node_(15) $ping_a(367)
set ping_b(367) [new Agent/Ping]
$ns attach-agent $node_(5) $ping_b(367)
$ns connect $ping_a(367) $ping_b(367)	;#????Ping Agents
$ns at 1.0 "$ping_a(367) send"	;#??Ping???

#???368???(Ping)
set ping_a(368) [new Agent/Ping]
$ns attach-agent $node_(15) $ping_a(368)
set ping_b(368) [new Agent/Ping]
$ns attach-agent $node_(6) $ping_b(368)
$ns connect $ping_a(368) $ping_b(368)	;#????Ping Agents
$ns at 1.0 "$ping_a(368) send"	;#??Ping???

#???369???(Ping)
set ping_a(369) [new Agent/Ping]
$ns attach-agent $node_(15) $ping_a(369)
set ping_b(369) [new Agent/Ping]
$ns attach-agent $node_(7) $ping_b(369)
$ns connect $ping_a(369) $ping_b(369)	;#????Ping Agents
$ns at 1.0 "$ping_a(369) send"	;#??Ping???

#???370???(Ping)
set ping_a(370) [new Agent/Ping]
$ns attach-agent $node_(15) $ping_a(370)
set ping_b(370) [new Agent/Ping]
$ns attach-agent $node_(10) $ping_b(370)
$ns connect $ping_a(370) $ping_b(370)	;#????Ping Agents
$ns at 1.0 "$ping_a(370) send"	;#??Ping???

#???371???(Ping)
set ping_a(371) [new Agent/Ping]
$ns attach-agent $node_(15) $ping_a(371)
set ping_b(371) [new Agent/Ping]
$ns attach-agent $node_(11) $ping_b(371)
$ns connect $ping_a(371) $ping_b(371)	;#????Ping Agents
$ns at 1.0 "$ping_a(371) send"	;#??Ping???

#???372???(Ping)
set ping_a(372) [new Agent/Ping]
$ns attach-agent $node_(15) $ping_a(372)
set ping_b(372) [new Agent/Ping]
$ns attach-agent $node_(12) $ping_b(372)
$ns connect $ping_a(372) $ping_b(372)	;#????Ping Agents
$ns at 1.0 "$ping_a(372) send"	;#??Ping???

#???373???(Ping)
set ping_a(373) [new Agent/Ping]
$ns attach-agent $node_(15) $ping_a(373)
set ping_b(373) [new Agent/Ping]
$ns attach-agent $node_(13) $ping_b(373)
$ns connect $ping_a(373) $ping_b(373)	;#????Ping Agents
$ns at 1.0 "$ping_a(373) send"	;#??Ping???

#???374???(Ping)
set ping_a(374) [new Agent/Ping]
$ns attach-agent $node_(15) $ping_a(374)
set ping_b(374) [new Agent/Ping]
$ns attach-agent $node_(14) $ping_b(374)
$ns connect $ping_a(374) $ping_b(374)	;#????Ping Agents
$ns at 1.0 "$ping_a(374) send"	;#??Ping???

#???375???(Ping)
set ping_a(375) [new Agent/Ping]
$ns attach-agent $node_(15) $ping_a(375)
set ping_b(375) [new Agent/Ping]
$ns attach-agent $node_(16) $ping_b(375)
$ns connect $ping_a(375) $ping_b(375)	;#????Ping Agents
$ns at 1.0 "$ping_a(375) send"	;#??Ping???

#???376???(Ping)
set ping_a(376) [new Agent/Ping]
$ns attach-agent $node_(15) $ping_a(376)
set ping_b(376) [new Agent/Ping]
$ns attach-agent $node_(19) $ping_b(376)
$ns connect $ping_a(376) $ping_b(376)	;#????Ping Agents
$ns at 1.0 "$ping_a(376) send"	;#??Ping???

#???377???(Ping)
set ping_a(377) [new Agent/Ping]
$ns attach-agent $node_(15) $ping_a(377)
set ping_b(377) [new Agent/Ping]
$ns attach-agent $node_(20) $ping_b(377)
$ns connect $ping_a(377) $ping_b(377)	;#????Ping Agents
$ns at 1.0 "$ping_a(377) send"	;#??Ping???

#???378???(Ping)
set ping_a(378) [new Agent/Ping]
$ns attach-agent $node_(15) $ping_a(378)
set ping_b(378) [new Agent/Ping]
$ns attach-agent $node_(21) $ping_b(378)
$ns connect $ping_a(378) $ping_b(378)	;#????Ping Agents
$ns at 1.0 "$ping_a(378) send"	;#??Ping???

#???379???(Ping)
set ping_a(379) [new Agent/Ping]
$ns attach-agent $node_(15) $ping_a(379)
set ping_b(379) [new Agent/Ping]
$ns attach-agent $node_(22) $ping_b(379)
$ns connect $ping_a(379) $ping_b(379)	;#????Ping Agents
$ns at 1.0 "$ping_a(379) send"	;#??Ping???

#???380???(Ping)
set ping_a(380) [new Agent/Ping]
$ns attach-agent $node_(15) $ping_a(380)
set ping_b(380) [new Agent/Ping]
$ns attach-agent $node_(23) $ping_b(380)
$ns connect $ping_a(380) $ping_b(380)	;#????Ping Agents
$ns at 1.0 "$ping_a(380) send"	;#??Ping???

#???381???(Ping)
set ping_a(381) [new Agent/Ping]
$ns attach-agent $node_(15) $ping_a(381)
set ping_b(381) [new Agent/Ping]
$ns attach-agent $node_(24) $ping_b(381)
$ns connect $ping_a(381) $ping_b(381)	;#????Ping Agents
$ns at 1.0 "$ping_a(381) send"	;#??Ping???

#???382???(Ping)
set ping_a(382) [new Agent/Ping]
$ns attach-agent $node_(15) $ping_a(382)
set ping_b(382) [new Agent/Ping]
$ns attach-agent $node_(25) $ping_b(382)
$ns connect $ping_a(382) $ping_b(382)	;#????Ping Agents
$ns at 1.0 "$ping_a(382) send"	;#??Ping???

#???383???(Ping)
set ping_a(383) [new Agent/Ping]
$ns attach-agent $node_(15) $ping_a(383)
set ping_b(383) [new Agent/Ping]
$ns attach-agent $node_(26) $ping_b(383)
$ns connect $ping_a(383) $ping_b(383)	;#????Ping Agents
$ns at 1.0 "$ping_a(383) send"	;#??Ping???

#???384???(Ping)
set ping_a(384) [new Agent/Ping]
$ns attach-agent $node_(15) $ping_a(384)
set ping_b(384) [new Agent/Ping]
$ns attach-agent $node_(27) $ping_b(384)
$ns connect $ping_a(384) $ping_b(384)	;#????Ping Agents
$ns at 1.0 "$ping_a(384) send"	;#??Ping???

#???385???(Ping)
set ping_a(385) [new Agent/Ping]
$ns attach-agent $node_(16) $ping_a(385)
set ping_b(385) [new Agent/Ping]
$ns attach-agent $node_(0) $ping_b(385)
$ns connect $ping_a(385) $ping_b(385)	;#????Ping Agents
$ns at 1.0 "$ping_a(385) send"	;#??Ping???

#???386???(Ping)
set ping_a(386) [new Agent/Ping]
$ns attach-agent $node_(16) $ping_a(386)
set ping_b(386) [new Agent/Ping]
$ns attach-agent $node_(1) $ping_b(386)
$ns connect $ping_a(386) $ping_b(386)	;#????Ping Agents
$ns at 1.0 "$ping_a(386) send"	;#??Ping???

#???387???(Ping)
set ping_a(387) [new Agent/Ping]
$ns attach-agent $node_(16) $ping_a(387)
set ping_b(387) [new Agent/Ping]
$ns attach-agent $node_(2) $ping_b(387)
$ns connect $ping_a(387) $ping_b(387)	;#????Ping Agents
$ns at 1.0 "$ping_a(387) send"	;#??Ping???

#???388???(Ping)
set ping_a(388) [new Agent/Ping]
$ns attach-agent $node_(16) $ping_a(388)
set ping_b(388) [new Agent/Ping]
$ns attach-agent $node_(3) $ping_b(388)
$ns connect $ping_a(388) $ping_b(388)	;#????Ping Agents
$ns at 1.0 "$ping_a(388) send"	;#??Ping???

#???389???(Ping)
set ping_a(389) [new Agent/Ping]
$ns attach-agent $node_(16) $ping_a(389)
set ping_b(389) [new Agent/Ping]
$ns attach-agent $node_(4) $ping_b(389)
$ns connect $ping_a(389) $ping_b(389)	;#????Ping Agents
$ns at 1.0 "$ping_a(389) send"	;#??Ping???

#???390???(Ping)
set ping_a(390) [new Agent/Ping]
$ns attach-agent $node_(16) $ping_a(390)
set ping_b(390) [new Agent/Ping]
$ns attach-agent $node_(5) $ping_b(390)
$ns connect $ping_a(390) $ping_b(390)	;#????Ping Agents
$ns at 1.0 "$ping_a(390) send"	;#??Ping???

#???391???(Ping)
set ping_a(391) [new Agent/Ping]
$ns attach-agent $node_(16) $ping_a(391)
set ping_b(391) [new Agent/Ping]
$ns attach-agent $node_(6) $ping_b(391)
$ns connect $ping_a(391) $ping_b(391)	;#????Ping Agents
$ns at 1.0 "$ping_a(391) send"	;#??Ping???

#???392???(Ping)
set ping_a(392) [new Agent/Ping]
$ns attach-agent $node_(16) $ping_a(392)
set ping_b(392) [new Agent/Ping]
$ns attach-agent $node_(7) $ping_b(392)
$ns connect $ping_a(392) $ping_b(392)	;#????Ping Agents
$ns at 1.0 "$ping_a(392) send"	;#??Ping???

#???393???(Ping)
set ping_a(393) [new Agent/Ping]
$ns attach-agent $node_(16) $ping_a(393)
set ping_b(393) [new Agent/Ping]
$ns attach-agent $node_(10) $ping_b(393)
$ns connect $ping_a(393) $ping_b(393)	;#????Ping Agents
$ns at 1.0 "$ping_a(393) send"	;#??Ping???

#???394???(Ping)
set ping_a(394) [new Agent/Ping]
$ns attach-agent $node_(16) $ping_a(394)
set ping_b(394) [new Agent/Ping]
$ns attach-agent $node_(11) $ping_b(394)
$ns connect $ping_a(394) $ping_b(394)	;#????Ping Agents
$ns at 1.0 "$ping_a(394) send"	;#??Ping???

#???395???(Ping)
set ping_a(395) [new Agent/Ping]
$ns attach-agent $node_(16) $ping_a(395)
set ping_b(395) [new Agent/Ping]
$ns attach-agent $node_(12) $ping_b(395)
$ns connect $ping_a(395) $ping_b(395)	;#????Ping Agents
$ns at 1.0 "$ping_a(395) send"	;#??Ping???

#???396???(Ping)
set ping_a(396) [new Agent/Ping]
$ns attach-agent $node_(16) $ping_a(396)
set ping_b(396) [new Agent/Ping]
$ns attach-agent $node_(13) $ping_b(396)
$ns connect $ping_a(396) $ping_b(396)	;#????Ping Agents
$ns at 1.0 "$ping_a(396) send"	;#??Ping???

#???397???(Ping)
set ping_a(397) [new Agent/Ping]
$ns attach-agent $node_(16) $ping_a(397)
set ping_b(397) [new Agent/Ping]
$ns attach-agent $node_(14) $ping_b(397)
$ns connect $ping_a(397) $ping_b(397)	;#????Ping Agents
$ns at 1.0 "$ping_a(397) send"	;#??Ping???

#???398???(Ping)
set ping_a(398) [new Agent/Ping]
$ns attach-agent $node_(16) $ping_a(398)
set ping_b(398) [new Agent/Ping]
$ns attach-agent $node_(15) $ping_b(398)
$ns connect $ping_a(398) $ping_b(398)	;#????Ping Agents
$ns at 1.0 "$ping_a(398) send"	;#??Ping???

#???399???(Ping)
set ping_a(399) [new Agent/Ping]
$ns attach-agent $node_(16) $ping_a(399)
set ping_b(399) [new Agent/Ping]
$ns attach-agent $node_(19) $ping_b(399)
$ns connect $ping_a(399) $ping_b(399)	;#????Ping Agents
$ns at 1.0 "$ping_a(399) send"	;#??Ping???

#???400???(Ping)
set ping_a(400) [new Agent/Ping]
$ns attach-agent $node_(16) $ping_a(400)
set ping_b(400) [new Agent/Ping]
$ns attach-agent $node_(20) $ping_b(400)
$ns connect $ping_a(400) $ping_b(400)	;#????Ping Agents
$ns at 1.0 "$ping_a(400) send"	;#??Ping???

#???401???(Ping)
set ping_a(401) [new Agent/Ping]
$ns attach-agent $node_(16) $ping_a(401)
set ping_b(401) [new Agent/Ping]
$ns attach-agent $node_(21) $ping_b(401)
$ns connect $ping_a(401) $ping_b(401)	;#????Ping Agents
$ns at 1.0 "$ping_a(401) send"	;#??Ping???

#???402???(Ping)
set ping_a(402) [new Agent/Ping]
$ns attach-agent $node_(16) $ping_a(402)
set ping_b(402) [new Agent/Ping]
$ns attach-agent $node_(22) $ping_b(402)
$ns connect $ping_a(402) $ping_b(402)	;#????Ping Agents
$ns at 1.0 "$ping_a(402) send"	;#??Ping???

#???403???(Ping)
set ping_a(403) [new Agent/Ping]
$ns attach-agent $node_(16) $ping_a(403)
set ping_b(403) [new Agent/Ping]
$ns attach-agent $node_(23) $ping_b(403)
$ns connect $ping_a(403) $ping_b(403)	;#????Ping Agents
$ns at 1.0 "$ping_a(403) send"	;#??Ping???

#???404???(Ping)
set ping_a(404) [new Agent/Ping]
$ns attach-agent $node_(16) $ping_a(404)
set ping_b(404) [new Agent/Ping]
$ns attach-agent $node_(24) $ping_b(404)
$ns connect $ping_a(404) $ping_b(404)	;#????Ping Agents
$ns at 1.0 "$ping_a(404) send"	;#??Ping???

#???405???(Ping)
set ping_a(405) [new Agent/Ping]
$ns attach-agent $node_(16) $ping_a(405)
set ping_b(405) [new Agent/Ping]
$ns attach-agent $node_(25) $ping_b(405)
$ns connect $ping_a(405) $ping_b(405)	;#????Ping Agents
$ns at 1.0 "$ping_a(405) send"	;#??Ping???

#???406???(Ping)
set ping_a(406) [new Agent/Ping]
$ns attach-agent $node_(16) $ping_a(406)
set ping_b(406) [new Agent/Ping]
$ns attach-agent $node_(26) $ping_b(406)
$ns connect $ping_a(406) $ping_b(406)	;#????Ping Agents
$ns at 1.0 "$ping_a(406) send"	;#??Ping???

#???407???(Ping)
set ping_a(407) [new Agent/Ping]
$ns attach-agent $node_(16) $ping_a(407)
set ping_b(407) [new Agent/Ping]
$ns attach-agent $node_(27) $ping_b(407)
$ns connect $ping_a(407) $ping_b(407)	;#????Ping Agents
$ns at 1.0 "$ping_a(407) send"	;#??Ping???

#???408???(Ping)
set ping_a(408) [new Agent/Ping]
$ns attach-agent $node_(19) $ping_a(408)
set ping_b(408) [new Agent/Ping]
$ns attach-agent $node_(0) $ping_b(408)
$ns connect $ping_a(408) $ping_b(408)	;#????Ping Agents
$ns at 1.0 "$ping_a(408) send"	;#??Ping???

#???409???(Ping)
set ping_a(409) [new Agent/Ping]
$ns attach-agent $node_(19) $ping_a(409)
set ping_b(409) [new Agent/Ping]
$ns attach-agent $node_(1) $ping_b(409)
$ns connect $ping_a(409) $ping_b(409)	;#????Ping Agents
$ns at 1.0 "$ping_a(409) send"	;#??Ping???

#???410???(Ping)
set ping_a(410) [new Agent/Ping]
$ns attach-agent $node_(19) $ping_a(410)
set ping_b(410) [new Agent/Ping]
$ns attach-agent $node_(2) $ping_b(410)
$ns connect $ping_a(410) $ping_b(410)	;#????Ping Agents
$ns at 1.0 "$ping_a(410) send"	;#??Ping???

#???411???(Ping)
set ping_a(411) [new Agent/Ping]
$ns attach-agent $node_(19) $ping_a(411)
set ping_b(411) [new Agent/Ping]
$ns attach-agent $node_(3) $ping_b(411)
$ns connect $ping_a(411) $ping_b(411)	;#????Ping Agents
$ns at 1.0 "$ping_a(411) send"	;#??Ping???

#???412???(Ping)
set ping_a(412) [new Agent/Ping]
$ns attach-agent $node_(19) $ping_a(412)
set ping_b(412) [new Agent/Ping]
$ns attach-agent $node_(4) $ping_b(412)
$ns connect $ping_a(412) $ping_b(412)	;#????Ping Agents
$ns at 1.0 "$ping_a(412) send"	;#??Ping???

#???413???(Ping)
set ping_a(413) [new Agent/Ping]
$ns attach-agent $node_(19) $ping_a(413)
set ping_b(413) [new Agent/Ping]
$ns attach-agent $node_(5) $ping_b(413)
$ns connect $ping_a(413) $ping_b(413)	;#????Ping Agents
$ns at 1.0 "$ping_a(413) send"	;#??Ping???

#???414???(Ping)
set ping_a(414) [new Agent/Ping]
$ns attach-agent $node_(19) $ping_a(414)
set ping_b(414) [new Agent/Ping]
$ns attach-agent $node_(6) $ping_b(414)
$ns connect $ping_a(414) $ping_b(414)	;#????Ping Agents
$ns at 1.0 "$ping_a(414) send"	;#??Ping???

#???415???(Ping)
set ping_a(415) [new Agent/Ping]
$ns attach-agent $node_(19) $ping_a(415)
set ping_b(415) [new Agent/Ping]
$ns attach-agent $node_(7) $ping_b(415)
$ns connect $ping_a(415) $ping_b(415)	;#????Ping Agents
$ns at 1.0 "$ping_a(415) send"	;#??Ping???

#???416???(Ping)
set ping_a(416) [new Agent/Ping]
$ns attach-agent $node_(19) $ping_a(416)
set ping_b(416) [new Agent/Ping]
$ns attach-agent $node_(10) $ping_b(416)
$ns connect $ping_a(416) $ping_b(416)	;#????Ping Agents
$ns at 1.0 "$ping_a(416) send"	;#??Ping???

#???417???(Ping)
set ping_a(417) [new Agent/Ping]
$ns attach-agent $node_(19) $ping_a(417)
set ping_b(417) [new Agent/Ping]
$ns attach-agent $node_(11) $ping_b(417)
$ns connect $ping_a(417) $ping_b(417)	;#????Ping Agents
$ns at 1.0 "$ping_a(417) send"	;#??Ping???

#???418???(Ping)
set ping_a(418) [new Agent/Ping]
$ns attach-agent $node_(19) $ping_a(418)
set ping_b(418) [new Agent/Ping]
$ns attach-agent $node_(12) $ping_b(418)
$ns connect $ping_a(418) $ping_b(418)	;#????Ping Agents
$ns at 1.0 "$ping_a(418) send"	;#??Ping???

#???419???(Ping)
set ping_a(419) [new Agent/Ping]
$ns attach-agent $node_(19) $ping_a(419)
set ping_b(419) [new Agent/Ping]
$ns attach-agent $node_(13) $ping_b(419)
$ns connect $ping_a(419) $ping_b(419)	;#????Ping Agents
$ns at 1.0 "$ping_a(419) send"	;#??Ping???

#???420???(Ping)
set ping_a(420) [new Agent/Ping]
$ns attach-agent $node_(19) $ping_a(420)
set ping_b(420) [new Agent/Ping]
$ns attach-agent $node_(14) $ping_b(420)
$ns connect $ping_a(420) $ping_b(420)	;#????Ping Agents
$ns at 1.0 "$ping_a(420) send"	;#??Ping???

#???421???(Ping)
set ping_a(421) [new Agent/Ping]
$ns attach-agent $node_(19) $ping_a(421)
set ping_b(421) [new Agent/Ping]
$ns attach-agent $node_(15) $ping_b(421)
$ns connect $ping_a(421) $ping_b(421)	;#????Ping Agents
$ns at 1.0 "$ping_a(421) send"	;#??Ping???

#???422???(Ping)
set ping_a(422) [new Agent/Ping]
$ns attach-agent $node_(19) $ping_a(422)
set ping_b(422) [new Agent/Ping]
$ns attach-agent $node_(16) $ping_b(422)
$ns connect $ping_a(422) $ping_b(422)	;#????Ping Agents
$ns at 1.0 "$ping_a(422) send"	;#??Ping???

#???423???(Ping)
set ping_a(423) [new Agent/Ping]
$ns attach-agent $node_(19) $ping_a(423)
set ping_b(423) [new Agent/Ping]
$ns attach-agent $node_(20) $ping_b(423)
$ns connect $ping_a(423) $ping_b(423)	;#????Ping Agents
$ns at 1.0 "$ping_a(423) send"	;#??Ping???

#???424???(Ping)
set ping_a(424) [new Agent/Ping]
$ns attach-agent $node_(19) $ping_a(424)
set ping_b(424) [new Agent/Ping]
$ns attach-agent $node_(21) $ping_b(424)
$ns connect $ping_a(424) $ping_b(424)	;#????Ping Agents
$ns at 1.0 "$ping_a(424) send"	;#??Ping???

#???425???(Ping)
set ping_a(425) [new Agent/Ping]
$ns attach-agent $node_(19) $ping_a(425)
set ping_b(425) [new Agent/Ping]
$ns attach-agent $node_(22) $ping_b(425)
$ns connect $ping_a(425) $ping_b(425)	;#????Ping Agents
$ns at 1.0 "$ping_a(425) send"	;#??Ping???

#???426???(Ping)
set ping_a(426) [new Agent/Ping]
$ns attach-agent $node_(19) $ping_a(426)
set ping_b(426) [new Agent/Ping]
$ns attach-agent $node_(23) $ping_b(426)
$ns connect $ping_a(426) $ping_b(426)	;#????Ping Agents
$ns at 1.0 "$ping_a(426) send"	;#??Ping???

#???427???(Ping)
set ping_a(427) [new Agent/Ping]
$ns attach-agent $node_(19) $ping_a(427)
set ping_b(427) [new Agent/Ping]
$ns attach-agent $node_(24) $ping_b(427)
$ns connect $ping_a(427) $ping_b(427)	;#????Ping Agents
$ns at 1.0 "$ping_a(427) send"	;#??Ping???

#???428???(Ping)
set ping_a(428) [new Agent/Ping]
$ns attach-agent $node_(19) $ping_a(428)
set ping_b(428) [new Agent/Ping]
$ns attach-agent $node_(25) $ping_b(428)
$ns connect $ping_a(428) $ping_b(428)	;#????Ping Agents
$ns at 1.0 "$ping_a(428) send"	;#??Ping???

#???429???(Ping)
set ping_a(429) [new Agent/Ping]
$ns attach-agent $node_(19) $ping_a(429)
set ping_b(429) [new Agent/Ping]
$ns attach-agent $node_(26) $ping_b(429)
$ns connect $ping_a(429) $ping_b(429)	;#????Ping Agents
$ns at 1.0 "$ping_a(429) send"	;#??Ping???

#???430???(Ping)
set ping_a(430) [new Agent/Ping]
$ns attach-agent $node_(19) $ping_a(430)
set ping_b(430) [new Agent/Ping]
$ns attach-agent $node_(27) $ping_b(430)
$ns connect $ping_a(430) $ping_b(430)	;#????Ping Agents
$ns at 1.0 "$ping_a(430) send"	;#??Ping???

#???431???(Ping)
set ping_a(431) [new Agent/Ping]
$ns attach-agent $node_(20) $ping_a(431)
set ping_b(431) [new Agent/Ping]
$ns attach-agent $node_(0) $ping_b(431)
$ns connect $ping_a(431) $ping_b(431)	;#????Ping Agents
$ns at 1.0 "$ping_a(431) send"	;#??Ping???

#???432???(Ping)
set ping_a(432) [new Agent/Ping]
$ns attach-agent $node_(20) $ping_a(432)
set ping_b(432) [new Agent/Ping]
$ns attach-agent $node_(1) $ping_b(432)
$ns connect $ping_a(432) $ping_b(432)	;#????Ping Agents
$ns at 1.0 "$ping_a(432) send"	;#??Ping???

#???433???(Ping)
set ping_a(433) [new Agent/Ping]
$ns attach-agent $node_(20) $ping_a(433)
set ping_b(433) [new Agent/Ping]
$ns attach-agent $node_(2) $ping_b(433)
$ns connect $ping_a(433) $ping_b(433)	;#????Ping Agents
$ns at 1.0 "$ping_a(433) send"	;#??Ping???

#???434???(Ping)
set ping_a(434) [new Agent/Ping]
$ns attach-agent $node_(20) $ping_a(434)
set ping_b(434) [new Agent/Ping]
$ns attach-agent $node_(3) $ping_b(434)
$ns connect $ping_a(434) $ping_b(434)	;#????Ping Agents
$ns at 1.0 "$ping_a(434) send"	;#??Ping???

#???435???(Ping)
set ping_a(435) [new Agent/Ping]
$ns attach-agent $node_(20) $ping_a(435)
set ping_b(435) [new Agent/Ping]
$ns attach-agent $node_(4) $ping_b(435)
$ns connect $ping_a(435) $ping_b(435)	;#????Ping Agents
$ns at 1.0 "$ping_a(435) send"	;#??Ping???

#???436???(Ping)
set ping_a(436) [new Agent/Ping]
$ns attach-agent $node_(20) $ping_a(436)
set ping_b(436) [new Agent/Ping]
$ns attach-agent $node_(5) $ping_b(436)
$ns connect $ping_a(436) $ping_b(436)	;#????Ping Agents
$ns at 1.0 "$ping_a(436) send"	;#??Ping???

#???437???(Ping)
set ping_a(437) [new Agent/Ping]
$ns attach-agent $node_(20) $ping_a(437)
set ping_b(437) [new Agent/Ping]
$ns attach-agent $node_(6) $ping_b(437)
$ns connect $ping_a(437) $ping_b(437)	;#????Ping Agents
$ns at 1.0 "$ping_a(437) send"	;#??Ping???

#???438???(Ping)
set ping_a(438) [new Agent/Ping]
$ns attach-agent $node_(20) $ping_a(438)
set ping_b(438) [new Agent/Ping]
$ns attach-agent $node_(7) $ping_b(438)
$ns connect $ping_a(438) $ping_b(438)	;#????Ping Agents
$ns at 1.0 "$ping_a(438) send"	;#??Ping???

#???439???(Ping)
set ping_a(439) [new Agent/Ping]
$ns attach-agent $node_(20) $ping_a(439)
set ping_b(439) [new Agent/Ping]
$ns attach-agent $node_(10) $ping_b(439)
$ns connect $ping_a(439) $ping_b(439)	;#????Ping Agents
$ns at 1.0 "$ping_a(439) send"	;#??Ping???

#???440???(Ping)
set ping_a(440) [new Agent/Ping]
$ns attach-agent $node_(20) $ping_a(440)
set ping_b(440) [new Agent/Ping]
$ns attach-agent $node_(11) $ping_b(440)
$ns connect $ping_a(440) $ping_b(440)	;#????Ping Agents
$ns at 1.0 "$ping_a(440) send"	;#??Ping???

#???441???(Ping)
set ping_a(441) [new Agent/Ping]
$ns attach-agent $node_(20) $ping_a(441)
set ping_b(441) [new Agent/Ping]
$ns attach-agent $node_(12) $ping_b(441)
$ns connect $ping_a(441) $ping_b(441)	;#????Ping Agents
$ns at 1.0 "$ping_a(441) send"	;#??Ping???

#???442???(Ping)
set ping_a(442) [new Agent/Ping]
$ns attach-agent $node_(20) $ping_a(442)
set ping_b(442) [new Agent/Ping]
$ns attach-agent $node_(13) $ping_b(442)
$ns connect $ping_a(442) $ping_b(442)	;#????Ping Agents
$ns at 1.0 "$ping_a(442) send"	;#??Ping???

#???443???(Ping)
set ping_a(443) [new Agent/Ping]
$ns attach-agent $node_(20) $ping_a(443)
set ping_b(443) [new Agent/Ping]
$ns attach-agent $node_(14) $ping_b(443)
$ns connect $ping_a(443) $ping_b(443)	;#????Ping Agents
$ns at 1.0 "$ping_a(443) send"	;#??Ping???

#???444???(Ping)
set ping_a(444) [new Agent/Ping]
$ns attach-agent $node_(20) $ping_a(444)
set ping_b(444) [new Agent/Ping]
$ns attach-agent $node_(15) $ping_b(444)
$ns connect $ping_a(444) $ping_b(444)	;#????Ping Agents
$ns at 1.0 "$ping_a(444) send"	;#??Ping???

#???445???(Ping)
set ping_a(445) [new Agent/Ping]
$ns attach-agent $node_(20) $ping_a(445)
set ping_b(445) [new Agent/Ping]
$ns attach-agent $node_(16) $ping_b(445)
$ns connect $ping_a(445) $ping_b(445)	;#????Ping Agents
$ns at 1.0 "$ping_a(445) send"	;#??Ping???

#???446???(Ping)
set ping_a(446) [new Agent/Ping]
$ns attach-agent $node_(20) $ping_a(446)
set ping_b(446) [new Agent/Ping]
$ns attach-agent $node_(19) $ping_b(446)
$ns connect $ping_a(446) $ping_b(446)	;#????Ping Agents
$ns at 1.0 "$ping_a(446) send"	;#??Ping???

#???447???(Ping)
set ping_a(447) [new Agent/Ping]
$ns attach-agent $node_(20) $ping_a(447)
set ping_b(447) [new Agent/Ping]
$ns attach-agent $node_(21) $ping_b(447)
$ns connect $ping_a(447) $ping_b(447)	;#????Ping Agents
$ns at 1.0 "$ping_a(447) send"	;#??Ping???

#???448???(Ping)
set ping_a(448) [new Agent/Ping]
$ns attach-agent $node_(20) $ping_a(448)
set ping_b(448) [new Agent/Ping]
$ns attach-agent $node_(22) $ping_b(448)
$ns connect $ping_a(448) $ping_b(448)	;#????Ping Agents
$ns at 1.0 "$ping_a(448) send"	;#??Ping???

#???449???(Ping)
set ping_a(449) [new Agent/Ping]
$ns attach-agent $node_(20) $ping_a(449)
set ping_b(449) [new Agent/Ping]
$ns attach-agent $node_(23) $ping_b(449)
$ns connect $ping_a(449) $ping_b(449)	;#????Ping Agents
$ns at 1.0 "$ping_a(449) send"	;#??Ping???

#???450???(Ping)
set ping_a(450) [new Agent/Ping]
$ns attach-agent $node_(20) $ping_a(450)
set ping_b(450) [new Agent/Ping]
$ns attach-agent $node_(24) $ping_b(450)
$ns connect $ping_a(450) $ping_b(450)	;#????Ping Agents
$ns at 1.0 "$ping_a(450) send"	;#??Ping???

#???451???(Ping)
set ping_a(451) [new Agent/Ping]
$ns attach-agent $node_(20) $ping_a(451)
set ping_b(451) [new Agent/Ping]
$ns attach-agent $node_(25) $ping_b(451)
$ns connect $ping_a(451) $ping_b(451)	;#????Ping Agents
$ns at 1.0 "$ping_a(451) send"	;#??Ping???

#???452???(Ping)
set ping_a(452) [new Agent/Ping]
$ns attach-agent $node_(20) $ping_a(452)
set ping_b(452) [new Agent/Ping]
$ns attach-agent $node_(26) $ping_b(452)
$ns connect $ping_a(452) $ping_b(452)	;#????Ping Agents
$ns at 1.0 "$ping_a(452) send"	;#??Ping???

#???453???(Ping)
set ping_a(453) [new Agent/Ping]
$ns attach-agent $node_(20) $ping_a(453)
set ping_b(453) [new Agent/Ping]
$ns attach-agent $node_(27) $ping_b(453)
$ns connect $ping_a(453) $ping_b(453)	;#????Ping Agents
$ns at 1.0 "$ping_a(453) send"	;#??Ping???

#???454???(Ping)
set ping_a(454) [new Agent/Ping]
$ns attach-agent $node_(21) $ping_a(454)
set ping_b(454) [new Agent/Ping]
$ns attach-agent $node_(0) $ping_b(454)
$ns connect $ping_a(454) $ping_b(454)	;#????Ping Agents
$ns at 1.0 "$ping_a(454) send"	;#??Ping???

#???455???(Ping)
set ping_a(455) [new Agent/Ping]
$ns attach-agent $node_(21) $ping_a(455)
set ping_b(455) [new Agent/Ping]
$ns attach-agent $node_(1) $ping_b(455)
$ns connect $ping_a(455) $ping_b(455)	;#????Ping Agents
$ns at 1.0 "$ping_a(455) send"	;#??Ping???

#???456???(Ping)
set ping_a(456) [new Agent/Ping]
$ns attach-agent $node_(21) $ping_a(456)
set ping_b(456) [new Agent/Ping]
$ns attach-agent $node_(2) $ping_b(456)
$ns connect $ping_a(456) $ping_b(456)	;#????Ping Agents
$ns at 1.0 "$ping_a(456) send"	;#??Ping???

#???457???(Ping)
set ping_a(457) [new Agent/Ping]
$ns attach-agent $node_(21) $ping_a(457)
set ping_b(457) [new Agent/Ping]
$ns attach-agent $node_(3) $ping_b(457)
$ns connect $ping_a(457) $ping_b(457)	;#????Ping Agents
$ns at 1.0 "$ping_a(457) send"	;#??Ping???

#???458???(Ping)
set ping_a(458) [new Agent/Ping]
$ns attach-agent $node_(21) $ping_a(458)
set ping_b(458) [new Agent/Ping]
$ns attach-agent $node_(4) $ping_b(458)
$ns connect $ping_a(458) $ping_b(458)	;#????Ping Agents
$ns at 1.0 "$ping_a(458) send"	;#??Ping???

#???459???(Ping)
set ping_a(459) [new Agent/Ping]
$ns attach-agent $node_(21) $ping_a(459)
set ping_b(459) [new Agent/Ping]
$ns attach-agent $node_(5) $ping_b(459)
$ns connect $ping_a(459) $ping_b(459)	;#????Ping Agents
$ns at 1.0 "$ping_a(459) send"	;#??Ping???

#???460???(Ping)
set ping_a(460) [new Agent/Ping]
$ns attach-agent $node_(21) $ping_a(460)
set ping_b(460) [new Agent/Ping]
$ns attach-agent $node_(6) $ping_b(460)
$ns connect $ping_a(460) $ping_b(460)	;#????Ping Agents
$ns at 1.0 "$ping_a(460) send"	;#??Ping???

#???461???(Ping)
set ping_a(461) [new Agent/Ping]
$ns attach-agent $node_(21) $ping_a(461)
set ping_b(461) [new Agent/Ping]
$ns attach-agent $node_(7) $ping_b(461)
$ns connect $ping_a(461) $ping_b(461)	;#????Ping Agents
$ns at 1.0 "$ping_a(461) send"	;#??Ping???

#???462???(Ping)
set ping_a(462) [new Agent/Ping]
$ns attach-agent $node_(21) $ping_a(462)
set ping_b(462) [new Agent/Ping]
$ns attach-agent $node_(10) $ping_b(462)
$ns connect $ping_a(462) $ping_b(462)	;#????Ping Agents
$ns at 1.0 "$ping_a(462) send"	;#??Ping???

#???463???(Ping)
set ping_a(463) [new Agent/Ping]
$ns attach-agent $node_(21) $ping_a(463)
set ping_b(463) [new Agent/Ping]
$ns attach-agent $node_(11) $ping_b(463)
$ns connect $ping_a(463) $ping_b(463)	;#????Ping Agents
$ns at 1.0 "$ping_a(463) send"	;#??Ping???

#???464???(Ping)
set ping_a(464) [new Agent/Ping]
$ns attach-agent $node_(21) $ping_a(464)
set ping_b(464) [new Agent/Ping]
$ns attach-agent $node_(12) $ping_b(464)
$ns connect $ping_a(464) $ping_b(464)	;#????Ping Agents
$ns at 1.0 "$ping_a(464) send"	;#??Ping???

#???465???(Ping)
set ping_a(465) [new Agent/Ping]
$ns attach-agent $node_(21) $ping_a(465)
set ping_b(465) [new Agent/Ping]
$ns attach-agent $node_(13) $ping_b(465)
$ns connect $ping_a(465) $ping_b(465)	;#????Ping Agents
$ns at 1.0 "$ping_a(465) send"	;#??Ping???

#???466???(Ping)
set ping_a(466) [new Agent/Ping]
$ns attach-agent $node_(21) $ping_a(466)
set ping_b(466) [new Agent/Ping]
$ns attach-agent $node_(14) $ping_b(466)
$ns connect $ping_a(466) $ping_b(466)	;#????Ping Agents
$ns at 1.0 "$ping_a(466) send"	;#??Ping???

#???467???(Ping)
set ping_a(467) [new Agent/Ping]
$ns attach-agent $node_(21) $ping_a(467)
set ping_b(467) [new Agent/Ping]
$ns attach-agent $node_(15) $ping_b(467)
$ns connect $ping_a(467) $ping_b(467)	;#????Ping Agents
$ns at 1.0 "$ping_a(467) send"	;#??Ping???

#???468???(Ping)
set ping_a(468) [new Agent/Ping]
$ns attach-agent $node_(21) $ping_a(468)
set ping_b(468) [new Agent/Ping]
$ns attach-agent $node_(16) $ping_b(468)
$ns connect $ping_a(468) $ping_b(468)	;#????Ping Agents
$ns at 1.0 "$ping_a(468) send"	;#??Ping???

#???469???(Ping)
set ping_a(469) [new Agent/Ping]
$ns attach-agent $node_(21) $ping_a(469)
set ping_b(469) [new Agent/Ping]
$ns attach-agent $node_(19) $ping_b(469)
$ns connect $ping_a(469) $ping_b(469)	;#????Ping Agents
$ns at 1.0 "$ping_a(469) send"	;#??Ping???

#???470???(Ping)
set ping_a(470) [new Agent/Ping]
$ns attach-agent $node_(21) $ping_a(470)
set ping_b(470) [new Agent/Ping]
$ns attach-agent $node_(20) $ping_b(470)
$ns connect $ping_a(470) $ping_b(470)	;#????Ping Agents
$ns at 1.0 "$ping_a(470) send"	;#??Ping???

#???471???(Ping)
set ping_a(471) [new Agent/Ping]
$ns attach-agent $node_(21) $ping_a(471)
set ping_b(471) [new Agent/Ping]
$ns attach-agent $node_(22) $ping_b(471)
$ns connect $ping_a(471) $ping_b(471)	;#????Ping Agents
$ns at 1.0 "$ping_a(471) send"	;#??Ping???

#???472???(Ping)
set ping_a(472) [new Agent/Ping]
$ns attach-agent $node_(21) $ping_a(472)
set ping_b(472) [new Agent/Ping]
$ns attach-agent $node_(23) $ping_b(472)
$ns connect $ping_a(472) $ping_b(472)	;#????Ping Agents
$ns at 1.0 "$ping_a(472) send"	;#??Ping???

#???473???(Ping)
set ping_a(473) [new Agent/Ping]
$ns attach-agent $node_(21) $ping_a(473)
set ping_b(473) [new Agent/Ping]
$ns attach-agent $node_(24) $ping_b(473)
$ns connect $ping_a(473) $ping_b(473)	;#????Ping Agents
$ns at 1.0 "$ping_a(473) send"	;#??Ping???

#???474???(Ping)
set ping_a(474) [new Agent/Ping]
$ns attach-agent $node_(21) $ping_a(474)
set ping_b(474) [new Agent/Ping]
$ns attach-agent $node_(25) $ping_b(474)
$ns connect $ping_a(474) $ping_b(474)	;#????Ping Agents
$ns at 1.0 "$ping_a(474) send"	;#??Ping???

#???475???(Ping)
set ping_a(475) [new Agent/Ping]
$ns attach-agent $node_(21) $ping_a(475)
set ping_b(475) [new Agent/Ping]
$ns attach-agent $node_(26) $ping_b(475)
$ns connect $ping_a(475) $ping_b(475)	;#????Ping Agents
$ns at 1.0 "$ping_a(475) send"	;#??Ping???

#???476???(Ping)
set ping_a(476) [new Agent/Ping]
$ns attach-agent $node_(21) $ping_a(476)
set ping_b(476) [new Agent/Ping]
$ns attach-agent $node_(27) $ping_b(476)
$ns connect $ping_a(476) $ping_b(476)	;#????Ping Agents
$ns at 1.0 "$ping_a(476) send"	;#??Ping???

#???477???(Ping)
set ping_a(477) [new Agent/Ping]
$ns attach-agent $node_(22) $ping_a(477)
set ping_b(477) [new Agent/Ping]
$ns attach-agent $node_(0) $ping_b(477)
$ns connect $ping_a(477) $ping_b(477)	;#????Ping Agents
$ns at 1.0 "$ping_a(477) send"	;#??Ping???

#???478???(Ping)
set ping_a(478) [new Agent/Ping]
$ns attach-agent $node_(22) $ping_a(478)
set ping_b(478) [new Agent/Ping]
$ns attach-agent $node_(1) $ping_b(478)
$ns connect $ping_a(478) $ping_b(478)	;#????Ping Agents
$ns at 1.0 "$ping_a(478) send"	;#??Ping???

#???479???(Ping)
set ping_a(479) [new Agent/Ping]
$ns attach-agent $node_(22) $ping_a(479)
set ping_b(479) [new Agent/Ping]
$ns attach-agent $node_(2) $ping_b(479)
$ns connect $ping_a(479) $ping_b(479)	;#????Ping Agents
$ns at 1.0 "$ping_a(479) send"	;#??Ping???

#???480???(Ping)
set ping_a(480) [new Agent/Ping]
$ns attach-agent $node_(22) $ping_a(480)
set ping_b(480) [new Agent/Ping]
$ns attach-agent $node_(3) $ping_b(480)
$ns connect $ping_a(480) $ping_b(480)	;#????Ping Agents
$ns at 1.0 "$ping_a(480) send"	;#??Ping???

#???481???(Ping)
set ping_a(481) [new Agent/Ping]
$ns attach-agent $node_(22) $ping_a(481)
set ping_b(481) [new Agent/Ping]
$ns attach-agent $node_(4) $ping_b(481)
$ns connect $ping_a(481) $ping_b(481)	;#????Ping Agents
$ns at 1.0 "$ping_a(481) send"	;#??Ping???

#???482???(Ping)
set ping_a(482) [new Agent/Ping]
$ns attach-agent $node_(22) $ping_a(482)
set ping_b(482) [new Agent/Ping]
$ns attach-agent $node_(5) $ping_b(482)
$ns connect $ping_a(482) $ping_b(482)	;#????Ping Agents
$ns at 1.0 "$ping_a(482) send"	;#??Ping???

#???483???(Ping)
set ping_a(483) [new Agent/Ping]
$ns attach-agent $node_(22) $ping_a(483)
set ping_b(483) [new Agent/Ping]
$ns attach-agent $node_(6) $ping_b(483)
$ns connect $ping_a(483) $ping_b(483)	;#????Ping Agents
$ns at 1.0 "$ping_a(483) send"	;#??Ping???

#???484???(Ping)
set ping_a(484) [new Agent/Ping]
$ns attach-agent $node_(22) $ping_a(484)
set ping_b(484) [new Agent/Ping]
$ns attach-agent $node_(7) $ping_b(484)
$ns connect $ping_a(484) $ping_b(484)	;#????Ping Agents
$ns at 1.0 "$ping_a(484) send"	;#??Ping???

#???485???(Ping)
set ping_a(485) [new Agent/Ping]
$ns attach-agent $node_(22) $ping_a(485)
set ping_b(485) [new Agent/Ping]
$ns attach-agent $node_(10) $ping_b(485)
$ns connect $ping_a(485) $ping_b(485)	;#????Ping Agents
$ns at 1.0 "$ping_a(485) send"	;#??Ping???

#???486???(Ping)
set ping_a(486) [new Agent/Ping]
$ns attach-agent $node_(22) $ping_a(486)
set ping_b(486) [new Agent/Ping]
$ns attach-agent $node_(11) $ping_b(486)
$ns connect $ping_a(486) $ping_b(486)	;#????Ping Agents
$ns at 1.0 "$ping_a(486) send"	;#??Ping???

#???487???(Ping)
set ping_a(487) [new Agent/Ping]
$ns attach-agent $node_(22) $ping_a(487)
set ping_b(487) [new Agent/Ping]
$ns attach-agent $node_(12) $ping_b(487)
$ns connect $ping_a(487) $ping_b(487)	;#????Ping Agents
$ns at 1.0 "$ping_a(487) send"	;#??Ping???

#???488???(Ping)
set ping_a(488) [new Agent/Ping]
$ns attach-agent $node_(22) $ping_a(488)
set ping_b(488) [new Agent/Ping]
$ns attach-agent $node_(13) $ping_b(488)
$ns connect $ping_a(488) $ping_b(488)	;#????Ping Agents
$ns at 1.0 "$ping_a(488) send"	;#??Ping???

#???489???(Ping)
set ping_a(489) [new Agent/Ping]
$ns attach-agent $node_(22) $ping_a(489)
set ping_b(489) [new Agent/Ping]
$ns attach-agent $node_(14) $ping_b(489)
$ns connect $ping_a(489) $ping_b(489)	;#????Ping Agents
$ns at 1.0 "$ping_a(489) send"	;#??Ping???

#???490???(Ping)
set ping_a(490) [new Agent/Ping]
$ns attach-agent $node_(22) $ping_a(490)
set ping_b(490) [new Agent/Ping]
$ns attach-agent $node_(15) $ping_b(490)
$ns connect $ping_a(490) $ping_b(490)	;#????Ping Agents
$ns at 1.0 "$ping_a(490) send"	;#??Ping???

#???491???(Ping)
set ping_a(491) [new Agent/Ping]
$ns attach-agent $node_(22) $ping_a(491)
set ping_b(491) [new Agent/Ping]
$ns attach-agent $node_(16) $ping_b(491)
$ns connect $ping_a(491) $ping_b(491)	;#????Ping Agents
$ns at 1.0 "$ping_a(491) send"	;#??Ping???

#???492???(Ping)
set ping_a(492) [new Agent/Ping]
$ns attach-agent $node_(22) $ping_a(492)
set ping_b(492) [new Agent/Ping]
$ns attach-agent $node_(19) $ping_b(492)
$ns connect $ping_a(492) $ping_b(492)	;#????Ping Agents
$ns at 1.0 "$ping_a(492) send"	;#??Ping???

#???493???(Ping)
set ping_a(493) [new Agent/Ping]
$ns attach-agent $node_(22) $ping_a(493)
set ping_b(493) [new Agent/Ping]
$ns attach-agent $node_(20) $ping_b(493)
$ns connect $ping_a(493) $ping_b(493)	;#????Ping Agents
$ns at 1.0 "$ping_a(493) send"	;#??Ping???

#???494???(Ping)
set ping_a(494) [new Agent/Ping]
$ns attach-agent $node_(22) $ping_a(494)
set ping_b(494) [new Agent/Ping]
$ns attach-agent $node_(21) $ping_b(494)
$ns connect $ping_a(494) $ping_b(494)	;#????Ping Agents
$ns at 1.0 "$ping_a(494) send"	;#??Ping???

#???495???(Ping)
set ping_a(495) [new Agent/Ping]
$ns attach-agent $node_(22) $ping_a(495)
set ping_b(495) [new Agent/Ping]
$ns attach-agent $node_(23) $ping_b(495)
$ns connect $ping_a(495) $ping_b(495)	;#????Ping Agents
$ns at 1.0 "$ping_a(495) send"	;#??Ping???

#???496???(Ping)
set ping_a(496) [new Agent/Ping]
$ns attach-agent $node_(22) $ping_a(496)
set ping_b(496) [new Agent/Ping]
$ns attach-agent $node_(24) $ping_b(496)
$ns connect $ping_a(496) $ping_b(496)	;#????Ping Agents
$ns at 1.0 "$ping_a(496) send"	;#??Ping???

#???497???(Ping)
set ping_a(497) [new Agent/Ping]
$ns attach-agent $node_(22) $ping_a(497)
set ping_b(497) [new Agent/Ping]
$ns attach-agent $node_(25) $ping_b(497)
$ns connect $ping_a(497) $ping_b(497)	;#????Ping Agents
$ns at 1.0 "$ping_a(497) send"	;#??Ping???

#???498???(Ping)
set ping_a(498) [new Agent/Ping]
$ns attach-agent $node_(22) $ping_a(498)
set ping_b(498) [new Agent/Ping]
$ns attach-agent $node_(26) $ping_b(498)
$ns connect $ping_a(498) $ping_b(498)	;#????Ping Agents
$ns at 1.0 "$ping_a(498) send"	;#??Ping???

#???499???(Ping)
set ping_a(499) [new Agent/Ping]
$ns attach-agent $node_(22) $ping_a(499)
set ping_b(499) [new Agent/Ping]
$ns attach-agent $node_(27) $ping_b(499)
$ns connect $ping_a(499) $ping_b(499)	;#????Ping Agents
$ns at 1.0 "$ping_a(499) send"	;#??Ping???

#???500???(Ping)
set ping_a(500) [new Agent/Ping]
$ns attach-agent $node_(23) $ping_a(500)
set ping_b(500) [new Agent/Ping]
$ns attach-agent $node_(0) $ping_b(500)
$ns connect $ping_a(500) $ping_b(500)	;#????Ping Agents
$ns at 1.0 "$ping_a(500) send"	;#??Ping???

#???501???(Ping)
set ping_a(501) [new Agent/Ping]
$ns attach-agent $node_(23) $ping_a(501)
set ping_b(501) [new Agent/Ping]
$ns attach-agent $node_(1) $ping_b(501)
$ns connect $ping_a(501) $ping_b(501)	;#????Ping Agents
$ns at 1.0 "$ping_a(501) send"	;#??Ping???

#???502???(Ping)
set ping_a(502) [new Agent/Ping]
$ns attach-agent $node_(23) $ping_a(502)
set ping_b(502) [new Agent/Ping]
$ns attach-agent $node_(2) $ping_b(502)
$ns connect $ping_a(502) $ping_b(502)	;#????Ping Agents
$ns at 1.0 "$ping_a(502) send"	;#??Ping???

#???503???(Ping)
set ping_a(503) [new Agent/Ping]
$ns attach-agent $node_(23) $ping_a(503)
set ping_b(503) [new Agent/Ping]
$ns attach-agent $node_(3) $ping_b(503)
$ns connect $ping_a(503) $ping_b(503)	;#????Ping Agents
$ns at 1.0 "$ping_a(503) send"	;#??Ping???

#???504???(Ping)
set ping_a(504) [new Agent/Ping]
$ns attach-agent $node_(23) $ping_a(504)
set ping_b(504) [new Agent/Ping]
$ns attach-agent $node_(4) $ping_b(504)
$ns connect $ping_a(504) $ping_b(504)	;#????Ping Agents
$ns at 1.0 "$ping_a(504) send"	;#??Ping???

#???505???(Ping)
set ping_a(505) [new Agent/Ping]
$ns attach-agent $node_(23) $ping_a(505)
set ping_b(505) [new Agent/Ping]
$ns attach-agent $node_(5) $ping_b(505)
$ns connect $ping_a(505) $ping_b(505)	;#????Ping Agents
$ns at 1.0 "$ping_a(505) send"	;#??Ping???

#???506???(Ping)
set ping_a(506) [new Agent/Ping]
$ns attach-agent $node_(23) $ping_a(506)
set ping_b(506) [new Agent/Ping]
$ns attach-agent $node_(6) $ping_b(506)
$ns connect $ping_a(506) $ping_b(506)	;#????Ping Agents
$ns at 1.0 "$ping_a(506) send"	;#??Ping???

#???507???(Ping)
set ping_a(507) [new Agent/Ping]
$ns attach-agent $node_(23) $ping_a(507)
set ping_b(507) [new Agent/Ping]
$ns attach-agent $node_(7) $ping_b(507)
$ns connect $ping_a(507) $ping_b(507)	;#????Ping Agents
$ns at 1.0 "$ping_a(507) send"	;#??Ping???

#???508???(Ping)
set ping_a(508) [new Agent/Ping]
$ns attach-agent $node_(23) $ping_a(508)
set ping_b(508) [new Agent/Ping]
$ns attach-agent $node_(10) $ping_b(508)
$ns connect $ping_a(508) $ping_b(508)	;#????Ping Agents
$ns at 1.0 "$ping_a(508) send"	;#??Ping???

#???509???(Ping)
set ping_a(509) [new Agent/Ping]
$ns attach-agent $node_(23) $ping_a(509)
set ping_b(509) [new Agent/Ping]
$ns attach-agent $node_(11) $ping_b(509)
$ns connect $ping_a(509) $ping_b(509)	;#????Ping Agents
$ns at 1.0 "$ping_a(509) send"	;#??Ping???

#???510???(Ping)
set ping_a(510) [new Agent/Ping]
$ns attach-agent $node_(23) $ping_a(510)
set ping_b(510) [new Agent/Ping]
$ns attach-agent $node_(12) $ping_b(510)
$ns connect $ping_a(510) $ping_b(510)	;#????Ping Agents
$ns at 1.0 "$ping_a(510) send"	;#??Ping???

#???511???(Ping)
set ping_a(511) [new Agent/Ping]
$ns attach-agent $node_(23) $ping_a(511)
set ping_b(511) [new Agent/Ping]
$ns attach-agent $node_(13) $ping_b(511)
$ns connect $ping_a(511) $ping_b(511)	;#????Ping Agents
$ns at 1.0 "$ping_a(511) send"	;#??Ping???

#???512???(Ping)
set ping_a(512) [new Agent/Ping]
$ns attach-agent $node_(23) $ping_a(512)
set ping_b(512) [new Agent/Ping]
$ns attach-agent $node_(14) $ping_b(512)
$ns connect $ping_a(512) $ping_b(512)	;#????Ping Agents
$ns at 1.0 "$ping_a(512) send"	;#??Ping???

#???513???(Ping)
set ping_a(513) [new Agent/Ping]
$ns attach-agent $node_(23) $ping_a(513)
set ping_b(513) [new Agent/Ping]
$ns attach-agent $node_(15) $ping_b(513)
$ns connect $ping_a(513) $ping_b(513)	;#????Ping Agents
$ns at 1.0 "$ping_a(513) send"	;#??Ping???

#???514???(Ping)
set ping_a(514) [new Agent/Ping]
$ns attach-agent $node_(23) $ping_a(514)
set ping_b(514) [new Agent/Ping]
$ns attach-agent $node_(16) $ping_b(514)
$ns connect $ping_a(514) $ping_b(514)	;#????Ping Agents
$ns at 1.0 "$ping_a(514) send"	;#??Ping???

#???515???(Ping)
set ping_a(515) [new Agent/Ping]
$ns attach-agent $node_(23) $ping_a(515)
set ping_b(515) [new Agent/Ping]
$ns attach-agent $node_(19) $ping_b(515)
$ns connect $ping_a(515) $ping_b(515)	;#????Ping Agents
$ns at 1.0 "$ping_a(515) send"	;#??Ping???

#???516???(Ping)
set ping_a(516) [new Agent/Ping]
$ns attach-agent $node_(23) $ping_a(516)
set ping_b(516) [new Agent/Ping]
$ns attach-agent $node_(20) $ping_b(516)
$ns connect $ping_a(516) $ping_b(516)	;#????Ping Agents
$ns at 1.0 "$ping_a(516) send"	;#??Ping???

#???517???(Ping)
set ping_a(517) [new Agent/Ping]
$ns attach-agent $node_(23) $ping_a(517)
set ping_b(517) [new Agent/Ping]
$ns attach-agent $node_(21) $ping_b(517)
$ns connect $ping_a(517) $ping_b(517)	;#????Ping Agents
$ns at 1.0 "$ping_a(517) send"	;#??Ping???

#???518???(Ping)
set ping_a(518) [new Agent/Ping]
$ns attach-agent $node_(23) $ping_a(518)
set ping_b(518) [new Agent/Ping]
$ns attach-agent $node_(22) $ping_b(518)
$ns connect $ping_a(518) $ping_b(518)	;#????Ping Agents
$ns at 1.0 "$ping_a(518) send"	;#??Ping???

#???519???(Ping)
set ping_a(519) [new Agent/Ping]
$ns attach-agent $node_(23) $ping_a(519)
set ping_b(519) [new Agent/Ping]
$ns attach-agent $node_(24) $ping_b(519)
$ns connect $ping_a(519) $ping_b(519)	;#????Ping Agents
$ns at 1.0 "$ping_a(519) send"	;#??Ping???

#???520???(Ping)
set ping_a(520) [new Agent/Ping]
$ns attach-agent $node_(23) $ping_a(520)
set ping_b(520) [new Agent/Ping]
$ns attach-agent $node_(25) $ping_b(520)
$ns connect $ping_a(520) $ping_b(520)	;#????Ping Agents
$ns at 1.0 "$ping_a(520) send"	;#??Ping???

#???521???(Ping)
set ping_a(521) [new Agent/Ping]
$ns attach-agent $node_(23) $ping_a(521)
set ping_b(521) [new Agent/Ping]
$ns attach-agent $node_(26) $ping_b(521)
$ns connect $ping_a(521) $ping_b(521)	;#????Ping Agents
$ns at 1.0 "$ping_a(521) send"	;#??Ping???

#???522???(Ping)
set ping_a(522) [new Agent/Ping]
$ns attach-agent $node_(23) $ping_a(522)
set ping_b(522) [new Agent/Ping]
$ns attach-agent $node_(27) $ping_b(522)
$ns connect $ping_a(522) $ping_b(522)	;#????Ping Agents
$ns at 1.0 "$ping_a(522) send"	;#??Ping???

#???523???(Ping)
set ping_a(523) [new Agent/Ping]
$ns attach-agent $node_(24) $ping_a(523)
set ping_b(523) [new Agent/Ping]
$ns attach-agent $node_(0) $ping_b(523)
$ns connect $ping_a(523) $ping_b(523)	;#????Ping Agents
$ns at 1.0 "$ping_a(523) send"	;#??Ping???

#???524???(Ping)
set ping_a(524) [new Agent/Ping]
$ns attach-agent $node_(24) $ping_a(524)
set ping_b(524) [new Agent/Ping]
$ns attach-agent $node_(1) $ping_b(524)
$ns connect $ping_a(524) $ping_b(524)	;#????Ping Agents
$ns at 1.0 "$ping_a(524) send"	;#??Ping???

#???525???(Ping)
set ping_a(525) [new Agent/Ping]
$ns attach-agent $node_(24) $ping_a(525)
set ping_b(525) [new Agent/Ping]
$ns attach-agent $node_(2) $ping_b(525)
$ns connect $ping_a(525) $ping_b(525)	;#????Ping Agents
$ns at 1.0 "$ping_a(525) send"	;#??Ping???

#???526???(Ping)
set ping_a(526) [new Agent/Ping]
$ns attach-agent $node_(24) $ping_a(526)
set ping_b(526) [new Agent/Ping]
$ns attach-agent $node_(3) $ping_b(526)
$ns connect $ping_a(526) $ping_b(526)	;#????Ping Agents
$ns at 1.0 "$ping_a(526) send"	;#??Ping???

#???527???(Ping)
set ping_a(527) [new Agent/Ping]
$ns attach-agent $node_(24) $ping_a(527)
set ping_b(527) [new Agent/Ping]
$ns attach-agent $node_(4) $ping_b(527)
$ns connect $ping_a(527) $ping_b(527)	;#????Ping Agents
$ns at 1.0 "$ping_a(527) send"	;#??Ping???

#???528???(Ping)
set ping_a(528) [new Agent/Ping]
$ns attach-agent $node_(24) $ping_a(528)
set ping_b(528) [new Agent/Ping]
$ns attach-agent $node_(5) $ping_b(528)
$ns connect $ping_a(528) $ping_b(528)	;#????Ping Agents
$ns at 1.0 "$ping_a(528) send"	;#??Ping???

#???529???(Ping)
set ping_a(529) [new Agent/Ping]
$ns attach-agent $node_(24) $ping_a(529)
set ping_b(529) [new Agent/Ping]
$ns attach-agent $node_(6) $ping_b(529)
$ns connect $ping_a(529) $ping_b(529)	;#????Ping Agents
$ns at 1.0 "$ping_a(529) send"	;#??Ping???

#???530???(Ping)
set ping_a(530) [new Agent/Ping]
$ns attach-agent $node_(24) $ping_a(530)
set ping_b(530) [new Agent/Ping]
$ns attach-agent $node_(7) $ping_b(530)
$ns connect $ping_a(530) $ping_b(530)	;#????Ping Agents
$ns at 1.0 "$ping_a(530) send"	;#??Ping???

#???531???(Ping)
set ping_a(531) [new Agent/Ping]
$ns attach-agent $node_(24) $ping_a(531)
set ping_b(531) [new Agent/Ping]
$ns attach-agent $node_(10) $ping_b(531)
$ns connect $ping_a(531) $ping_b(531)	;#????Ping Agents
$ns at 1.0 "$ping_a(531) send"	;#??Ping???

#???532???(Ping)
set ping_a(532) [new Agent/Ping]
$ns attach-agent $node_(24) $ping_a(532)
set ping_b(532) [new Agent/Ping]
$ns attach-agent $node_(11) $ping_b(532)
$ns connect $ping_a(532) $ping_b(532)	;#????Ping Agents
$ns at 1.0 "$ping_a(532) send"	;#??Ping???

#???533???(Ping)
set ping_a(533) [new Agent/Ping]
$ns attach-agent $node_(24) $ping_a(533)
set ping_b(533) [new Agent/Ping]
$ns attach-agent $node_(12) $ping_b(533)
$ns connect $ping_a(533) $ping_b(533)	;#????Ping Agents
$ns at 1.0 "$ping_a(533) send"	;#??Ping???

#???534???(Ping)
set ping_a(534) [new Agent/Ping]
$ns attach-agent $node_(24) $ping_a(534)
set ping_b(534) [new Agent/Ping]
$ns attach-agent $node_(13) $ping_b(534)
$ns connect $ping_a(534) $ping_b(534)	;#????Ping Agents
$ns at 1.0 "$ping_a(534) send"	;#??Ping???

#???535???(Ping)
set ping_a(535) [new Agent/Ping]
$ns attach-agent $node_(24) $ping_a(535)
set ping_b(535) [new Agent/Ping]
$ns attach-agent $node_(14) $ping_b(535)
$ns connect $ping_a(535) $ping_b(535)	;#????Ping Agents
$ns at 1.0 "$ping_a(535) send"	;#??Ping???

#???536???(Ping)
set ping_a(536) [new Agent/Ping]
$ns attach-agent $node_(24) $ping_a(536)
set ping_b(536) [new Agent/Ping]
$ns attach-agent $node_(15) $ping_b(536)
$ns connect $ping_a(536) $ping_b(536)	;#????Ping Agents
$ns at 1.0 "$ping_a(536) send"	;#??Ping???

#???537???(Ping)
set ping_a(537) [new Agent/Ping]
$ns attach-agent $node_(24) $ping_a(537)
set ping_b(537) [new Agent/Ping]
$ns attach-agent $node_(16) $ping_b(537)
$ns connect $ping_a(537) $ping_b(537)	;#????Ping Agents
$ns at 1.0 "$ping_a(537) send"	;#??Ping???

#???538???(Ping)
set ping_a(538) [new Agent/Ping]
$ns attach-agent $node_(24) $ping_a(538)
set ping_b(538) [new Agent/Ping]
$ns attach-agent $node_(19) $ping_b(538)
$ns connect $ping_a(538) $ping_b(538)	;#????Ping Agents
$ns at 1.0 "$ping_a(538) send"	;#??Ping???

#???539???(Ping)
set ping_a(539) [new Agent/Ping]
$ns attach-agent $node_(24) $ping_a(539)
set ping_b(539) [new Agent/Ping]
$ns attach-agent $node_(20) $ping_b(539)
$ns connect $ping_a(539) $ping_b(539)	;#????Ping Agents
$ns at 1.0 "$ping_a(539) send"	;#??Ping???

#???540???(Ping)
set ping_a(540) [new Agent/Ping]
$ns attach-agent $node_(24) $ping_a(540)
set ping_b(540) [new Agent/Ping]
$ns attach-agent $node_(21) $ping_b(540)
$ns connect $ping_a(540) $ping_b(540)	;#????Ping Agents
$ns at 1.0 "$ping_a(540) send"	;#??Ping???

#???541???(Ping)
set ping_a(541) [new Agent/Ping]
$ns attach-agent $node_(24) $ping_a(541)
set ping_b(541) [new Agent/Ping]
$ns attach-agent $node_(22) $ping_b(541)
$ns connect $ping_a(541) $ping_b(541)	;#????Ping Agents
$ns at 1.0 "$ping_a(541) send"	;#??Ping???

#???542???(Ping)
set ping_a(542) [new Agent/Ping]
$ns attach-agent $node_(24) $ping_a(542)
set ping_b(542) [new Agent/Ping]
$ns attach-agent $node_(23) $ping_b(542)
$ns connect $ping_a(542) $ping_b(542)	;#????Ping Agents
$ns at 1.0 "$ping_a(542) send"	;#??Ping???

#???543???(Ping)
set ping_a(543) [new Agent/Ping]
$ns attach-agent $node_(24) $ping_a(543)
set ping_b(543) [new Agent/Ping]
$ns attach-agent $node_(25) $ping_b(543)
$ns connect $ping_a(543) $ping_b(543)	;#????Ping Agents
$ns at 1.0 "$ping_a(543) send"	;#??Ping???

#???544???(Ping)
set ping_a(544) [new Agent/Ping]
$ns attach-agent $node_(24) $ping_a(544)
set ping_b(544) [new Agent/Ping]
$ns attach-agent $node_(26) $ping_b(544)
$ns connect $ping_a(544) $ping_b(544)	;#????Ping Agents
$ns at 1.0 "$ping_a(544) send"	;#??Ping???

#???545???(Ping)
set ping_a(545) [new Agent/Ping]
$ns attach-agent $node_(24) $ping_a(545)
set ping_b(545) [new Agent/Ping]
$ns attach-agent $node_(27) $ping_b(545)
$ns connect $ping_a(545) $ping_b(545)	;#????Ping Agents
$ns at 1.0 "$ping_a(545) send"	;#??Ping???

#???546???(Ping)
set ping_a(546) [new Agent/Ping]
$ns attach-agent $node_(25) $ping_a(546)
set ping_b(546) [new Agent/Ping]
$ns attach-agent $node_(0) $ping_b(546)
$ns connect $ping_a(546) $ping_b(546)	;#????Ping Agents
$ns at 1.0 "$ping_a(546) send"	;#??Ping???

#???547???(Ping)
set ping_a(547) [new Agent/Ping]
$ns attach-agent $node_(25) $ping_a(547)
set ping_b(547) [new Agent/Ping]
$ns attach-agent $node_(1) $ping_b(547)
$ns connect $ping_a(547) $ping_b(547)	;#????Ping Agents
$ns at 1.0 "$ping_a(547) send"	;#??Ping???

#???548???(Ping)
set ping_a(548) [new Agent/Ping]
$ns attach-agent $node_(25) $ping_a(548)
set ping_b(548) [new Agent/Ping]
$ns attach-agent $node_(2) $ping_b(548)
$ns connect $ping_a(548) $ping_b(548)	;#????Ping Agents
$ns at 1.0 "$ping_a(548) send"	;#??Ping???

#???549???(Ping)
set ping_a(549) [new Agent/Ping]
$ns attach-agent $node_(25) $ping_a(549)
set ping_b(549) [new Agent/Ping]
$ns attach-agent $node_(3) $ping_b(549)
$ns connect $ping_a(549) $ping_b(549)	;#????Ping Agents
$ns at 1.0 "$ping_a(549) send"	;#??Ping???

#???550???(Ping)
set ping_a(550) [new Agent/Ping]
$ns attach-agent $node_(25) $ping_a(550)
set ping_b(550) [new Agent/Ping]
$ns attach-agent $node_(4) $ping_b(550)
$ns connect $ping_a(550) $ping_b(550)	;#????Ping Agents
$ns at 1.0 "$ping_a(550) send"	;#??Ping???

#???551???(Ping)
set ping_a(551) [new Agent/Ping]
$ns attach-agent $node_(25) $ping_a(551)
set ping_b(551) [new Agent/Ping]
$ns attach-agent $node_(5) $ping_b(551)
$ns connect $ping_a(551) $ping_b(551)	;#????Ping Agents
$ns at 1.0 "$ping_a(551) send"	;#??Ping???

#???552???(Ping)
set ping_a(552) [new Agent/Ping]
$ns attach-agent $node_(25) $ping_a(552)
set ping_b(552) [new Agent/Ping]
$ns attach-agent $node_(6) $ping_b(552)
$ns connect $ping_a(552) $ping_b(552)	;#????Ping Agents
$ns at 1.0 "$ping_a(552) send"	;#??Ping???

#???553???(Ping)
set ping_a(553) [new Agent/Ping]
$ns attach-agent $node_(25) $ping_a(553)
set ping_b(553) [new Agent/Ping]
$ns attach-agent $node_(7) $ping_b(553)
$ns connect $ping_a(553) $ping_b(553)	;#????Ping Agents
$ns at 1.0 "$ping_a(553) send"	;#??Ping???

#???554???(Ping)
set ping_a(554) [new Agent/Ping]
$ns attach-agent $node_(25) $ping_a(554)
set ping_b(554) [new Agent/Ping]
$ns attach-agent $node_(10) $ping_b(554)
$ns connect $ping_a(554) $ping_b(554)	;#????Ping Agents
$ns at 1.0 "$ping_a(554) send"	;#??Ping???

#???555???(Ping)
set ping_a(555) [new Agent/Ping]
$ns attach-agent $node_(25) $ping_a(555)
set ping_b(555) [new Agent/Ping]
$ns attach-agent $node_(11) $ping_b(555)
$ns connect $ping_a(555) $ping_b(555)	;#????Ping Agents
$ns at 1.0 "$ping_a(555) send"	;#??Ping???

#???556???(Ping)
set ping_a(556) [new Agent/Ping]
$ns attach-agent $node_(25) $ping_a(556)
set ping_b(556) [new Agent/Ping]
$ns attach-agent $node_(12) $ping_b(556)
$ns connect $ping_a(556) $ping_b(556)	;#????Ping Agents
$ns at 1.0 "$ping_a(556) send"	;#??Ping???

#???557???(Ping)
set ping_a(557) [new Agent/Ping]
$ns attach-agent $node_(25) $ping_a(557)
set ping_b(557) [new Agent/Ping]
$ns attach-agent $node_(13) $ping_b(557)
$ns connect $ping_a(557) $ping_b(557)	;#????Ping Agents
$ns at 1.0 "$ping_a(557) send"	;#??Ping???

#???558???(Ping)
set ping_a(558) [new Agent/Ping]
$ns attach-agent $node_(25) $ping_a(558)
set ping_b(558) [new Agent/Ping]
$ns attach-agent $node_(14) $ping_b(558)
$ns connect $ping_a(558) $ping_b(558)	;#????Ping Agents
$ns at 1.0 "$ping_a(558) send"	;#??Ping???

#???559???(Ping)
set ping_a(559) [new Agent/Ping]
$ns attach-agent $node_(25) $ping_a(559)
set ping_b(559) [new Agent/Ping]
$ns attach-agent $node_(15) $ping_b(559)
$ns connect $ping_a(559) $ping_b(559)	;#????Ping Agents
$ns at 1.0 "$ping_a(559) send"	;#??Ping???

#???560???(Ping)
set ping_a(560) [new Agent/Ping]
$ns attach-agent $node_(25) $ping_a(560)
set ping_b(560) [new Agent/Ping]
$ns attach-agent $node_(16) $ping_b(560)
$ns connect $ping_a(560) $ping_b(560)	;#????Ping Agents
$ns at 1.0 "$ping_a(560) send"	;#??Ping???

#???561???(Ping)
set ping_a(561) [new Agent/Ping]
$ns attach-agent $node_(25) $ping_a(561)
set ping_b(561) [new Agent/Ping]
$ns attach-agent $node_(19) $ping_b(561)
$ns connect $ping_a(561) $ping_b(561)	;#????Ping Agents
$ns at 1.0 "$ping_a(561) send"	;#??Ping???

#???562???(Ping)
set ping_a(562) [new Agent/Ping]
$ns attach-agent $node_(25) $ping_a(562)
set ping_b(562) [new Agent/Ping]
$ns attach-agent $node_(20) $ping_b(562)
$ns connect $ping_a(562) $ping_b(562)	;#????Ping Agents
$ns at 1.0 "$ping_a(562) send"	;#??Ping???

#???563???(Ping)
set ping_a(563) [new Agent/Ping]
$ns attach-agent $node_(25) $ping_a(563)
set ping_b(563) [new Agent/Ping]
$ns attach-agent $node_(21) $ping_b(563)
$ns connect $ping_a(563) $ping_b(563)	;#????Ping Agents
$ns at 1.0 "$ping_a(563) send"	;#??Ping???

#???564???(Ping)
set ping_a(564) [new Agent/Ping]
$ns attach-agent $node_(25) $ping_a(564)
set ping_b(564) [new Agent/Ping]
$ns attach-agent $node_(22) $ping_b(564)
$ns connect $ping_a(564) $ping_b(564)	;#????Ping Agents
$ns at 1.0 "$ping_a(564) send"	;#??Ping???

#???565???(Ping)
set ping_a(565) [new Agent/Ping]
$ns attach-agent $node_(25) $ping_a(565)
set ping_b(565) [new Agent/Ping]
$ns attach-agent $node_(23) $ping_b(565)
$ns connect $ping_a(565) $ping_b(565)	;#????Ping Agents
$ns at 1.0 "$ping_a(565) send"	;#??Ping???

#???566???(Ping)
set ping_a(566) [new Agent/Ping]
$ns attach-agent $node_(25) $ping_a(566)
set ping_b(566) [new Agent/Ping]
$ns attach-agent $node_(24) $ping_b(566)
$ns connect $ping_a(566) $ping_b(566)	;#????Ping Agents
$ns at 1.0 "$ping_a(566) send"	;#??Ping???

#???567???(Ping)
set ping_a(567) [new Agent/Ping]
$ns attach-agent $node_(25) $ping_a(567)
set ping_b(567) [new Agent/Ping]
$ns attach-agent $node_(26) $ping_b(567)
$ns connect $ping_a(567) $ping_b(567)	;#????Ping Agents
$ns at 1.0 "$ping_a(567) send"	;#??Ping???

#???568???(Ping)
set ping_a(568) [new Agent/Ping]
$ns attach-agent $node_(25) $ping_a(568)
set ping_b(568) [new Agent/Ping]
$ns attach-agent $node_(27) $ping_b(568)
$ns connect $ping_a(568) $ping_b(568)	;#????Ping Agents
$ns at 1.0 "$ping_a(568) send"	;#??Ping???

#???569???(Ping)
set ping_a(569) [new Agent/Ping]
$ns attach-agent $node_(26) $ping_a(569)
set ping_b(569) [new Agent/Ping]
$ns attach-agent $node_(0) $ping_b(569)
$ns connect $ping_a(569) $ping_b(569)	;#????Ping Agents
$ns at 1.0 "$ping_a(569) send"	;#??Ping???

#???570???(Ping)
set ping_a(570) [new Agent/Ping]
$ns attach-agent $node_(26) $ping_a(570)
set ping_b(570) [new Agent/Ping]
$ns attach-agent $node_(1) $ping_b(570)
$ns connect $ping_a(570) $ping_b(570)	;#????Ping Agents
$ns at 1.0 "$ping_a(570) send"	;#??Ping???

#???571???(Ping)
set ping_a(571) [new Agent/Ping]
$ns attach-agent $node_(26) $ping_a(571)
set ping_b(571) [new Agent/Ping]
$ns attach-agent $node_(2) $ping_b(571)
$ns connect $ping_a(571) $ping_b(571)	;#????Ping Agents
$ns at 1.0 "$ping_a(571) send"	;#??Ping???

#???572???(Ping)
set ping_a(572) [new Agent/Ping]
$ns attach-agent $node_(26) $ping_a(572)
set ping_b(572) [new Agent/Ping]
$ns attach-agent $node_(3) $ping_b(572)
$ns connect $ping_a(572) $ping_b(572)	;#????Ping Agents
$ns at 1.0 "$ping_a(572) send"	;#??Ping???

#???573???(Ping)
set ping_a(573) [new Agent/Ping]
$ns attach-agent $node_(26) $ping_a(573)
set ping_b(573) [new Agent/Ping]
$ns attach-agent $node_(4) $ping_b(573)
$ns connect $ping_a(573) $ping_b(573)	;#????Ping Agents
$ns at 1.0 "$ping_a(573) send"	;#??Ping???

#???574???(Ping)
set ping_a(574) [new Agent/Ping]
$ns attach-agent $node_(26) $ping_a(574)
set ping_b(574) [new Agent/Ping]
$ns attach-agent $node_(5) $ping_b(574)
$ns connect $ping_a(574) $ping_b(574)	;#????Ping Agents
$ns at 1.0 "$ping_a(574) send"	;#??Ping???

#???575???(Ping)
set ping_a(575) [new Agent/Ping]
$ns attach-agent $node_(26) $ping_a(575)
set ping_b(575) [new Agent/Ping]
$ns attach-agent $node_(6) $ping_b(575)
$ns connect $ping_a(575) $ping_b(575)	;#????Ping Agents
$ns at 1.0 "$ping_a(575) send"	;#??Ping???

#???576???(Ping)
set ping_a(576) [new Agent/Ping]
$ns attach-agent $node_(26) $ping_a(576)
set ping_b(576) [new Agent/Ping]
$ns attach-agent $node_(7) $ping_b(576)
$ns connect $ping_a(576) $ping_b(576)	;#????Ping Agents
$ns at 1.0 "$ping_a(576) send"	;#??Ping???

#???577???(Ping)
set ping_a(577) [new Agent/Ping]
$ns attach-agent $node_(26) $ping_a(577)
set ping_b(577) [new Agent/Ping]
$ns attach-agent $node_(10) $ping_b(577)
$ns connect $ping_a(577) $ping_b(577)	;#????Ping Agents
$ns at 1.0 "$ping_a(577) send"	;#??Ping???

#???578???(Ping)
set ping_a(578) [new Agent/Ping]
$ns attach-agent $node_(26) $ping_a(578)
set ping_b(578) [new Agent/Ping]
$ns attach-agent $node_(11) $ping_b(578)
$ns connect $ping_a(578) $ping_b(578)	;#????Ping Agents
$ns at 1.0 "$ping_a(578) send"	;#??Ping???

#???579???(Ping)
set ping_a(579) [new Agent/Ping]
$ns attach-agent $node_(26) $ping_a(579)
set ping_b(579) [new Agent/Ping]
$ns attach-agent $node_(12) $ping_b(579)
$ns connect $ping_a(579) $ping_b(579)	;#????Ping Agents
$ns at 1.0 "$ping_a(579) send"	;#??Ping???

#???580???(Ping)
set ping_a(580) [new Agent/Ping]
$ns attach-agent $node_(26) $ping_a(580)
set ping_b(580) [new Agent/Ping]
$ns attach-agent $node_(13) $ping_b(580)
$ns connect $ping_a(580) $ping_b(580)	;#????Ping Agents
$ns at 1.0 "$ping_a(580) send"	;#??Ping???

#???581???(Ping)
set ping_a(581) [new Agent/Ping]
$ns attach-agent $node_(26) $ping_a(581)
set ping_b(581) [new Agent/Ping]
$ns attach-agent $node_(14) $ping_b(581)
$ns connect $ping_a(581) $ping_b(581)	;#????Ping Agents
$ns at 1.0 "$ping_a(581) send"	;#??Ping???

#???582???(Ping)
set ping_a(582) [new Agent/Ping]
$ns attach-agent $node_(26) $ping_a(582)
set ping_b(582) [new Agent/Ping]
$ns attach-agent $node_(15) $ping_b(582)
$ns connect $ping_a(582) $ping_b(582)	;#????Ping Agents
$ns at 1.0 "$ping_a(582) send"	;#??Ping???

#???583???(Ping)
set ping_a(583) [new Agent/Ping]
$ns attach-agent $node_(26) $ping_a(583)
set ping_b(583) [new Agent/Ping]
$ns attach-agent $node_(16) $ping_b(583)
$ns connect $ping_a(583) $ping_b(583)	;#????Ping Agents
$ns at 1.0 "$ping_a(583) send"	;#??Ping???

#???584???(Ping)
set ping_a(584) [new Agent/Ping]
$ns attach-agent $node_(26) $ping_a(584)
set ping_b(584) [new Agent/Ping]
$ns attach-agent $node_(19) $ping_b(584)
$ns connect $ping_a(584) $ping_b(584)	;#????Ping Agents
$ns at 1.0 "$ping_a(584) send"	;#??Ping???

#???585???(Ping)
set ping_a(585) [new Agent/Ping]
$ns attach-agent $node_(26) $ping_a(585)
set ping_b(585) [new Agent/Ping]
$ns attach-agent $node_(20) $ping_b(585)
$ns connect $ping_a(585) $ping_b(585)	;#????Ping Agents
$ns at 1.0 "$ping_a(585) send"	;#??Ping???

#???586???(Ping)
set ping_a(586) [new Agent/Ping]
$ns attach-agent $node_(26) $ping_a(586)
set ping_b(586) [new Agent/Ping]
$ns attach-agent $node_(21) $ping_b(586)
$ns connect $ping_a(586) $ping_b(586)	;#????Ping Agents
$ns at 1.0 "$ping_a(586) send"	;#??Ping???

#???587???(Ping)
set ping_a(587) [new Agent/Ping]
$ns attach-agent $node_(26) $ping_a(587)
set ping_b(587) [new Agent/Ping]
$ns attach-agent $node_(22) $ping_b(587)
$ns connect $ping_a(587) $ping_b(587)	;#????Ping Agents
$ns at 1.0 "$ping_a(587) send"	;#??Ping???

#???588???(Ping)
set ping_a(588) [new Agent/Ping]
$ns attach-agent $node_(26) $ping_a(588)
set ping_b(588) [new Agent/Ping]
$ns attach-agent $node_(23) $ping_b(588)
$ns connect $ping_a(588) $ping_b(588)	;#????Ping Agents
$ns at 1.0 "$ping_a(588) send"	;#??Ping???

#???589???(Ping)
set ping_a(589) [new Agent/Ping]
$ns attach-agent $node_(26) $ping_a(589)
set ping_b(589) [new Agent/Ping]
$ns attach-agent $node_(24) $ping_b(589)
$ns connect $ping_a(589) $ping_b(589)	;#????Ping Agents
$ns at 1.0 "$ping_a(589) send"	;#??Ping???

#???590???(Ping)
set ping_a(590) [new Agent/Ping]
$ns attach-agent $node_(26) $ping_a(590)
set ping_b(590) [new Agent/Ping]
$ns attach-agent $node_(25) $ping_b(590)
$ns connect $ping_a(590) $ping_b(590)	;#????Ping Agents
$ns at 1.0 "$ping_a(590) send"	;#??Ping???

#???591???(Ping)
set ping_a(591) [new Agent/Ping]
$ns attach-agent $node_(26) $ping_a(591)
set ping_b(591) [new Agent/Ping]
$ns attach-agent $node_(27) $ping_b(591)
$ns connect $ping_a(591) $ping_b(591)	;#????Ping Agents
$ns at 1.0 "$ping_a(591) send"	;#??Ping???

#???592???(Ping)
set ping_a(592) [new Agent/Ping]
$ns attach-agent $node_(27) $ping_a(592)
set ping_b(592) [new Agent/Ping]
$ns attach-agent $node_(0) $ping_b(592)
$ns connect $ping_a(592) $ping_b(592)	;#????Ping Agents
$ns at 1.0 "$ping_a(592) send"	;#??Ping???

#???593???(Ping)
set ping_a(593) [new Agent/Ping]
$ns attach-agent $node_(27) $ping_a(593)
set ping_b(593) [new Agent/Ping]
$ns attach-agent $node_(1) $ping_b(593)
$ns connect $ping_a(593) $ping_b(593)	;#????Ping Agents
$ns at 1.0 "$ping_a(593) send"	;#??Ping???

#???594???(Ping)
set ping_a(594) [new Agent/Ping]
$ns attach-agent $node_(27) $ping_a(594)
set ping_b(594) [new Agent/Ping]
$ns attach-agent $node_(2) $ping_b(594)
$ns connect $ping_a(594) $ping_b(594)	;#????Ping Agents
$ns at 1.0 "$ping_a(594) send"	;#??Ping???

#???595???(Ping)
set ping_a(595) [new Agent/Ping]
$ns attach-agent $node_(27) $ping_a(595)
set ping_b(595) [new Agent/Ping]
$ns attach-agent $node_(3) $ping_b(595)
$ns connect $ping_a(595) $ping_b(595)	;#????Ping Agents
$ns at 1.0 "$ping_a(595) send"	;#??Ping???

#???596???(Ping)
set ping_a(596) [new Agent/Ping]
$ns attach-agent $node_(27) $ping_a(596)
set ping_b(596) [new Agent/Ping]
$ns attach-agent $node_(4) $ping_b(596)
$ns connect $ping_a(596) $ping_b(596)	;#????Ping Agents
$ns at 1.0 "$ping_a(596) send"	;#??Ping???

#???597???(Ping)
set ping_a(597) [new Agent/Ping]
$ns attach-agent $node_(27) $ping_a(597)
set ping_b(597) [new Agent/Ping]
$ns attach-agent $node_(5) $ping_b(597)
$ns connect $ping_a(597) $ping_b(597)	;#????Ping Agents
$ns at 1.0 "$ping_a(597) send"	;#??Ping???

#???598???(Ping)
set ping_a(598) [new Agent/Ping]
$ns attach-agent $node_(27) $ping_a(598)
set ping_b(598) [new Agent/Ping]
$ns attach-agent $node_(6) $ping_b(598)
$ns connect $ping_a(598) $ping_b(598)	;#????Ping Agents
$ns at 1.0 "$ping_a(598) send"	;#??Ping???

#???599???(Ping)
set ping_a(599) [new Agent/Ping]
$ns attach-agent $node_(27) $ping_a(599)
set ping_b(599) [new Agent/Ping]
$ns attach-agent $node_(7) $ping_b(599)
$ns connect $ping_a(599) $ping_b(599)	;#????Ping Agents
$ns at 1.0 "$ping_a(599) send"	;#??Ping???

#???600???(Ping)
set ping_a(600) [new Agent/Ping]
$ns attach-agent $node_(27) $ping_a(600)
set ping_b(600) [new Agent/Ping]
$ns attach-agent $node_(10) $ping_b(600)
$ns connect $ping_a(600) $ping_b(600)	;#????Ping Agents
$ns at 1.0 "$ping_a(600) send"	;#??Ping???

#???601???(Ping)
set ping_a(601) [new Agent/Ping]
$ns attach-agent $node_(27) $ping_a(601)
set ping_b(601) [new Agent/Ping]
$ns attach-agent $node_(11) $ping_b(601)
$ns connect $ping_a(601) $ping_b(601)	;#????Ping Agents
$ns at 1.0 "$ping_a(601) send"	;#??Ping???

#???602???(Ping)
set ping_a(602) [new Agent/Ping]
$ns attach-agent $node_(27) $ping_a(602)
set ping_b(602) [new Agent/Ping]
$ns attach-agent $node_(12) $ping_b(602)
$ns connect $ping_a(602) $ping_b(602)	;#????Ping Agents
$ns at 1.0 "$ping_a(602) send"	;#??Ping???

#???603???(Ping)
set ping_a(603) [new Agent/Ping]
$ns attach-agent $node_(27) $ping_a(603)
set ping_b(603) [new Agent/Ping]
$ns attach-agent $node_(13) $ping_b(603)
$ns connect $ping_a(603) $ping_b(603)	;#????Ping Agents
$ns at 1.0 "$ping_a(603) send"	;#??Ping???

#???604???(Ping)
set ping_a(604) [new Agent/Ping]
$ns attach-agent $node_(27) $ping_a(604)
set ping_b(604) [new Agent/Ping]
$ns attach-agent $node_(14) $ping_b(604)
$ns connect $ping_a(604) $ping_b(604)	;#????Ping Agents
$ns at 1.0 "$ping_a(604) send"	;#??Ping???

#???605???(Ping)
set ping_a(605) [new Agent/Ping]
$ns attach-agent $node_(27) $ping_a(605)
set ping_b(605) [new Agent/Ping]
$ns attach-agent $node_(15) $ping_b(605)
$ns connect $ping_a(605) $ping_b(605)	;#????Ping Agents
$ns at 1.0 "$ping_a(605) send"	;#??Ping???

#???606???(Ping)
set ping_a(606) [new Agent/Ping]
$ns attach-agent $node_(27) $ping_a(606)
set ping_b(606) [new Agent/Ping]
$ns attach-agent $node_(16) $ping_b(606)
$ns connect $ping_a(606) $ping_b(606)	;#????Ping Agents
$ns at 1.0 "$ping_a(606) send"	;#??Ping???

#???607???(Ping)
set ping_a(607) [new Agent/Ping]
$ns attach-agent $node_(27) $ping_a(607)
set ping_b(607) [new Agent/Ping]
$ns attach-agent $node_(19) $ping_b(607)
$ns connect $ping_a(607) $ping_b(607)	;#????Ping Agents
$ns at 1.0 "$ping_a(607) send"	;#??Ping???

#???608???(Ping)
set ping_a(608) [new Agent/Ping]
$ns attach-agent $node_(27) $ping_a(608)
set ping_b(608) [new Agent/Ping]
$ns attach-agent $node_(20) $ping_b(608)
$ns connect $ping_a(608) $ping_b(608)	;#????Ping Agents
$ns at 1.0 "$ping_a(608) send"	;#??Ping???

#???609???(Ping)
set ping_a(609) [new Agent/Ping]
$ns attach-agent $node_(27) $ping_a(609)
set ping_b(609) [new Agent/Ping]
$ns attach-agent $node_(21) $ping_b(609)
$ns connect $ping_a(609) $ping_b(609)	;#????Ping Agents
$ns at 1.0 "$ping_a(609) send"	;#??Ping???

#???610???(Ping)
set ping_a(610) [new Agent/Ping]
$ns attach-agent $node_(27) $ping_a(610)
set ping_b(610) [new Agent/Ping]
$ns attach-agent $node_(22) $ping_b(610)
$ns connect $ping_a(610) $ping_b(610)	;#????Ping Agents
$ns at 1.0 "$ping_a(610) send"	;#??Ping???

#???611???(Ping)
set ping_a(611) [new Agent/Ping]
$ns attach-agent $node_(27) $ping_a(611)
set ping_b(611) [new Agent/Ping]
$ns attach-agent $node_(23) $ping_b(611)
$ns connect $ping_a(611) $ping_b(611)	;#????Ping Agents
$ns at 1.0 "$ping_a(611) send"	;#??Ping???

#???612???(Ping)
set ping_a(612) [new Agent/Ping]
$ns attach-agent $node_(27) $ping_a(612)
set ping_b(612) [new Agent/Ping]
$ns attach-agent $node_(24) $ping_b(612)
$ns connect $ping_a(612) $ping_b(612)	;#????Ping Agents
$ns at 1.0 "$ping_a(612) send"	;#??Ping???

#???613???(Ping)
set ping_a(613) [new Agent/Ping]
$ns attach-agent $node_(27) $ping_a(613)
set ping_b(613) [new Agent/Ping]
$ns attach-agent $node_(25) $ping_b(613)
$ns connect $ping_a(613) $ping_b(613)	;#????Ping Agents
$ns at 1.0 "$ping_a(613) send"	;#??Ping???

#???614???(Ping)
set ping_a(614) [new Agent/Ping]
$ns attach-agent $node_(27) $ping_a(614)
set ping_b(614) [new Agent/Ping]
$ns attach-agent $node_(26) $ping_b(614)
$ns connect $ping_a(614) $ping_b(614)	;#????Ping Agents
$ns at 1.0 "$ping_a(614) send"	;#??Ping???

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
