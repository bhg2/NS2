source  "longlived.rcp.tcl"

set ns [new Simulator]

#----------creating nam objects----------------#

set nf [open rcp.nam w]

$ns namtrace-all $nf

#open the trace file

set nt [open rcp.tr w]

$ns trace-all $nt

set proto rlm

$ns color 1 blue

$ns color 2 yellow

$ns color 3 red

#---------- creating client- router- end server node----------------#

set Client1 [$ns node]

set Router1 [$ns node]

set Endserver1 [$ns node]

#---creating duplex link---------#

$ns duplex-link $Client1 $Router1 2Mb 100ms DropTail

$ns duplex-link $Router1 $Endserver1 200Kb 100ms DropTail

#----------------creating orientation------------------#

$ns duplex-link-op $Client1 $Router1 orient right

$ns duplex-link-op $Router1 $Endserver1 orient right

#------------Labelling----------------#

$ns at 0.0 "$Client1 label Client"

$ns at 0.0 "$Router1 label Router"

$ns at 0.0 "$Endserver1 label Endserver"

#-----------Configuring nodes------------#

$Endserver1 shape hexagon

$Router1 shape square

#----------------Establishing queues---------#

#$ns duplex-link-op $Client1 $Router1 queuePos 0.1

#$ns duplex-link-op $Router1 $Endserver1 queuePos 0.5

#--------Include finish.tcl ----------------#

source "finish.tcl"

source file 2: (finish.tcl)

#---------finish procedure--------#

proc finish {} {

global ns nf nt

$ns flush-trace

close $nf

close $nt

puts "running nam..."

exec nam rcp.nam &

exit 0

}

#Calling finish procedure

$ns at 6.0 "finish"

$ns run 
