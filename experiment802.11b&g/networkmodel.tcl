# network Simulator Example

#Create a simulator object
set ns [new Simulator]

#Define different colors for data flows (for NAM)
$ns color 1 Blue
$ns color 2 Green
$ns color 3 Red

#Open the trace files outX.tr for Xgraph and out.nam for nam
set f0 [open out0.tr w]
set f1 [open out1.tr w]
set f2 [open out2.tr w]
set f3 [open out3.tr w]
set f4 [open out4.tr w]
set nf [open out.nam w]
$ns namtrace-all $nf

#Define a 'finish' procedure
proc finish {} {
global ns nf f0 f1 f2 f3 f4
$ns flush-trace
#Close the NAM trace file
close $nf
#Close the output files
close $f0
close $f1
close $f2
close $f3
close $f4
#Execute xgraph to display the results
exec xgraph out0.tr out1.tr out2.tr out3.tr out4.tr -geometry 600x400 &
#Execute NAM on the trace file
#exec nam out.nam &
exit 0
}

#Create Six nodes
set n0 [$ns node]
set n1 [$ns node]
set n2 [$ns node]
set n3 [$ns node]
set n4 [$ns node]
set n5 [$ns node]

#Change the shape of nodes n2 and n3
$n2 shape "box"
$n3 shape "box"

#Create links between the nodes
$ns duplex-link $n0 $n2 1Mb 10ms DropTail
$ns duplex-link $n1 $n2 1Mb 10ms DropTail
$ns duplex-link $n2 $n3 2Mb 10ms DropTail
$ns duplex-link $n4 $n3 1Mb 10ms DropTail
$ns duplex-link $n5 $n3 1Mb 10ms DropTail

#Set Queue Size of link (n2-n3) to 10
$ns queue-limit $n2 $n3 10

#Set node position in nam
$ns duplex-link-op $n0 $n2 orient right-down
$ns duplex-link-op $n1 $n2 orient right-up
$ns duplex-link-op $n2 $n3 orient right
$ns duplex-link-op $n4 $n3 orient left-down
$ns duplex-link-op $n5 $n3 orient left-up

#Monitor the queue for link (n2-n3). (for NAM)
$ns duplex-link-op $n2 $n3 queuePos 0.5

############################################################
##### add exponential Traffic. The following procedure was taken from #####
##### http://www.isi.edu/nsnam/ns/tutorial/index.html section VIII #####
##### and modified to suit the purpose of this example #####
############################################################

proc expo-traffic { node sink size burst idle rate } {
#Get an instance of the simulator
set ns [Simulator instance]

#Create a UDP agent and attach it to the node
set source [new Agent/UDP]
$ns attach-agent $node $source

#Create an Exponential traffic agent and set its properties
set traffic [new Application/Traffic/Exponential]
$traffic set packetSize_ $size
$traffic set burst_time_ $burst
$traffic set idle_time_ $idle
$traffic set rate_ $rate

# Attach traffic source to the traffic generator
$traffic attach-agent $source
#Connect the source and the sink
$ns connect $source $sink
return $traffic
}

###########################################################
##### Define a procedure which periodically records the bandwidth #####
##### received by the three traffic sinks sink/1/null and writes #####
##### it to the five files f0/1/2/3/4. #####
##### The following procedure was taken from #####
##### http://www.isi.edu/nsnam/ns/tutorial/index.html section VIII #####
##### and modified to suit the purpose of this example #####
############################################################

