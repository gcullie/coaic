# coaic
**COAIC files**

training-setup.sh : This will setup a Ubuntu 16.04 server envionment. </br>
coaic-workers.sh  : Creates the Workers script to cut and paste into the command line </br>
coaic-universe-creation.sh : Creates the Remotes Environments for Works To Romote into </br>

**Other helpful commands:**

**Google Cloud**
Google Cloud Startup Script
~~~
#!/bin/bash
cd /home/ubuntu
git clone https://github.com/gcullie/coaic.git
cd coaic
chmod u+x training-setup.sh
yes Y | sudo ./training-setup.sh /home/ubuntu
~~~
Firewall TCP rules: tcp:5900-5950;tcp:15900-16000

Validate Script Completed
~~~
python
import tensorflow
exit()
~~~



Runs a training instance locally
~~~
git clone https://github.com/openai/universe-starter-agent.git
sudo python train.py --env-id flashgames.NeonRace-v0 --log-dir ~/NeonRace-v0 -w 2 --visualise
 or for python 3 for the aws script
python3 train.py --env-id flashgames.NeonRace-v0 --log-dir ~/NeonRace-v0 -w 2 --visualise
~~~


Point to a competition Gym
~~~
CUDA_VISIBLE_DEVICES= /usr/bin/python worker.py --log-dir /home/ubuntu/neorace --env-id flashgames.NeonRace-v0 --num-workers 1 --visualise --job-name worker --task 0 --remotes vnc://35.188.180.197:5900+15900
~~~


Tools
TMUX
CV2 (OpenCV)




