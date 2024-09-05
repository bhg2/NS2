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
set val(nn)     8        ;# number of mobilenodes
set val(rp)     TORA     ;# routing protocol
set val(x)      1000            ;# X dimension of topography
set val(y)      1000           ;# Y dimension of topography
set val(stop)   10.0 ;# time of simulation end

#===================================
#               ??????                         
#===================================

#??trace file
set ns            [new Simulator]	;#??ns simulator
set tracefd       [open mac_802_11_node_8_ftp_58_cbr_1_ping_0.tr w]	;#??trace file
set namtrace       [open mac_802_11_node_8_ftp_58_cbr_1_ping_0.nam w]	;#????nam trace file

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
$node_(0) set X_ 136
$node_(0) set Y_ 936
$node_(0) set Z_ 0.0
$ns initial_node_pos $node_(0) 20

#???1?Node
set node_(1) [$ns node]
$node_(1) set X_ 338
$node_(1) set Y_ 932
$node_(1) set Z_ 0.0
$ns initial_node_pos $node_(1) 20

#???2?Node
set node_(3) [$ns node]
$node_(3) set X_ 326
$node_(3) set Y_ 776
$node_(3) set Z_ 0.0
$ns initial_node_pos $node_(3) 20

#???3?Node
set node_(4) [$ns node]
$node_(4) set X_ 462
$node_(4) set Y_ 736
$node_(4) set Z_ 0.0
$ns initial_node_pos $node_(4) 20

#???4?Node
set node_(5) [$ns node]
$node_(5) set X_ 202
$node_(5) set Y_ 684
$node_(5) set Z_ 0.0
$ns initial_node_pos $node_(5) 20

#???5?Node
set node_(6) [$ns node]
$node_(6) set X_ 146
$node_(6) set Y_ 814
$node_(6) set Z_ 0.0
$ns initial_node_pos $node_(6) 20

#???6?Node
set node_(7) [$ns node]
$node_(7) set X_ 336
$node_(7) set Y_ 670
$node_(7) set Z_ 0.0
$ns initial_node_pos $node_(7) 20

#???7?Node
set node_(8) [$ns node]
$node_(8) set X_ 486
$node_(8) set Y_ 932
$node_(8) set Z_ 0.0
$ns initial_node_pos $node_(8) 20

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

#???2???(FTP-TCP)
set tcp2 [new Agent/TCP/Newreno]
$tcp2 set class_ 2
set sink2 [new Agent/TCPSink]
$ns attach-agent $node_(1) $tcp2
$ns attach-agent $node_(8) $sink2
$ns connect $tcp2 $sink2
set ftp2 [new Application/FTP]
$ftp2 attach-agent $tcp2
$ns at 1.0 "$ftp2 start"
$ns at 2.0 "$ftp2 stop"

#???3???(FTP-TCP)
set tcp3 [new Agent/TCP/Newreno]
$tcp3 set class_ 2
set sink3 [new Agent/TCPSink]
$ns attach-agent $node_(0) $tcp3
$ns attach-agent $node_(1) $sink3
$ns connect $tcp3 $sink3
set ftp3 [new Application/FTP]
$ftp3 attach-agent $tcp3
$ns at 1.0 "$ftp3 start"
$ns at 2.0 "$ftp3 stop"

#???4???(FTP-TCP)
set tcp4 [new Agent/TCP/Newreno]
$tcp4 set class_ 2
set sink4 [new Agent/TCPSink]
$ns attach-agent $node_(0) $tcp4
$ns attach-agent $node_(3) $sink4
$ns connect $tcp4 $sink4
set ftp4 [new Application/FTP]
$ftp4 attach-agent $tcp4
$ns at 1.0 "$ftp4 start"
$ns at 2.0 "$ftp4 stop"

#???5???(FTP-TCP)
set tcp5 [new Agent/TCP/Newreno]
$tcp5 set class_ 2
set sink5 [new Agent/TCPSink]
$ns attach-agent $node_(0) $tcp5
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
$ns attach-agent $node_(0) $tcp6
$ns attach-agent $node_(5) $sink6
$ns connect $tcp6 $sink6
set ftp6 [new Application/FTP]
$ftp6 attach-agent $tcp6
$ns at 1.0 "$ftp6 start"
$ns at 2.0 "$ftp6 stop"

