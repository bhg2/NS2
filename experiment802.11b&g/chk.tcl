set val(chan)		Channel/WirelessChannel
set val(prop)		Propagation/TwoRayGround
set val(netif)		Phy/WirelessPhy
set val(mac)            Mac/802_11
set val(ifq)		Queue/DropTail/PriQueue
set val(ll)		LL
set val(ant)            Antenna/OmniAntenna
set val(x)		500	
set val(y)		500	
set val(ifqlen)		50		
set val(nn)		7		
set val(stop)		200.0		
set val(rp)             AODV       

#reate simulator object:
 set ns_ [new Simulator]

 #Setup Trace File:
 set tracefd [open simple.tr w]
 $ns_ trace-all $tracefd

 #Create Topography:
 set topo [new Topography]
 $topo load_flatgrid 500 500

# Create Object God:
 create-god $val(nn)
 
 $ns_ node-config -adhocRouting $val(rp) \
-llType $val(ll) \
          -macType $val(mac) \
    -ifqType $val(ifq) \
       -ifqLen $val(ifqlen) \
       -antType $val(ant) \
           -propType $val(prop) \
          -phyType $val(netif) \
         -topoInstance $topo \
                -channelType $val(chan) \
  -agentTrace ON \
  -routerTrace ON \
 -macTrace OFF \
         -movementTrace OFF

for {set i 0} {$i < $val(nn) } {incr i} {
set node_($i) [$ns_ node ]
$node_($i) random-motion 0 ;# disable random motion
}

$node_(0)  set X_ 5.0
$node_(0)  set Y_ 2.0
$node_(0)  set Z_ 0.0
$node_(1)  set X_ 390.0
$node_(1)  set Y_ 385.0
$node_(1)  set Z_ 0.0

 #Create Movement:
# Node_(1) starts to move towards node_(0)
$ns_ at 50.0 "$node_(1) setdest 25.0 20.0 15.0"
$ns_ at 10.0 "$node_(0) setdest 20.0 18.0 1.0"
# Node_(1) then starts to move away from node_(0)
$ns_ at 100.0 "$node_(1) setdest 490.0 480.0 15.0"


set tcp [new Agent/TCP]
$tcp set class_ 2 set sink [new Agent/TCPSink]
$ns_ attach-agent $node_(0)
$tcp $ns_ attach-agent $node_(1)
$sink $ns_ connect $tcp
$sink set ftp [new Application/FTP]
$ftp attach-agent $tcp $ns_ at 10.0 "$ftp start"

for {set i 0} {$i < $val(nn) } {incr i} {
$ns_ at 150.0 "$node_($i) reset";
}
$ns_ at 150.0001 "stop"
$ns_ at 150.0002 "puts \"NS EXITING...\" ;
$ns_ halt" proc stop {} { global ns_ tracefd close $tracefd }


puts "Starting Simulation..."
$ns_ run


