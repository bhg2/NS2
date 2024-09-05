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
set val(nn)     41        ;# number of mobilenodes
set val(rp)     AODV     ;# routing protocol
set val(x)      1000            ;# X dimension of topography
set val(y)      1000           ;# Y dimension of topography
set val(stop)   10.0 ;# time of simulation end

#===================================
#               ??????                         
#===================================

#??trace file
set ns            [new Simulator]	;#??ns simulator
set tracefd       [open mac_802_11_node_41_ftp_37_cbr_37_ping_38.tr w]	;#??trace file
set namtrace       [open mac_802_11_node_41_ftp_37_cbr_37_ping_38.nam w]	;#????nam trace file

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
$node_(0) set X_ 102
$node_(0) set Y_ 1056
$node_(0) set Z_ 0.0
$ns initial_node_pos $node_(0) 20

#???1?Node
set node_(1) [$ns node]
$node_(1) set X_ 296
$node_(1) set Y_ 1062
$node_(1) set Z_ 0.0
$ns initial_node_pos $node_(1) 20

#???2?Node
set node_(2) [$ns node]
$node_(2) set X_ 484
$node_(2) set Y_ 1072
$node_(2) set Z_ 0.0
$ns initial_node_pos $node_(2) 20

#???3?Node
set node_(3) [$ns node]
$node_(3) set X_ 654
$node_(3) set Y_ 1080
$node_(3) set Z_ 0.0
$ns initial_node_pos $node_(3) 20

#???4?Node
set node_(4) [$ns node]
$node_(4) set X_ 856
$node_(4) set Y_ 1070
$node_(4) set Z_ 0.0
$ns initial_node_pos $node_(4) 20

#???5?Node
set node_(5) [$ns node]
$node_(5) set X_ 998
$node_(5) set Y_ 1060
$node_(5) set Z_ 0.0
$ns initial_node_pos $node_(5) 20

#???6?Node
set node_(6) [$ns node]
$node_(6) set X_ 1128
$node_(6) set Y_ 1060
$node_(6) set Z_ 0.0
$ns initial_node_pos $node_(6) 20

#???7?Node
set node_(7) [$ns node]
$node_(7) set X_ 1252
$node_(7) set Y_ 1060
$node_(7) set Z_ 0.0
$ns initial_node_pos $node_(7) 20

#???8?Node
set node_(8) [$ns node]
$node_(8) set X_ 1416
$node_(8) set Y_ 1060
$node_(8) set Z_ 0.0
$ns initial_node_pos $node_(8) 20

#???9?Node
set node_(9) [$ns node]
$node_(9) set X_ 1574
$node_(9) set Y_ 1066
$node_(9) set Z_ 0.0
$ns initial_node_pos $node_(9) 20

#???10?Node
set node_(10) [$ns node]
$node_(10) set X_ 1746
$node_(10) set Y_ 1060
$node_(10) set Z_ 0.0
$ns initial_node_pos $node_(10) 20

#???11?Node
set node_(11) [$ns node]
$node_(11) set X_ 1956
$node_(11) set Y_ 1040
$node_(11) set Z_ 0.0
$ns initial_node_pos $node_(11) 20

#???12?Node
set node_(12) [$ns node]
$node_(12) set X_ 124
$node_(12) set Y_ 784
$node_(12) set Z_ 0.0
$ns initial_node_pos $node_(12) 20

#???13?Node
set node_(13) [$ns node]
$node_(13) set X_ 306
$node_(13) set Y_ 788
$node_(13) set Z_ 0.0
$ns initial_node_pos $node_(13) 20

#???14?Node
set node_(14) [$ns node]
$node_(14) set X_ 516
$node_(14) set Y_ 782
$node_(14) set Z_ 0.0
$ns initial_node_pos $node_(14) 20

#???15?Node
set node_(15) [$ns node]
$node_(15) set X_ 662
$node_(15) set Y_ 776
$node_(15) set Z_ 0.0
$ns initial_node_pos $node_(15) 20

#???16?Node
set node_(16) [$ns node]
$node_(16) set X_ 796
$node_(16) set Y_ 780
$node_(16) set Z_ 0.0
$ns initial_node_pos $node_(16) 20

#???17?Node
set node_(17) [$ns node]
$node_(17) set X_ 900
$node_(17) set Y_ 776
$node_(17) set Z_ 0.0
$ns initial_node_pos $node_(17) 20

#???18?Node
set node_(18) [$ns node]
$node_(18) set X_ 1070
$node_(18) set Y_ 776
$node_(18) set Z_ 0.0
$ns initial_node_pos $node_(18) 20

#???19?Node
set node_(19) [$ns node]
$node_(19) set X_ 1234
$node_(19) set Y_ 782
$node_(19) set Z_ 0.0
$ns initial_node_pos $node_(19) 20

#???20?Node
set node_(20) [$ns node]
$node_(20) set X_ 1402
$node_(20) set Y_ 782
$node_(20) set Z_ 0.0
$ns initial_node_pos $node_(20) 20

#???21?Node
set node_(21) [$ns node]
$node_(21) set X_ 1596
$node_(21) set Y_ 780
$node_(21) set Z_ 0.0
$ns initial_node_pos $node_(21) 20

#???22?Node
set node_(22) [$ns node]
$node_(22) set X_ 1798
$node_(22) set Y_ 780
$node_(22) set Z_ 0.0
$ns initial_node_pos $node_(22) 20

#???23?Node
set node_(23) [$ns node]
$node_(23) set X_ 1972
$node_(23) set Y_ 784
$node_(23) set Z_ 0.0
$ns initial_node_pos $node_(23) 20

#???24?Node
set node_(24) [$ns node]
$node_(24) set X_ 124
$node_(24) set Y_ 420
$node_(24) set Z_ 0.0
$ns initial_node_pos $node_(24) 20

#???25?Node
set node_(25) [$ns node]
$node_(25) set X_ 320
$node_(25) set Y_ 420
$node_(25) set Z_ 0.0
$ns initial_node_pos $node_(25) 20