#???7???(FTP-TCP)
set tcp7 [new Agent/TCP/Newreno]
$tcp7 set class_ 2
set sink7 [new Agent/TCPSink]
$ns attach-agent $node_(0) $tcp7
$ns attach-agent $node_(6) $sink7
$ns connect $tcp7 $sink7
set ftp7 [new Application/FTP]
$ftp7 attach-agent $tcp7
$ns at 1.0 "$ftp7 start"
$ns at 2.0 "$ftp7 stop"

#???8???(FTP-TCP)
set tcp8 [new Agent/TCP/Newreno]
$tcp8 set class_ 2
set sink8 [new Agent/TCPSink]
$ns attach-agent $node_(0) $tcp8
$ns attach-agent $node_(7) $sink8
$ns connect $tcp8 $sink8
set ftp8 [new Application/FTP]
$ftp8 attach-agent $tcp8
$ns at 1.0 "$ftp8 start"
$ns at 2.0 "$ftp8 stop"

#???9???(FTP-TCP)
set tcp9 [new Agent/TCP/Newreno]
$tcp9 set class_ 2
set sink9 [new Agent/TCPSink]
$ns attach-agent $node_(0) $tcp9
$ns attach-agent $node_(8) $sink9
$ns connect $tcp9 $sink9
set ftp9 [new Application/FTP]
$ftp9 attach-agent $tcp9
$ns at 1.0 "$ftp9 start"
$ns at 2.0 "$ftp9 stop"

#???10???(FTP-TCP)
set tcp10 [new Agent/TCP/Newreno]
$tcp10 set class_ 2
set sink10 [new Agent/TCPSink]
$ns attach-agent $node_(1) $tcp10
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
$ns attach-agent $node_(1) $tcp11
$ns attach-agent $node_(3) $sink11
$ns connect $tcp11 $sink11
set ftp11 [new Application/FTP]
$ftp11 attach-agent $tcp11
$ns at 1.0 "$ftp11 start"
$ns at 2.0 "$ftp11 stop"

#???12???(FTP-TCP)
set tcp12 [new Agent/TCP/Newreno]
$tcp12 set class_ 2
set sink12 [new Agent/TCPSink]
$ns attach-agent $node_(1) $tcp12
$ns attach-agent $node_(4) $sink12
$ns connect $tcp12 $sink12
set ftp12 [new Application/FTP]
$ftp12 attach-agent $tcp12
$ns at 1.0 "$ftp12 start"
$ns at 2.0 "$ftp12 stop"

#???13???(FTP-TCP)
set tcp13 [new Agent/TCP/Newreno]
$tcp13 set class_ 2
set sink13 [new Agent/TCPSink]
$ns attach-agent $node_(1) $tcp13
$ns attach-agent $node_(5) $sink13
$ns connect $tcp13 $sink13
set ftp13 [new Application/FTP]
$ftp13 attach-agent $tcp13
$ns at 1.0 "$ftp13 start"
$ns at 2.0 "$ftp13 stop"

#???14???(FTP-TCP)
set tcp14 [new Agent/TCP/Newreno]
$tcp14 set class_ 2
set sink14 [new Agent/TCPSink]
$ns attach-agent $node_(1) $tcp14
$ns attach-agent $node_(6) $sink14
$ns connect $tcp14 $sink14
set ftp14 [new Application/FTP]
$ftp14 attach-agent $tcp14
$ns at 1.0 "$ftp14 start"
$ns at 2.0 "$ftp14 stop"

#???15???(FTP-TCP)
set tcp15 [new Agent/TCP/Newreno]
$tcp15 set class_ 2
set sink15 [new Agent/TCPSink]
$ns attach-agent $node_(1) $tcp15
$ns attach-agent $node_(7) $sink15
$ns connect $tcp15 $sink15
set ftp15 [new Application/FTP]
$ftp15 attach-agent $tcp15
$ns at 1.0 "$ftp15 start"
$ns at 2.0 "$ftp15 stop"

