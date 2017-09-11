#!/bin/bash
#scp -i "coaic-keys.pem" ~/git/coaic/worker-setup.sh ubuntu@ec2-52-55-218-56.compute-1.amazonaws.com:~
#Don't forget to chmod u+x coaic-workers.sh
#Don't forget to to modify the SERVER URL

NUMBEROFWORKERS="10"
NUMBEROFREMOTES="10"
i="0"
GAME="flashgames.NeonRace-v0"
TRAINDIRECTORY="~/neorace"
TRAINFILE="~/universe-starter-agent/train.py"
SERVER="vnc://ec2-34-205-64-193.compute-1.amazonaws.com"
SERVERLIST=""

#there has to be at least 1
SERVERLIST=$SERVER":590$i+1590$i"
i=$[$i+1]
while [ $i -lt $NUMBEROFREMOTES ]
do
	i=$[$i+1]
	if [ $i -lt 9 ]; then
                SERVERLIST=$SERVERLIST","$SERVER":590$i+1590$i"

            else
                SERVERLIST=$SERVERLIST","$SERVER":59$i+159$i"
            fi

done

COMMAND="CUDA_VISIBLE_DEVICES= /usr/bin/python worker.py --log-dir /home/ubuntu/neorace --env-id flashgames.NeonRace-v0 --num-workers 30 --visualise --job-name worker --task 0 --remotes vnc://ec2-34-205-64-193.compute-1.amazonaws.com:5901+15901"
echo $COMMAND