#???26?Node
set node_(26) [$ns node]
$node_(26) set X_ 496
$node_(26) set Y_ 422
$node_(26) set Z_ 0.0
$ns initial_node_pos $node_(26) 20

#???27?Node
set node_(27) [$ns node]
$node_(27) set X_ 652
$node_(27) set Y_ 422
$node_(27) set Z_ 0.0
$ns initial_node_pos $node_(27) 20

#???28?Node
set node_(28) [$ns node]
$node_(28) set X_ 818
$node_(28) set Y_ 422
$node_(28) set Z_ 0.0
$ns initial_node_pos $node_(28) 20

#???29?Node
set node_(29) [$ns node]
$node_(29) set X_ 934
$node_(29) set Y_ 426
$node_(29) set Z_ 0.0
$ns initial_node_pos $node_(29) 20

#???30?Node
set node_(30) [$ns node]
$node_(30) set X_ 1082
$node_(30) set Y_ 424
$node_(30) set Z_ 0.0
$ns initial_node_pos $node_(30) 20

#???31?Node
set node_(31) [$ns node]
$node_(31) set X_ 1252
$node_(31) set Y_ 424
$node_(31) set Z_ 0.0
$ns initial_node_pos $node_(31) 20

#???32?Node
set node_(32) [$ns node]
$node_(32) set X_ 1412
$node_(32) set Y_ 432
$node_(32) set Z_ 0.0
$ns initial_node_pos $node_(32) 20

#???33?Node
set node_(33) [$ns node]
$node_(33) set X_ 1588
$node_(33) set Y_ 430
$node_(33) set Z_ 0.0
$ns initial_node_pos $node_(33) 20

#???34?Node
set node_(34) [$ns node]
$node_(34) set X_ 1722
$node_(34) set Y_ 432
$node_(34) set Z_ 0.0
$ns initial_node_pos $node_(34) 20

#???35?Node
set node_(35) [$ns node]
$node_(35) set X_ 1900
$node_(35) set Y_ 434
$node_(35) set Z_ 0.0
$ns initial_node_pos $node_(35) 20

#???36?Node
set node_(36) [$ns node]
$node_(36) set X_ 1982
$node_(36) set Y_ 434
$node_(36) set Z_ 0.0
$ns initial_node_pos $node_(36) 20

#???37?Node
set node_(37) [$ns node]
$node_(37) set X_ 114
$node_(37) set Y_ 130
$node_(37) set Z_ 0.0
$ns initial_node_pos $node_(37) 20

#???38?Node
set node_(38) [$ns node]
$node_(38) set X_ 296
$node_(38) set Y_ 140
$node_(38) set Z_ 0.0
$ns initial_node_pos $node_(38) 20

#???39?Node
set node_(39) [$ns node]
$node_(39) set X_ 460
$node_(39) set Y_ 140
$node_(39) set Z_ 0.0
$ns initial_node_pos $node_(39) 20

#???40?Node
set node_(40) [$ns node]
$node_(40) set X_ 658
$node_(40) set Y_ 140
$node_(40) set Z_ 0.0
$ns initial_node_pos $node_(40) 20

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
$ns attach-agent $node_(2) $tcp2
$ns attach-agent $node_(3) $sink2
$ns connect $tcp2 $sink2
set ftp2 [new Application/FTP]
$ftp2 attach-agent $tcp2
$ns at 1.0 "$ftp2 start"
$ns at 2.0 "$ftp2 stop"

#???3???(FTP-TCP)
set tcp3 [new Agent/TCP/Newreno]
$tcp3 set class_ 2
set sink3 [new Agent/TCPSink]
$ns attach-agent $node_(3) $tcp3
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
$ns attach-agent $node_(11) $sink10
$ns connect $tcp10 $sink10
set ftp10 [new Application/FTP]
$ftp10 attach-agent $tcp10
$ns at 1.0 "$ftp10 start"
$ns at 2.0 "$ftp10 stop"

#???11???(FTP-TCP)
set tcp11 [new Agent/TCP/Newreno]
$tcp11 set class_ 2
set sink11 [new Agent/TCPSink]
$ns attach-agent $node_(12) $tcp11
$ns attach-agent $node_(13) $sink11
$ns connect $tcp11 $sink11
set ftp11 [new Application/FTP]
$ftp11 attach-agent $tcp11
$ns at 1.0 "$ftp11 start"
$ns at 2.0 "$ftp11 stop"

#???12???(FTP-TCP)
set tcp12 [new Agent/TCP/Newreno]
$tcp12 set class_ 2
set sink12 [new Agent/TCPSink]
$ns attach-agent $node_(13) $tcp12
$ns attach-agent $node_(14) $sink12
$ns connect $tcp12 $sink12
set ftp12 [new Application/FTP]
$ftp12 attach-agent $tcp12
$ns at 1.0 "$ftp12 start"
$ns at 2.0 "$ftp12 stop"

#???13???(FTP-TCP)
set tcp13 [new Agent/TCP/Newreno]
$tcp13 set class_ 2
set sink13 [new Agent/TCPSink]
$ns attach-agent $node_(14) $tcp13
$ns attach-agent $node_(15) $sink13
$ns connect $tcp13 $sink13
set ftp13 [new Application/FTP]
$ftp13 attach-agent $tcp13
$ns at 1.0 "$ftp13 start"
$ns at 2.0 "$ftp13 stop"

#???14???(FTP-TCP)
set tcp14 [new Agent/TCP/Newreno]
$tcp14 set class_ 2
set sink14 [new Agent/TCPSink]
$ns attach-agent $node_(15) $tcp14
$ns attach-agent $node_(16) $sink14
$ns connect $tcp14 $sink14
set ftp14 [new Application/FTP]
$ftp14 attach-agent $tcp14
$ns at 1.0 "$ftp14 start"
$ns at 2.0 "$ftp14 stop"

#???15???(FTP-TCP)
set tcp15 [new Agent/TCP/Newreno]
$tcp15 set class_ 2
set sink15 [new Agent/TCPSink]
$ns attach-agent $node_(16) $tcp15
$ns attach-agent $node_(17) $sink15
$ns connect $tcp15 $sink15
set ftp15 [new Application/FTP]
$ftp15 attach-agent $tcp15
$ns at 1.0 "$ftp15 start"
$ns at 2.0 "$ftp15 stop"

