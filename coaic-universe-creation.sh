#!/bin/bash
#scp -i "coaic-keys.pem" ~/git/coaic/coaic-universe-creation.sh ubuntu@ec2-52-55-218-56.compute-1.amazonaws.com:~
#Don't forget to chmod u+x coaic-universe-creation.sh
NUMBEROFWORKERS="30"

i="0"

tmux kill-session -t universes
tmux new-session -s universes -n w-$i -d sh
tmux send-keys -t universes:w-$i "sudo docker run --privileged --cap-add=SYS_ADMIN --ipc=host -p 590$i:5900 -p 1590$i:15900 quay.io/openai/universe.flashgames" Enter

while [ $i -lt $NUMBEROFWORKERS ]
do
	i=$[$i+1]
	tmux new-window -t universes -n w-$i sh
	if [ $i -lt 10 ]; then
                tmux send-keys -t universes:w-$i "sudo docker run --privileged --cap-add=SYS_ADMIN --ipc=host -p 590$i:5900 -p 1590$i:15900 quay.io/openai/universe.flashgames" Enter
                echo "sudo docker run --privileged --cap-add=SYS_ADMIN --ipc=host -p 590$i:5900 -p 1590$i:15900 quay.io/openai/universe.flashgames"
            else
                tmux send-keys -t universes:w-$i "sudo docker run --privileged --cap-add=SYS_ADMIN --ipc=host -p 59$i:5900 -p 159$i:15900 quay.io/openai/universe.flashgames" Enter
                echo "sudo docker run --privileged --cap-add=SYS_ADMIN --ipc=host -p 59$i:5900 -p 159$i:15900 quay.io/openai/universe.flashgames"
            fi
done
tmux new-window -t universes -n htop bash
tmux send-keys -t universes:htop htop Enter

echo "Use tmux attach -t universes to watch process output"
echo "Use tmux kill-session -t universes to kill the job"