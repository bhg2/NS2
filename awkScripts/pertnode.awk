BEGIN {
       recvdSize = 0
       startTime = 0
       stopTime = 5
  }
   
  {
             event = $1
             time = $2
             node_id = $3
             pkt_size = $8
             level = $7
   
  # Store start time
  if (level == "tcp" && event == "r" && node_id == "_6_") { #default pkt_size = 1000
    if (time < startTime) {
             startTime = time
             }
       }
   
  # Update total received packets' size and store packets arrival time
  if (level == "tcp" && event == "r" && node_id == "_6_") {
       if (time > stopTime) {
             stopTime = time
             }
       # Rip off the header
       #hdr_size = pkt_size % 512
       #pkt_size -= hdr_size
       # Store received packet's size
       recvdSize += pkt_size
       }
  }
   
  END {
       printf("\n\n\n\n\nAverage Throughput[kbps] = %.2f\n Node ID = 6 \n\n\n\n\n StartTime=%.2f\nStopTime=%.2f\n \n \n ",(recvdSize/(stopTime-startTime))*(8/1000),startTime,stopTime)
  }