#???16???(FTP-TCP)
set tcp16 [new Agent/TCP/Newreno]
$tcp16 set class_ 2
set sink16 [new Agent/TCPSink]
$ns attach-agent $node_(17) $tcp16
$ns attach-agent $node_(18) $sink16
$ns connect $tcp16 $sink16
set ftp16 [new Application/FTP]
$ftp16 attach-agent $tcp16
$ns at 1.0 "$ftp16 start"
$ns at 2.0 "$ftp16 stop"

#???17???(FTP-TCP)
set tcp17 [new Agent/TCP/Newreno]
$tcp17 set class_ 2
set sink17 [new Agent/TCPSink]
$ns attach-agent $node_(18) $tcp17
$ns attach-agent $node_(19) $sink17
$ns connect $tcp17 $sink17
set ftp17 [new Application/FTP]
$ftp17 attach-agent $tcp17
$ns at 1.0 "$ftp17 start"
$ns at 2.0 "$ftp17 stop"

#???18???(FTP-TCP)
set tcp18 [new Agent/TCP/Newreno]
$tcp18 set class_ 2
set sink18 [new Agent/TCPSink]
$ns attach-agent $node_(19) $tcp18
$ns attach-agent $node_(20) $sink18
$ns connect $tcp18 $sink18
set ftp18 [new Application/FTP]
$ftp18 attach-agent $tcp18
$ns at 1.0 "$ftp18 start"
$ns at 2.0 "$ftp18 stop"

#???19???(FTP-TCP)
set tcp19 [new Agent/TCP/Newreno]
$tcp19 set class_ 2
set sink19 [new Agent/TCPSink]
$ns attach-agent $node_(20) $tcp19
$ns attach-agent $node_(21) $sink19
$ns connect $tcp19 $sink19
set ftp19 [new Application/FTP]
$ftp19 attach-agent $tcp19
$ns at 1.0 "$ftp19 start"
$ns at 2.0 "$ftp19 stop"

#???20???(FTP-TCP)
set tcp20 [new Agent/TCP/Newreno]
$tcp20 set class_ 2
set sink20 [new Agent/TCPSink]
$ns attach-agent $node_(21) $tcp20
$ns attach-agent $node_(22) $sink20
$ns connect $tcp20 $sink20
set ftp20 [new Application/FTP]
$ftp20 attach-agent $tcp20
$ns at 1.0 "$ftp20 start"
$ns at 2.0 "$ftp20 stop"

#???21???(FTP-TCP)
set tcp21 [new Agent/TCP/Newreno]
$tcp21 set class_ 2
set sink21 [new Agent/TCPSink]
$ns attach-agent $node_(22) $tcp21
$ns attach-agent $node_(23) $sink21
$ns connect $tcp21 $sink21
set ftp21 [new Application/FTP]
$ftp21 attach-agent $tcp21
$ns at 1.0 "$ftp21 start"
$ns at 2.0 "$ftp21 stop"

#???22???(FTP-TCP)
set tcp22 [new Agent/TCP/Newreno]
$tcp22 set class_ 2
set sink22 [new Agent/TCPSink]
$ns attach-agent $node_(24) $tcp22
$ns attach-agent $node_(25) $sink22
$ns connect $tcp22 $sink22
set ftp22 [new Application/FTP]
$ftp22 attach-agent $tcp22
$ns at 1.0 "$ftp22 start"
$ns at 2.0 "$ftp22 stop"

#???23???(FTP-TCP)
set tcp23 [new Agent/TCP/Newreno]
$tcp23 set class_ 2
set sink23 [new Agent/TCPSink]
$ns attach-agent $node_(25) $tcp23
$ns attach-agent $node_(26) $sink23
$ns connect $tcp23 $sink23
set ftp23 [new Application/FTP]
$ftp23 attach-agent $tcp23
$ns at 1.0 "$ftp23 start"
$ns at 2.0 "$ftp23 stop"

#???24???(FTP-TCP)
set tcp24 [new Agent/TCP/Newreno]
$tcp24 set class_ 2
set sink24 [new Agent/TCPSink]
$ns attach-agent $node_(26) $tcp24
$ns attach-agent $node_(27) $sink24
$ns connect $tcp24 $sink24
set ftp24 [new Application/FTP]
$ftp24 attach-agent $tcp24
$ns at 1.0 "$ftp24 start"
$ns at 2.0 "$ftp24 stop"

#???25???(FTP-TCP)
set tcp25 [new Agent/TCP/Newreno]
$tcp25 set class_ 2
set sink25 [new Agent/TCPSink]
$ns attach-agent $node_(27) $tcp25
$ns attach-agent $node_(28) $sink25
$ns connect $tcp25 $sink25
set ftp25 [new Application/FTP]
$ftp25 attach-agent $tcp25
$ns at 1.0 "$ftp25 start"
$ns at 2.0 "$ftp25 stop"

#???26???(FTP-TCP)
set tcp26 [new Agent/TCP/Newreno]
$tcp26 set class_ 2
set sink26 [new Agent/TCPSink]
$ns attach-agent $node_(28) $tcp26
$ns attach-agent $node_(29) $sink26
$ns connect $tcp26 $sink26
set ftp26 [new Application/FTP]
$ftp26 attach-agent $tcp26
$ns at 1.0 "$ftp26 start"
$ns at 2.0 "$ftp26 stop"

#???27???(FTP-TCP)
set tcp27 [new Agent/TCP/Newreno]
$tcp27 set class_ 2
set sink27 [new Agent/TCPSink]
$ns attach-agent $node_(29) $tcp27
$ns attach-agent $node_(30) $sink27
$ns connect $tcp27 $sink27
set ftp27 [new Application/FTP]
$ftp27 attach-agent $tcp27
$ns at 1.0 "$ftp27 start"
$ns at 2.0 "$ftp27 stop"

