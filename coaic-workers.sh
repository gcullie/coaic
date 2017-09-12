#!/bin/bash
#scp -i "coaic-keys.pem" ~/git/coaic/worker-setup.sh ubuntu@ec2-52-55-218-56.compute-1.amazonaws.com:~
#Don't forget to chmod u+x coaic-workers.sh
#Don't forget to to modify the SERVER URL
echo "[Number of workers] [Name of Game] [server url] [model directory]"

NUMBEROFWORKERS=$1
NUMBEROFREMOTES=$1

i="0"
GAME=$2
TRAINDIRECTORY=$4
TRAINFILE="~/universe-starter-agent/train.py"
SERVER="vnc://$REMOTEURL"
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

COMMAND="CUDA_VISIBLE_DEVICES= /usr/bin/python worker.py --log-dir /home/ubuntu/neorace --env-id $GAME --num-worke$
echo $COMMAND"
COMMAND="python train.py --env-id $GAME --log-dir ~/$GAME -r $SERVERLIST -w $NUMBEROFREMOTES --visualise"
echo $COMMAND

