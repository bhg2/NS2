BEGIN {

seqno = -1;

start_time = 0;

}

{

action = $1;

time = $2;

node_id = $3;

layer = $4;

flags = $5;

seqno = $6;

type = $7;

size = $8;

a = $9;

b = $10;

c = $11;

d = $12;

energy = $14;

if(seqno < $6 && node_id == "_4_" && (action == "r" || action == "s")) {

seqno = $6;

remaining_energy = energy;

start_time = time;

printf("%f\t%f\n",start_time,remaining_energy);


}
}

END {

}