#???28???(FTP-TCP)
set tcp28 [new Agent/TCP/Newreno]
$tcp28 set class_ 2
set sink28 [new Agent/TCPSink]
$ns attach-agent $node_(30) $tcp28
$ns attach-agent $node_(31) $sink28
$ns connect $tcp28 $sink28
set ftp28 [new Application/FTP]
$ftp28 attach-agent $tcp28
$ns at 1.0 "$ftp28 start"
$ns at 2.0 "$ftp28 stop"

#???29???(FTP-TCP)
set tcp29 [new Agent/TCP/Newreno]
$tcp29 set class_ 2
set sink29 [new Agent/TCPSink]
$ns attach-agent $node_(31) $tcp29
$ns attach-agent $node_(32) $sink29
$ns connect $tcp29 $sink29
set ftp29 [new Application/FTP]
$ftp29 attach-agent $tcp29
$ns at 1.0 "$ftp29 start"
$ns at 2.0 "$ftp29 stop"

#???30???(FTP-TCP)
set tcp30 [new Agent/TCP/Newreno]
$tcp30 set class_ 2
set sink30 [new Agent/TCPSink]
$ns attach-agent $node_(32) $tcp30
$ns attach-agent $node_(33) $sink30
$ns connect $tcp30 $sink30
set ftp30 [new Application/FTP]
$ftp30 attach-agent $tcp30
$ns at 1.0 "$ftp30 start"
$ns at 2.0 "$ftp30 stop"

#???31???(FTP-TCP)
set tcp31 [new Agent/TCP/Newreno]
$tcp31 set class_ 2
set sink31 [new Agent/TCPSink]
$ns attach-agent $node_(33) $tcp31
$ns attach-agent $node_(34) $sink31
$ns connect $tcp31 $sink31
set ftp31 [new Application/FTP]
$ftp31 attach-agent $tcp31
$ns at 1.0 "$ftp31 start"
$ns at 2.0 "$ftp31 stop"

#???32???(FTP-TCP)
set tcp32 [new Agent/TCP/Newreno]
$tcp32 set class_ 2
set sink32 [new Agent/TCPSink]
$ns attach-agent $node_(34) $tcp32
$ns attach-agent $node_(35) $sink32
$ns connect $tcp32 $sink32
set ftp32 [new Application/FTP]
$ftp32 attach-agent $tcp32
$ns at 1.0 "$ftp32 start"
$ns at 2.0 "$ftp32 stop"

#???33???(FTP-TCP)
set tcp33 [new Agent/TCP/Newreno]
$tcp33 set class_ 2
set sink33 [new Agent/TCPSink]
$ns attach-agent $node_(35) $tcp33
$ns attach-agent $node_(36) $sink33
$ns connect $tcp33 $sink33
set ftp33 [new Application/FTP]
$ftp33 attach-agent $tcp33
$ns at 1.0 "$ftp33 start"
$ns at 2.0 "$ftp33 stop"

#???34???(FTP-TCP)
set tcp34 [new Agent/TCP/Newreno]
$tcp34 set class_ 2
set sink34 [new Agent/TCPSink]
$ns attach-agent $node_(37) $tcp34
$ns attach-agent $node_(38) $sink34
$ns connect $tcp34 $sink34
set ftp34 [new Application/FTP]
$ftp34 attach-agent $tcp34
$ns at 1.0 "$ftp34 start"
$ns at 2.0 "$ftp34 stop"

#???35???(FTP-TCP)
set tcp35 [new Agent/TCP/Newreno]
$tcp35 set class_ 2
set sink35 [new Agent/TCPSink]
$ns attach-agent $node_(38) $tcp35
$ns attach-agent $node_(39) $sink35
$ns connect $tcp35 $sink35
set ftp35 [new Application/FTP]
$ftp35 attach-agent $tcp35
$ns at 1.0 "$ftp35 start"
$ns at 2.0 "$ftp35 stop"

#???36???(FTP-TCP)
set tcp36 [new Agent/TCP/Newreno]
$tcp36 set class_ 2
set sink36 [new Agent/TCPSink]
$ns attach-agent $node_(39) $tcp36
$ns attach-agent $node_(40) $sink36
$ns connect $tcp36 $sink36
set ftp36 [new Application/FTP]
$ftp36 attach-agent $tcp36
$ns at 1.0 "$ftp36 start"
$ns at 2.0 "$ftp36 stop"

#???37???(CBR-UDP)
set udp37 [new Agent/UDP]
$ns attach-agent $node_(0) $udp37
set null37 [new Agent/Null]
$ns attach-agent $node_(1) $null37
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

#???38???(CBR-UDP)
set udp38 [new Agent/UDP]
$ns attach-agent $node_(1) $udp38
set null38 [new Agent/Null]
$ns attach-agent $node_(2) $null38
$ns connect $udp38 $null38
$udp38 set fid_ 2	;#?NAM??UDP?????????
set cbr38 [new Application/Traffic/CBR]	;#?UDP??????CBR????
$cbr38 attach-agent $udp38
$cbr38 set type_ CBR
$cbr38 set packet_size_ 1000;#??????
$cbr38 set rate_ 512Kb ;#??????
$cbr38 set random_ false
$ns at 1.0 "$cbr38 start"
$ns at 2.0 "$cbr38 stop"

#???39???(CBR-UDP)
set udp39 [new Agent/UDP]
$ns attach-agent $node_(2) $udp39
set null39 [new Agent/Null]
$ns attach-agent $node_(3) $null39
$ns connect $udp39 $null39
$udp39 set fid_ 2	;#?NAM??UDP?????????
set cbr39 [new Application/Traffic/CBR]	;#?UDP??????CBR????
$cbr39 attach-agent $udp39
$cbr39 set type_ CBR
$cbr39 set packet_size_ 1000;#??????
$cbr39 set rate_ 512Kb ;#??????
$cbr39 set random_ false
$ns at 1.0 "$cbr39 start"
$ns at 2.0 "$cbr39 stop"