#???16???(FTP-TCP)
set tcp16 [new Agent/TCP/Newreno]
$tcp16 set class_ 2
set sink16 [new Agent/TCPSink]
$ns attach-agent $node_(1) $tcp16
$ns attach-agent $node_(8) $sink16
$ns connect $tcp16 $sink16
set ftp16 [new Application/FTP]
$ftp16 attach-agent $tcp16
$ns at 1.0 "$ftp16 start"
$ns at 2.0 "$ftp16 stop"

#???17???(FTP-TCP)
set tcp17 [new Agent/TCP/Newreno]
$tcp17 set class_ 2
set sink17 [new Agent/TCPSink]
$ns attach-agent $node_(3) $tcp17
$ns attach-agent $node_(0) $sink17
$ns connect $tcp17 $sink17
set ftp17 [new Application/FTP]
$ftp17 attach-agent $tcp17
$ns at 1.0 "$ftp17 start"
$ns at 2.0 "$ftp17 stop"

#???18???(FTP-TCP)
set tcp18 [new Agent/TCP/Newreno]
$tcp18 set class_ 2
set sink18 [new Agent/TCPSink]
$ns attach-agent $node_(3) $tcp18
$ns attach-agent $node_(1) $sink18
$ns connect $tcp18 $sink18
set ftp18 [new Application/FTP]
$ftp18 attach-agent $tcp18
$ns at 1.0 "$ftp18 start"
$ns at 2.0 "$ftp18 stop"

#???19???(FTP-TCP)
set tcp19 [new Agent/TCP/Newreno]
$tcp19 set class_ 2
set sink19 [new Agent/TCPSink]
$ns attach-agent $node_(3) $tcp19
$ns attach-agent $node_(4) $sink19
$ns connect $tcp19 $sink19
set ftp19 [new Application/FTP]
$ftp19 attach-agent $tcp19
$ns at 1.0 "$ftp19 start"
$ns at 2.0 "$ftp19 stop"

#???20???(FTP-TCP)
set tcp20 [new Agent/TCP/Newreno]
$tcp20 set class_ 2
set sink20 [new Agent/TCPSink]
$ns attach-agent $node_(3) $tcp20
$ns attach-agent $node_(5) $sink20
$ns connect $tcp20 $sink20
set ftp20 [new Application/FTP]
$ftp20 attach-agent $tcp20
$ns at 1.0 "$ftp20 start"
$ns at 2.0 "$ftp20 stop"

#???21???(FTP-TCP)
set tcp21 [new Agent/TCP/Newreno]
$tcp21 set class_ 2
set sink21 [new Agent/TCPSink]
$ns attach-agent $node_(3) $tcp21
$ns attach-agent $node_(6) $sink21
$ns connect $tcp21 $sink21
set ftp21 [new Application/FTP]
$ftp21 attach-agent $tcp21
$ns at 1.0 "$ftp21 start"
$ns at 2.0 "$ftp21 stop"

#???22???(FTP-TCP)
set tcp22 [new Agent/TCP/Newreno]
$tcp22 set class_ 2
set sink22 [new Agent/TCPSink]
$ns attach-agent $node_(3) $tcp22
$ns attach-agent $node_(7) $sink22
$ns connect $tcp22 $sink22
set ftp22 [new Application/FTP]
$ftp22 attach-agent $tcp22
$ns at 1.0 "$ftp22 start"
$ns at 2.0 "$ftp22 stop"

#???23???(FTP-TCP)
set tcp23 [new Agent/TCP/Newreno]
$tcp23 set class_ 2
set sink23 [new Agent/TCPSink]
$ns attach-agent $node_(3) $tcp23
$ns attach-agent $node_(8) $sink23
$ns connect $tcp23 $sink23
set ftp23 [new Application/FTP]
$ftp23 attach-agent $tcp23
$ns at 1.0 "$ftp23 start"
$ns at 2.0 "$ftp23 stop"

#???24???(FTP-TCP)
set tcp24 [new Agent/TCP/Newreno]
$tcp24 set class_ 2
set sink24 [new Agent/TCPSink]
$ns attach-agent $node_(4) $tcp24
$ns attach-agent $node_(0) $sink24
$ns connect $tcp24 $sink24
set ftp24 [new Application/FTP]
$ftp24 attach-agent $tcp24
$ns at 1.0 "$ftp24 start"
$ns at 2.0 "$ftp24 stop"