proc record {} {
global sinkl1 sinkl2 sinkl3 sinkl4 sinkl5 f0 f1 f2 f3 f4
#Get an instance of the simulator
set ns [Simulator instance]

#Set the time after which the procedure should be called again
set time 0.5

#How many bytes have been received by the traffic sinks?
set bw0 [$sinkl1 set bytes_]
set bw1 [$sinkl2 set bytes_]
set bw2 [$sinkl3 set bytes_]
set bw3 [$sinkl4 set bytes_]
set bw4 [$sinkl5 set bytes_]

#Get the current time
set now [$ns now]

#Calculate the bandwidth (in MBit/s) and write it to the files
puts $f0 "$now [expr $bw0/$time*8/1000000]"
puts $f1 "$now [expr $bw1/$time*8/1000000]"
puts $f2 "$now [expr $bw2/$time*8/1000000]"
puts $f3 "$now [expr $bw3/$time*8/1000000]"
puts $f4 "$now [expr $bw4/$time*8/1000000]"

#Reset the bytes_ values on the traffic sinks
$sinkl1 set bytes_ 0
$sinkl2 set bytes_ 0
$sinkl3 set bytes_ 0
$sinkl4 set bytes_ 0
$sinkl5 set bytes_ 0

#Re-schedule the procedure
$ns at [expr $now+$time] "record"
}
#Create five traffic sinks and attach them to the nodes n2 n3
set sinkl1 [new Agent/LossMonitor]
set sinkl2 [new Agent/LossMonitor]
set sinkl3 [new Agent/LossMonitor]
set sinkl4 [new Agent/LossMonitor]
set sinkl5 [new Agent/LossMonitor]
$ns attach-agent $n2 $sinkl1
$ns attach-agent $n2 $sinkl2
$ns attach-agent $n2 $sinkl3
$ns attach-agent $n3 $sinkl4
$ns attach-agent $n3 $sinkl5

#Create three traffic sources
set source0 [expo-traffic $n2 $sinkl1 200 2s 1s 100k]
set source1 [expo-traffic $n2 $sinkl2 200 2s 1s 200k]
set source2 [expo-traffic $n2 $sinkl3 300 2s 1s 300k]
set source3 [expo-traffic $n3 $sinkl4 500 2s 1s 400k]
set source4 [expo-traffic $n3 $sinkl5 500 2s 1s 500k]

#Setup a TCP1 connection
set tcp [new Agent/TCP]
$tcp set class_ 2
$ns attach-agent $n0 $tcp

set sink [new Agent/TCPSink]
$ns attach-agent $n5 $sink
$ns connect $tcp $sink
$tcp set fid_ 1

#Setup a FTP over TCP connection
set ftp [new Application/FTP]
$ftp attach-agent $tcp
$ftp set type_ FTP

#Setup a TCP2 connection
set tcp2 [new Agent/TCP]
$tcp2 set class_ 2
$ns attach-agent $n4 $tcp2

set sink2 [new Agent/TCPSink]
$ns attach-agent $n0 $sink2
$ns connect $tcp2 $sink2
$tcp2 set fid_ 2

#Setup a FTP over TCP connection
set ftp2 [new Application/FTP]
$ftp2 attach-agent $tcp2
$ftp2 set type_ FTP

#Setup a UDP connection
set udp [new Agent/UDP]
$ns attach-agent $n1 $udp
set null [new Agent/Null]
$ns attach-agent $n3 $null
$ns connect $udp $null
$udp set fid_ 3

#Setup a CBR over UDP connection
set cbr [new Application/Traffic/CBR]
$cbr attach-agent $udp
$cbr set type_ CBR
$cbr set packet_size_ 2000
$cbr set rate_ 1.5mb
$cbr set random_ false

#Start record procedure
$ns at 0.0 "record"

#Start the traffic sources
$ns at 0.1 "$source0 start"
$ns at 0.1 "$source1 start"
$ns at 0.1 "$source2 start"
$ns at 0.1 "$source3 start"
$ns at 0.1 "$source4 start"
$ns at 0.1 "$cbr start"
$ns at 0.5 "$ftp start"
$ns at 1.0 "$ftp2 start"

#Stop the traffic sources
$ns at 5.0 "$source0 stop"
$ns at 5.0 "$source1 stop"
$ns at 5.0 "$source2 stop"
$ns at 5.0 "$source3 stop"
$ns at 5.0 "$source4 stop"
$ns at 5.0 "$ftp2 stop"
$ns at 5.0 "$ftp stop"
$ns at 5.0 "$cbr stop"

#Call the finish procedure after 5 seconds of simulation time
$ns at 5.2 "finish"

#Run the simulation
$ns run