#???40???(CBR-UDP)
set udp40 [new Agent/UDP]
$ns attach-agent $node_(3) $udp40
set null40 [new Agent/Null]
$ns attach-agent $node_(4) $null40
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

#???41???(CBR-UDP)
set udp41 [new Agent/UDP]
$ns attach-agent $node_(4) $udp41
set null41 [new Agent/Null]
$ns attach-agent $node_(5) $null41
$ns connect $udp41 $null41
$udp41 set fid_ 2	;#?NAM??UDP?????????
set cbr41 [new Application/Traffic/CBR]	;#?UDP??????CBR????
$cbr41 attach-agent $udp41
$cbr41 set type_ CBR
$cbr41 set packet_size_ 1000;#??????
$cbr41 set rate_ 512Kb ;#??????
$cbr41 set random_ false
$ns at 1.0 "$cbr41 start"
$ns at 2.0 "$cbr41 stop"

#???42???(CBR-UDP)
set udp42 [new Agent/UDP]
$ns attach-agent $node_(5) $udp42
set null42 [new Agent/Null]
$ns attach-agent $node_(6) $null42
$ns connect $udp42 $null42
$udp42 set fid_ 2	;#?NAM??UDP?????????
set cbr42 [new Application/Traffic/CBR]	;#?UDP??????CBR????
$cbr42 attach-agent $udp42
$cbr42 set type_ CBR
$cbr42 set packet_size_ 1000;#??????
$cbr42 set rate_ 512Kb ;#??????
$cbr42 set random_ false
$ns at 1.0 "$cbr42 start"
$ns at 2.0 "$cbr42 stop"

#???43???(CBR-UDP)
set udp43 [new Agent/UDP]
$ns attach-agent $node_(6) $udp43
set null43 [new Agent/Null]
$ns attach-agent $node_(7) $null43
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
$ns attach-agent $node_(7) $udp44
set null44 [new Agent/Null]
$ns attach-agent $node_(8) $null44
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
$ns attach-agent $node_(8) $udp45
set null45 [new Agent/Null]
$ns attach-agent $node_(9) $null45
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
$ns attach-agent $node_(9) $udp46
set null46 [new Agent/Null]
$ns attach-agent $node_(10) $null46
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
$ns attach-agent $node_(10) $udp47
set null47 [new Agent/Null]
$ns attach-agent $node_(11) $null47
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
$ns attach-agent $node_(12) $udp48
set null48 [new Agent/Null]
$ns attach-agent $node_(13) $null48
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
$ns attach-agent $node_(13) $udp49
set null49 [new Agent/Null]
$ns attach-agent $node_(14) $null49
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
$ns attach-agent $node_(14) $udp50
set null50 [new Agent/Null]
$ns attach-agent $node_(15) $null50
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
$ns attach-agent $node_(15) $udp51
set null51 [new Agent/Null]
$ns attach-agent $node_(16) $null51
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
$ns attach-agent $node_(16) $udp52
set null52 [new Agent/Null]
$ns attach-agent $node_(17) $null52
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
$ns attach-agent $node_(17) $udp53
set null53 [new Agent/Null]
$ns attach-agent $node_(18) $null53
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
$ns attach-agent $node_(18) $udp54
set null54 [new Agent/Null]
$ns attach-agent $node_(19) $null54
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
$ns attach-agent $node_(19) $udp55
set null55 [new Agent/Null]
$ns attach-agent $node_(20) $null55
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
$ns attach-agent $node_(20) $udp56
set null56 [new Agent/Null]
$ns attach-agent $node_(21) $null56
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
$ns attach-agent $node_(21) $udp57
set null57 [new Agent/Null]
$ns attach-agent $node_(22) $null57
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

#???58???(CBR-UDP)
set udp58 [new Agent/UDP]
$ns attach-agent $node_(22) $udp58
set null58 [new Agent/Null]
$ns attach-agent $node_(23) $null58
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

#???59???(CBR-UDP)
set udp59 [new Agent/UDP]
$ns attach-agent $node_(24) $udp59
set null59 [new Agent/Null]
$ns attach-agent $node_(25) $null59
$ns connect $udp59 $null59
$udp59 set fid_ 2	;#?NAM??UDP?????????
set cbr59 [new Application/Traffic/CBR]	;#?UDP??????CBR????
$cbr59 attach-agent $udp59
$cbr59 set type_ CBR
$cbr59 set packet_size_ 1000;#??????
$cbr59 set rate_ 512Kb ;#??????
$cbr59 set random_ false
$ns at 1.0 "$cbr59 start"
$ns at 2.0 "$cbr59 stop"

#???60???(CBR-UDP)
set udp60 [new Agent/UDP]
$ns attach-agent $node_(25) $udp60
set null60 [new Agent/Null]
$ns attach-agent $node_(26) $null60
$ns connect $udp60 $null60
$udp60 set fid_ 2	;#?NAM??UDP?????????
set cbr60 [new Application/Traffic/CBR]	;#?UDP??????CBR????
$cbr60 attach-agent $udp60
$cbr60 set type_ CBR
$cbr60 set packet_size_ 1000;#??????
$cbr60 set rate_ 512Kb ;#??????
$cbr60 set random_ false
$ns at 1.0 "$cbr60 start"
$ns at 2.0 "$cbr60 stop"

#???61???(CBR-UDP)
set udp61 [new Agent/UDP]
$ns attach-agent $node_(26) $udp61
set null61 [new Agent/Null]
$ns attach-agent $node_(27) $null61
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

#???62???(CBR-UDP)
set udp62 [new Agent/UDP]
$ns attach-agent $node_(27) $udp62
set null62 [new Agent/Null]
$ns attach-agent $node_(28) $null62
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

#???63???(CBR-UDP)
set udp63 [new Agent/UDP]
$ns attach-agent $node_(28) $udp63
set null63 [new Agent/Null]
$ns attach-agent $node_(29) $null63
$ns connect $udp63 $null63
$udp63 set fid_ 2	;#?NAM??UDP?????????
set cbr63 [new Application/Traffic/CBR]	;#?UDP??????CBR????
$cbr63 attach-agent $udp63
$cbr63 set type_ CBR
$cbr63 set packet_size_ 1000;#??????
$cbr63 set rate_ 512Kb ;#??????
$cbr63 set random_ false
$ns at 1.0 "$cbr63 start"
$ns at 2.0 "$cbr63 stop"