#???25???(FTP-TCP)
set tcp25 [new Agent/TCP/Newreno]
$tcp25 set class_ 2
set sink25 [new Agent/TCPSink]
$ns attach-agent $node_(4) $tcp25
$ns attach-agent $node_(1) $sink25
$ns connect $tcp25 $sink25
set ftp25 [new Application/FTP]
$ftp25 attach-agent $tcp25
$ns at 1.0 "$ftp25 start"
$ns at 2.0 "$ftp25 stop"

#???26???(FTP-TCP)
set tcp26 [new Agent/TCP/Newreno]
$tcp26 set class_ 2
set sink26 [new Agent/TCPSink]
$ns attach-agent $node_(4) $tcp26
$ns attach-agent $node_(3) $sink26
$ns connect $tcp26 $sink26
set ftp26 [new Application/FTP]
$ftp26 attach-agent $tcp26
$ns at 1.0 "$ftp26 start"
$ns at 2.0 "$ftp26 stop"

#???27???(FTP-TCP)
set tcp27 [new Agent/TCP/Newreno]
$tcp27 set class_ 2
set sink27 [new Agent/TCPSink]
$ns attach-agent $node_(4) $tcp27
$ns attach-agent $node_(5) $sink27
$ns connect $tcp27 $sink27
set ftp27 [new Application/FTP]
$ftp27 attach-agent $tcp27
$ns at 1.0 "$ftp27 start"
$ns at 2.0 "$ftp27 stop"

#???28???(FTP-TCP)
set tcp28 [new Agent/TCP/Newreno]
$tcp28 set class_ 2
set sink28 [new Agent/TCPSink]
$ns attach-agent $node_(4) $tcp28
$ns attach-agent $node_(6) $sink28
$ns connect $tcp28 $sink28
set ftp28 [new Application/FTP]
$ftp28 attach-agent $tcp28
$ns at 1.0 "$ftp28 start"
$ns at 2.0 "$ftp28 stop"

#???29???(FTP-TCP)
set tcp29 [new Agent/TCP/Newreno]
$tcp29 set class_ 2
set sink29 [new Agent/TCPSink]
$ns attach-agent $node_(4) $tcp29
$ns attach-agent $node_(7) $sink29
$ns connect $tcp29 $sink29
set ftp29 [new Application/FTP]
$ftp29 attach-agent $tcp29
$ns at 1.0 "$ftp29 start"
$ns at 2.0 "$ftp29 stop"

#???30???(FTP-TCP)
set tcp30 [new Agent/TCP/Newreno]
$tcp30 set class_ 2
set sink30 [new Agent/TCPSink]
$ns attach-agent $node_(4) $tcp30
$ns attach-agent $node_(8) $sink30
$ns connect $tcp30 $sink30
set ftp30 [new Application/FTP]
$ftp30 attach-agent $tcp30
$ns at 1.0 "$ftp30 start"
$ns at 2.0 "$ftp30 stop"

#???31???(FTP-TCP)
set tcp31 [new Agent/TCP/Newreno]
$tcp31 set class_ 2
set sink31 [new Agent/TCPSink]
$ns attach-agent $node_(5) $tcp31
$ns attach-agent $node_(0) $sink31
$ns connect $tcp31 $sink31
set ftp31 [new Application/FTP]
$ftp31 attach-agent $tcp31
$ns at 1.0 "$ftp31 start"
$ns at 2.0 "$ftp31 stop"

#???32???(FTP-TCP)
set tcp32 [new Agent/TCP/Newreno]
$tcp32 set class_ 2
set sink32 [new Agent/TCPSink]
$ns attach-agent $node_(5) $tcp32
$ns attach-agent $node_(1) $sink32
$ns connect $tcp32 $sink32
set ftp32 [new Application/FTP]
$ftp32 attach-agent $tcp32
$ns at 1.0 "$ftp32 start"
$ns at 2.0 "$ftp32 stop"

