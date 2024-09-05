#This program is used to calculate the end-to-end delay for CBR

 

BEGIN {

     highest_packet_id = 0;

}

{

   action = $1;

   time = $2;

   from = $3;

   to = $4;

   type = $5;

   pktsize = $6;

   flow_id = $8;

   src = $9;

   dst = $10;

   seq_no = $11;

   packet_id = $12;

 

   if ( packet_id > highest_packet_id )

         highest_packet_id = packet_id;

 

   if ( start_time[packet_id] == 0 ) 

        start_time[packet_id] = time;

 printf("\n Pkt Id : %f \t\t StartTime : %f\n", packet_id, start_time[packet_id]);

   if (action != "d" ) {

      if ( action == "r" ) {

         end_time[packet_id] = time;
printf("\t \t \t Pkt Id : %f  \t\t EndTime : %f\n", packet_id, end_time[packet_id]);
      }

   } else {

      end_time[packet_id] = -1;
printf("\t \t \t Pkt Id : %f \t\t EndTime : %f\n", packet_id, end_time[packet_id]);
   }

}                                                       

END {

    for ( packet_id = 0; packet_id <= highest_packet_id; packet_id++ ) {

       start = start_time[packet_id];

       end = end_time[packet_id];

       packet_duration = end - start;

 

       if ( start < end ) printf("\nStart : %f \t \t Pkt Duration: %f\n\n\n", start, packet_duration);

   }

}