#???64???(CBR-UDP)
set udp64 [new Agent/UDP]
$ns attach-agent $node_(29) $udp64
set null64 [new Agent/Null]
$ns attach-agent $node_(30) $null64
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

#???65???(CBR-UDP)
set udp65 [new Agent/UDP]
$ns attach-agent $node_(30) $udp65
set null65 [new Agent/Null]
$ns attach-agent $node_(31) $null65
$ns connect $udp65 $null65
$udp65 set fid_ 2	;#?NAM??UDP?????????
set cbr65 [new Application/Traffic/CBR]	;#?UDP??????CBR????
$cbr65 attach-agent $udp65
$cbr65 set type_ CBR
$cbr65 set packet_size_ 1000;#??????
$cbr65 set rate_ 512Kb ;#??????
$cbr65 set random_ false
$ns at 1.0 "$cbr65 start"
$ns at 2.0 "$cbr65 stop"

#???66???(CBR-UDP)
set udp66 [new Agent/UDP]
$ns attach-agent $node_(31) $udp66
set null66 [new Agent/Null]
$ns attach-agent $node_(32) $null66
$ns connect $udp66 $null66
$udp66 set fid_ 2	;#?NAM??UDP?????????
set cbr66 [new Application/Traffic/CBR]	;#?UDP??????CBR????
$cbr66 attach-agent $udp66
$cbr66 set type_ CBR
$cbr66 set packet_size_ 1000;#??????
$cbr66 set rate_ 512Kb ;#??????
$cbr66 set random_ false
$ns at 1.0 "$cbr66 start"
$ns at 2.0 "$cbr66 stop"

#???67???(CBR-UDP)
set udp67 [new Agent/UDP]
$ns attach-agent $node_(32) $udp67
set null67 [new Agent/Null]
$ns attach-agent $node_(33) $null67
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

#???68???(CBR-UDP)
set udp68 [new Agent/UDP]
$ns attach-agent $node_(33) $udp68
set null68 [new Agent/Null]
$ns attach-agent $node_(34) $null68
$ns connect $udp68 $null68
$udp68 set fid_ 2	;#?NAM??UDP?????????
set cbr68 [new Application/Traffic/CBR]	;#?UDP??????CBR????
$cbr68 attach-agent $udp68
$cbr68 set type_ CBR
$cbr68 set packet_size_ 1000;#??????
$cbr68 set rate_ 512Kb ;#??????
$cbr68 set random_ false
$ns at 1.0 "$cbr68 start"
$ns at 2.0 "$cbr68 stop"

#???69???(CBR-UDP)
set udp69 [new Agent/UDP]
$ns attach-agent $node_(34) $udp69
set null69 [new Agent/Null]
$ns attach-agent $node_(35) $null69
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
$ns attach-agent $node_(35) $udp70
set null70 [new Agent/Null]
$ns attach-agent $node_(36) $null70
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
$ns attach-agent $node_(37) $udp71
set null71 [new Agent/Null]
$ns attach-agent $node_(38) $null71
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
$ns attach-agent $node_(38) $udp72
set null72 [new Agent/Null]
$ns attach-agent $node_(39) $null72
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
$ns attach-agent $node_(39) $udp73
set null73 [new Agent/Null]
$ns attach-agent $node_(40) $null73
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
$ns attach-agent $node_(0) $ping_a(74)
set ping_b(74) [new Agent/Ping]
$ns attach-agent $node_(1) $ping_b(74)
$ns connect $ping_a(74) $ping_b(74)	;#????Ping Agents
$ns at 1.0 "$ping_a(74) send"	;#??Ping???

#???75???(Ping)
set ping_a(75) [new Agent/Ping]
$ns attach-agent $node_(1) $ping_a(75)
set ping_b(75) [new Agent/Ping]
$ns attach-agent $node_(2) $ping_b(75)
$ns connect $ping_a(75) $ping_b(75)	;#????Ping Agents
$ns at 1.0 "$ping_a(75) send"	;#??Ping???

#???76???(Ping)
set ping_a(76) [new Agent/Ping]
$ns attach-agent $node_(2) $ping_a(76)
set ping_b(76) [new Agent/Ping]
$ns attach-agent $node_(3) $ping_b(76)
$ns connect $ping_a(76) $ping_b(76)	;#????Ping Agents
$ns at 1.0 "$ping_a(76) send"	;#??Ping???

#???77???(Ping)
set ping_a(77) [new Agent/Ping]
$ns attach-agent $node_(3) $ping_a(77)
set ping_b(77) [new Agent/Ping]
$ns attach-agent $node_(4) $ping_b(77)
$ns connect $ping_a(77) $ping_b(77)	;#????Ping Agents
$ns at 1.0 "$ping_a(77) send"	;#??Ping???

#???78???(Ping)
set ping_a(78) [new Agent/Ping]
$ns attach-agent $node_(4) $ping_a(78)
set ping_b(78) [new Agent/Ping]
$ns attach-agent $node_(5) $ping_b(78)
$ns connect $ping_a(78) $ping_b(78)	;#????Ping Agents
$ns at 1.0 "$ping_a(78) send"	;#??Ping???

#???79???(Ping)
set ping_a(79) [new Agent/Ping]
$ns attach-agent $node_(5) $ping_a(79)
set ping_b(79) [new Agent/Ping]
$ns attach-agent $node_(6) $ping_b(79)
$ns connect $ping_a(79) $ping_b(79)	;#????Ping Agents
$ns at 1.0 "$ping_a(79) send"	;#??Ping???

#???80???(Ping)
set ping_a(80) [new Agent/Ping]
$ns attach-agent $node_(6) $ping_a(80)
set ping_b(80) [new Agent/Ping]
$ns attach-agent $node_(7) $ping_b(80)
$ns connect $ping_a(80) $ping_b(80)	;#????Ping Agents
$ns at 1.0 "$ping_a(80) send"	;#??Ping???