#???33???(FTP-TCP)
set tcp33 [new Agent/TCP/Newreno]
$tcp33 set class_ 2
set sink33 [new Agent/TCPSink]
$ns attach-agent $node_(5) $tcp33
$ns attach-agent $node_(3) $sink33
$ns connect $tcp33 $sink33
set ftp33 [new Application/FTP]
$ftp33 attach-agent $tcp33
$ns at 1.0 "$ftp33 start"
$ns at 2.0 "$ftp33 stop"

#???34???(FTP-TCP)
set tcp34 [new Agent/TCP/Newreno]
$tcp34 set class_ 2
set sink34 [new Agent/TCPSink]
$ns attach-agent $node_(5) $tcp34
$ns attach-agent $node_(4) $sink34
$ns connect $tcp34 $sink34
set ftp34 [new Application/FTP]
$ftp34 attach-agent $tcp34
$ns at 1.0 "$ftp34 start"
$ns at 2.0 "$ftp34 stop"

#???35???(FTP-TCP)
set tcp35 [new Agent/TCP/Newreno]
$tcp35 set class_ 2
set sink35 [new Agent/TCPSink]
$ns attach-agent $node_(5) $tcp35
$ns attach-agent $node_(6) $sink35
$ns connect $tcp35 $sink35
set ftp35 [new Application/FTP]
$ftp35 attach-agent $tcp35
$ns at 1.0 "$ftp35 start"
$ns at 2.0 "$ftp35 stop"

#???36???(FTP-TCP)
set tcp36 [new Agent/TCP/Newreno]
$tcp36 set class_ 2
set sink36 [new Agent/TCPSink]
$ns attach-agent $node_(5) $tcp36
$ns attach-agent $node_(7) $sink36
$ns connect $tcp36 $sink36
set ftp36 [new Application/FTP]
$ftp36 attach-agent $tcp36
$ns at 1.0 "$ftp36 start"
$ns at 2.0 "$ftp36 stop"

#???37???(FTP-TCP)
set tcp37 [new Agent/TCP/Newreno]
$tcp37 set class_ 2
set sink37 [new Agent/TCPSink]
$ns attach-agent $node_(5) $tcp37
$ns attach-agent $node_(8) $sink37
$ns connect $tcp37 $sink37
set ftp37 [new Application/FTP]
$ftp37 attach-agent $tcp37
$ns at 1.0 "$ftp37 start"
$ns at 2.0 "$ftp37 stop"

#???38???(FTP-TCP)
set tcp38 [new Agent/TCP/Newreno]
$tcp38 set class_ 2
set sink38 [new Agent/TCPSink]
$ns attach-agent $node_(6) $tcp38
$ns attach-agent $node_(0) $sink38
$ns connect $tcp38 $sink38
set ftp38 [new Application/FTP]
$ftp38 attach-agent $tcp38
$ns at 1.0 "$ftp38 start"
$ns at 2.0 "$ftp38 stop"

#???39???(FTP-TCP)
set tcp39 [new Agent/TCP/Newreno]
$tcp39 set class_ 2
set sink39 [new Agent/TCPSink]
$ns attach-agent $node_(6) $tcp39
$ns attach-agent $node_(1) $sink39
$ns connect $tcp39 $sink39
set ftp39 [new Application/FTP]
$ftp39 attach-agent $tcp39
$ns at 1.0 "$ftp39 start"
$ns at 2.0 "$ftp39 stop"

#???40???(FTP-TCP)
set tcp40 [new Agent/TCP/Newreno]
$tcp40 set class_ 2
set sink40 [new Agent/TCPSink]
$ns attach-agent $node_(6) $tcp40
$ns attach-agent $node_(3) $sink40
$ns connect $tcp40 $sink40
set ftp40 [new Application/FTP]
$ftp40 attach-agent $tcp40
$ns at 1.0 "$ftp40 start"
$ns at 2.0 "$ftp40 stop"

#???41???(FTP-TCP)
set tcp41 [new Agent/TCP/Newreno]
$tcp41 set class_ 2
set sink41 [new Agent/TCPSink]
$ns attach-agent $node_(6) $tcp41
$ns attach-agent $node_(4) $sink41
$ns connect $tcp41 $sink41
set ftp41 [new Application/FTP]
$ftp41 attach-agent $tcp41
$ns at 1.0 "$ftp41 start"
$ns at 2.0 "$ftp41 stop"