#???81???(Ping)
set ping_a(81) [new Agent/Ping]
$ns attach-agent $node_(7) $ping_a(81)
set ping_b(81) [new Agent/Ping]
$ns attach-agent $node_(8) $ping_b(81)
$ns connect $ping_a(81) $ping_b(81)	;#????Ping Agents
$ns at 1.0 "$ping_a(81) send"	;#??Ping???

#???82???(Ping)
set ping_a(82) [new Agent/Ping]
$ns attach-agent $node_(8) $ping_a(82)
set ping_b(82) [new Agent/Ping]
$ns attach-agent $node_(9) $ping_b(82)
$ns connect $ping_a(82) $ping_b(82)	;#????Ping Agents
$ns at 1.0 "$ping_a(82) send"	;#??Ping???

#???83???(Ping)
set ping_a(83) [new Agent/Ping]
$ns attach-agent $node_(9) $ping_a(83)
set ping_b(83) [new Agent/Ping]
$ns attach-agent $node_(10) $ping_b(83)
$ns connect $ping_a(83) $ping_b(83)	;#????Ping Agents
$ns at 1.0 "$ping_a(83) send"	;#??Ping???

#???84???(Ping)
set ping_a(84) [new Agent/Ping]
$ns attach-agent $node_(10) $ping_a(84)
set ping_b(84) [new Agent/Ping]
$ns attach-agent $node_(11) $ping_b(84)
$ns connect $ping_a(84) $ping_b(84)	;#????Ping Agents
$ns at 1.0 "$ping_a(84) send"	;#??Ping???

#???85???(Ping)
set ping_a(85) [new Agent/Ping]
$ns attach-agent $node_(12) $ping_a(85)
set ping_b(85) [new Agent/Ping]
$ns attach-agent $node_(13) $ping_b(85)
$ns connect $ping_a(85) $ping_b(85)	;#????Ping Agents
$ns at 1.0 "$ping_a(85) send"	;#??Ping???

#???86???(Ping)
set ping_a(86) [new Agent/Ping]
$ns attach-agent $node_(13) $ping_a(86)
set ping_b(86) [new Agent/Ping]
$ns attach-agent $node_(14) $ping_b(86)
$ns connect $ping_a(86) $ping_b(86)	;#????Ping Agents
$ns at 1.0 "$ping_a(86) send"	;#??Ping???

#???87???(Ping)
set ping_a(87) [new Agent/Ping]
$ns attach-agent $node_(14) $ping_a(87)
set ping_b(87) [new Agent/Ping]
$ns attach-agent $node_(15) $ping_b(87)
$ns connect $ping_a(87) $ping_b(87)	;#????Ping Agents
$ns at 1.0 "$ping_a(87) send"	;#??Ping???

#???88???(Ping)
set ping_a(88) [new Agent/Ping]
$ns attach-agent $node_(15) $ping_a(88)
set ping_b(88) [new Agent/Ping]
$ns attach-agent $node_(16) $ping_b(88)
$ns connect $ping_a(88) $ping_b(88)	;#????Ping Agents
$ns at 1.0 "$ping_a(88) send"	;#??Ping???

#???89???(Ping)
set ping_a(89) [new Agent/Ping]
$ns attach-agent $node_(16) $ping_a(89)
set ping_b(89) [new Agent/Ping]
$ns attach-agent $node_(17) $ping_b(89)
$ns connect $ping_a(89) $ping_b(89)	;#????Ping Agents
$ns at 1.0 "$ping_a(89) send"	;#??Ping???

#???90???(Ping)
set ping_a(90) [new Agent/Ping]
$ns attach-agent $node_(17) $ping_a(90)
set ping_b(90) [new Agent/Ping]
$ns attach-agent $node_(18) $ping_b(90)
$ns connect $ping_a(90) $ping_b(90)	;#????Ping Agents
$ns at 1.0 "$ping_a(90) send"	;#??Ping???

#???91???(Ping)
set ping_a(91) [new Agent/Ping]
$ns attach-agent $node_(18) $ping_a(91)
set ping_b(91) [new Agent/Ping]
$ns attach-agent $node_(19) $ping_b(91)
$ns connect $ping_a(91) $ping_b(91)	;#????Ping Agents
$ns at 1.0 "$ping_a(91) send"	;#??Ping???

#???92???(Ping)
set ping_a(92) [new Agent/Ping]
$ns attach-agent $node_(19) $ping_a(92)
set ping_b(92) [new Agent/Ping]
$ns attach-agent $node_(20) $ping_b(92)
$ns connect $ping_a(92) $ping_b(92)	;#????Ping Agents
$ns at 1.0 "$ping_a(92) send"	;#??Ping???

#???93???(Ping)
set ping_a(93) [new Agent/Ping]
$ns attach-agent $node_(20) $ping_a(93)
set ping_b(93) [new Agent/Ping]
$ns attach-agent $node_(21) $ping_b(93)
$ns connect $ping_a(93) $ping_b(93)	;#????Ping Agents
$ns at 1.0 "$ping_a(93) send"	;#??Ping???

#???94???(Ping)
set ping_a(94) [new Agent/Ping]
$ns attach-agent $node_(21) $ping_a(94)
set ping_b(94) [new Agent/Ping]
$ns attach-agent $node_(22) $ping_b(94)
$ns connect $ping_a(94) $ping_b(94)	;#????Ping Agents
$ns at 1.0 "$ping_a(94) send"	;#??Ping???

#???95???(Ping)
set ping_a(95) [new Agent/Ping]
$ns attach-agent $node_(22) $ping_a(95)
set ping_b(95) [new Agent/Ping]
$ns attach-agent $node_(23) $ping_b(95)
$ns connect $ping_a(95) $ping_b(95)	;#????Ping Agents
$ns at 1.0 "$ping_a(95) send"	;#??Ping???

#???96???(Ping)
set ping_a(96) [new Agent/Ping]
$ns attach-agent $node_(24) $ping_a(96)
set ping_b(96) [new Agent/Ping]
$ns attach-agent $node_(25) $ping_b(96)
$ns connect $ping_a(96) $ping_b(96)	;#????Ping Agents
$ns at 1.0 "$ping_a(96) send"	;#??Ping???

#???97???(Ping)
set ping_a(97) [new Agent/Ping]
$ns attach-agent $node_(25) $ping_a(97)
set ping_b(97) [new Agent/Ping]
$ns attach-agent $node_(26) $ping_b(97)
$ns connect $ping_a(97) $ping_b(97)	;#????Ping Agents
$ns at 1.0 "$ping_a(97) send"	;#??Ping???

#???98???(Ping)
set ping_a(98) [new Agent/Ping]
$ns attach-agent $node_(26) $ping_a(98)
set ping_b(98) [new Agent/Ping]
$ns attach-agent $node_(27) $ping_b(98)
$ns connect $ping_a(98) $ping_b(98)	;#????Ping Agents
$ns at 1.0 "$ping_a(98) send"	;#??Ping???

#???99???(Ping)
set ping_a(99) [new Agent/Ping]
$ns attach-agent $node_(27) $ping_a(99)
set ping_b(99) [new Agent/Ping]
$ns attach-agent $node_(28) $ping_b(99)
$ns connect $ping_a(99) $ping_b(99)	;#????Ping Agents
$ns at 1.0 "$ping_a(99) send"	;#??Ping???

#???100???(Ping)
set ping_a(100) [new Agent/Ping]
$ns attach-agent $node_(28) $ping_a(100)
set ping_b(100) [new Agent/Ping]
$ns attach-agent $node_(29) $ping_b(100)
$ns connect $ping_a(100) $ping_b(100)	;#????Ping Agents
$ns at 1.0 "$ping_a(100) send"	;#??Ping???

#???101???(Ping)
set ping_a(101) [new Agent/Ping]
$ns attach-agent $node_(29) $ping_a(101)
set ping_b(101) [new Agent/Ping]
$ns attach-agent $node_(30) $ping_b(101)
$ns connect $ping_a(101) $ping_b(101)	;#????Ping Agents
$ns at 1.0 "$ping_a(101) send"	;#??Ping???

#???102???(Ping)
set ping_a(102) [new Agent/Ping]
$ns attach-agent $node_(30) $ping_a(102)
set ping_b(102) [new Agent/Ping]
$ns attach-agent $node_(31) $ping_b(102)
$ns connect $ping_a(102) $ping_b(102)	;#????Ping Agents
$ns at 1.0 "$ping_a(102) send"	;#??Ping???

#???103???(Ping)
set ping_a(103) [new Agent/Ping]
$ns attach-agent $node_(31) $ping_a(103)
set ping_b(103) [new Agent/Ping]
$ns attach-agent $node_(32) $ping_b(103)
$ns connect $ping_a(103) $ping_b(103)	;#????Ping Agents
$ns at 1.0 "$ping_a(103) send"	;#??Ping???

#???104???(Ping)
set ping_a(104) [new Agent/Ping]
$ns attach-agent $node_(32) $ping_a(104)
set ping_b(104) [new Agent/Ping]
$ns attach-agent $node_(33) $ping_b(104)
$ns connect $ping_a(104) $ping_b(104)	;#????Ping Agents
$ns at 1.0 "$ping_a(104) send"	;#??Ping???

#???105???(Ping)
set ping_a(105) [new Agent/Ping]
$ns attach-agent $node_(33) $ping_a(105)
set ping_b(105) [new Agent/Ping]
$ns attach-agent $node_(34) $ping_b(105)
$ns connect $ping_a(105) $ping_b(105)	;#????Ping Agents
$ns at 1.0 "$ping_a(105) send"	;#??Ping???

#???106???(Ping)
set ping_a(106) [new Agent/Ping]
$ns attach-agent $node_(34) $ping_a(106)
set ping_b(106) [new Agent/Ping]
$ns attach-agent $node_(35) $ping_b(106)
$ns connect $ping_a(106) $ping_b(106)	;#????Ping Agents
$ns at 1.0 "$ping_a(106) send"	;#??Ping???

#???107???(Ping)
set ping_a(107) [new Agent/Ping]
$ns attach-agent $node_(35) $ping_a(107)
set ping_b(107) [new Agent/Ping]
$ns attach-agent $node_(36) $ping_b(107)
$ns connect $ping_a(107) $ping_b(107)	;#????Ping Agents
$ns at 1.0 "$ping_a(107) send"	;#??Ping???

#???108???(Ping)
set ping_a(108) [new Agent/Ping]
$ns attach-agent $node_(37) $ping_a(108)
set ping_b(108) [new Agent/Ping]
$ns attach-agent $node_(38) $ping_b(108)
$ns connect $ping_a(108) $ping_b(108)	;#????Ping Agents
$ns at 1.0 "$ping_a(108) send"	;#??Ping???

#???109???(Ping)
set ping_a(109) [new Agent/Ping]
$ns attach-agent $node_(38) $ping_a(109)
set ping_b(109) [new Agent/Ping]
$ns attach-agent $node_(39) $ping_b(109)
$ns connect $ping_a(109) $ping_b(109)	;#????Ping Agents
$ns at 1.0 "$ping_a(109) send"	;#??Ping???

#???110???(Ping)
set ping_a(110) [new Agent/Ping]
$ns attach-agent $node_(39) $ping_a(110)
set ping_b(110) [new Agent/Ping]
$ns attach-agent $node_(40) $ping_b(110)
$ns connect $ping_a(110) $ping_b(110)	;#????Ping Agents
$ns at 1.0 "$ping_a(110) send"	;#??Ping???

#???111???(Ping)
set ping_a(111) [new Agent/Ping]
$ns attach-agent $node_(20) $ping_a(111)
set ping_b(111) [new Agent/Ping]
$ns attach-agent $node_(20) $ping_b(111)
$ns connect $ping_a(111) $ping_b(111)	;#????Ping Agents
$ns at 1.0 "$ping_a(111) send"	;#??Ping???

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