#???42???(FTP-TCP)
set tcp42 [new Agent/TCP/Newreno]
$tcp42 set class_ 2
set sink42 [new Agent/TCPSink]
$ns attach-agent $node_(6) $tcp42
$ns attach-agent $node_(5) $sink42
$ns connect $tcp42 $sink42
set ftp42 [new Application/FTP]
$ftp42 attach-agent $tcp42
$ns at 1.0 "$ftp42 start"
$ns at 2.0 "$ftp42 stop"

#???43???(FTP-TCP)
set tcp43 [new Agent/TCP/Newreno]
$tcp43 set class_ 2
set sink43 [new Agent/TCPSink]
$ns attach-agent $node_(6) $tcp43
$ns attach-agent $node_(7) $sink43
$ns connect $tcp43 $sink43
set ftp43 [new Application/FTP]
$ftp43 attach-agent $tcp43
$ns at 1.0 "$ftp43 start"
$ns at 2.0 "$ftp43 stop"

#???44???(FTP-TCP)
set tcp44 [new Agent/TCP/Newreno]
$tcp44 set class_ 2
set sink44 [new Agent/TCPSink]
$ns attach-agent $node_(6) $tcp44
$ns attach-agent $node_(8) $sink44
$ns connect $tcp44 $sink44
set ftp44 [new Application/FTP]
$ftp44 attach-agent $tcp44
$ns at 1.0 "$ftp44 start"
$ns at 2.0 "$ftp44 stop"

#???45???(FTP-TCP)
set tcp45 [new Agent/TCP/Newreno]
$tcp45 set class_ 2
set sink45 [new Agent/TCPSink]
$ns attach-agent $node_(7) $tcp45
$ns attach-agent $node_(0) $sink45
$ns connect $tcp45 $sink45
set ftp45 [new Application/FTP]
$ftp45 attach-agent $tcp45
$ns at 1.0 "$ftp45 start"
$ns at 2.0 "$ftp45 stop"

#???46???(FTP-TCP)
set tcp46 [new Agent/TCP/Newreno]
$tcp46 set class_ 2
set sink46 [new Agent/TCPSink]
$ns attach-agent $node_(7) $tcp46
$ns attach-agent $node_(1) $sink46
$ns connect $tcp46 $sink46
set ftp46 [new Application/FTP]
$ftp46 attach-agent $tcp46
$ns at 1.0 "$ftp46 start"
$ns at 2.0 "$ftp46 stop"

#???47???(FTP-TCP)
set tcp47 [new Agent/TCP/Newreno]
$tcp47 set class_ 2
set sink47 [new Agent/TCPSink]
$ns attach-agent $node_(7) $tcp47
$ns attach-agent $node_(3) $sink47
$ns connect $tcp47 $sink47
set ftp47 [new Application/FTP]
$ftp47 attach-agent $tcp47
$ns at 1.0 "$ftp47 start"
$ns at 2.0 "$ftp47 stop"

#???48???(FTP-TCP)
set tcp48 [new Agent/TCP/Newreno]
$tcp48 set class_ 2
set sink48 [new Agent/TCPSink]
$ns attach-agent $node_(7) $tcp48
$ns attach-agent $node_(4) $sink48
$ns connect $tcp48 $sink48
set ftp48 [new Application/FTP]
$ftp48 attach-agent $tcp48
$ns at 1.0 "$ftp48 start"
$ns at 2.0 "$ftp48 stop"

#???49???(FTP-TCP)
set tcp49 [new Agent/TCP/Newreno]
$tcp49 set class_ 2
set sink49 [new Agent/TCPSink]
$ns attach-agent $node_(7) $tcp49
$ns attach-agent $node_(5) $sink49
$ns connect $tcp49 $sink49
set ftp49 [new Application/FTP]
$ftp49 attach-agent $tcp49
$ns at 1.0 "$ftp49 start"
$ns at 2.0 "$ftp49 stop"

#???50???(FTP-TCP)
set tcp50 [new Agent/TCP/Newreno]
$tcp50 set class_ 2
set sink50 [new Agent/TCPSink]
$ns attach-agent $node_(7) $tcp50
$ns attach-agent $node_(6) $sink50
$ns connect $tcp50 $sink50
set ftp50 [new Application/FTP]
$ftp50 attach-agent $tcp50
$ns at 1.0 "$ftp50 start"
$ns at 2.0 "$ftp50 stop"

#???51???(FTP-TCP)
set tcp51 [new Agent/TCP/Newreno]
$tcp51 set class_ 2
set sink51 [new Agent/TCPSink]
$ns attach-agent $node_(7) $tcp51
$ns attach-agent $node_(8) $sink51
$ns connect $tcp51 $sink51
set ftp51 [new Application/FTP]
$ftp51 attach-agent $tcp51
$ns at 1.0 "$ftp51 start"
$ns at 2.0 "$ftp51 stop"

#???52???(FTP-TCP)
set tcp52 [new Agent/TCP/Newreno]
$tcp52 set class_ 2
set sink52 [new Agent/TCPSink]
$ns attach-agent $node_(8) $tcp52
$ns attach-agent $node_(0) $sink52
$ns connect $tcp52 $sink52
set ftp52 [new Application/FTP]
$ftp52 attach-agent $tcp52
$ns at 1.0 "$ftp52 start"
$ns at 2.0 "$ftp52 stop"

#???53???(FTP-TCP)
set tcp53 [new Agent/TCP/Newreno]
$tcp53 set class_ 2
set sink53 [new Agent/TCPSink]
$ns attach-agent $node_(8) $tcp53
$ns attach-agent $node_(1) $sink53
$ns connect $tcp53 $sink53
set ftp53 [new Application/FTP]
$ftp53 attach-agent $tcp53
$ns at 1.0 "$ftp53 start"
$ns at 2.0 "$ftp53 stop"

#???54???(FTP-TCP)
set tcp54 [new Agent/TCP/Newreno]
$tcp54 set class_ 2
set sink54 [new Agent/TCPSink]
$ns attach-agent $node_(8) $tcp54
$ns attach-agent $node_(3) $sink54
$ns connect $tcp54 $sink54
set ftp54 [new Application/FTP]
$ftp54 attach-agent $tcp54
$ns at 1.0 "$ftp54 start"
$ns at 2.0 "$ftp54 stop"

#???55???(FTP-TCP)
set tcp55 [new Agent/TCP/Newreno]
$tcp55 set class_ 2
set sink55 [new Agent/TCPSink]
$ns attach-agent $node_(8) $tcp55
$ns attach-agent $node_(4) $sink55
$ns connect $tcp55 $sink55
set ftp55 [new Application/FTP]
$ftp55 attach-agent $tcp55
$ns at 1.0 "$ftp55 start"
$ns at 2.0 "$ftp55 stop"

#???56???(FTP-TCP)
set tcp56 [new Agent/TCP/Newreno]
$tcp56 set class_ 2
set sink56 [new Agent/TCPSink]
$ns attach-agent $node_(8) $tcp56
$ns attach-agent $node_(5) $sink56
$ns connect $tcp56 $sink56
set ftp56 [new Application/FTP]
$ftp56 attach-agent $tcp56
$ns at 1.0 "$ftp56 start"
$ns at 2.0 "$ftp56 stop"

#???57???(FTP-TCP)
set tcp57 [new Agent/TCP/Newreno]
$tcp57 set class_ 2
set sink57 [new Agent/TCPSink]
$ns attach-agent $node_(8) $tcp57
$ns attach-agent $node_(6) $sink57
$ns connect $tcp57 $sink57
set ftp57 [new Application/FTP]
$ftp57 attach-agent $tcp57
$ns at 1.0 "$ftp57 start"
$ns at 2.0 "$ftp57 stop"

#???58???(FTP-TCP)
set tcp58 [new Agent/TCP/Newreno]
$tcp58 set class_ 2
set sink58 [new Agent/TCPSink]
$ns attach-agent $node_(8) $tcp58
$ns attach-agent $node_(7) $sink58
$ns connect $tcp58 $sink58
set ftp58 [new Application/FTP]
$ftp58 attach-agent $tcp58
$ns at 1.0 "$ftp58 start"
$ns at 2.0 "$ftp58 stop"

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
