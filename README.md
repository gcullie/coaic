# coaic
**COAIC files**

training-setup.sh : This will setup a Ubuntu 16.04 server envionment. </br>
coaic-workers.sh  : Creates the Workers script to cut and paste into the command line </br>
coaic-universe-creation.sh : Creates the Remotes Environments for Works To Romote into </br>

**Other helpful commands:**

**Google Cloud**
machine:
~~~
n1-highcpu-8
Ubutu 16.04 w/ 20gigs
(optional) turn on **Preemptibility**
~~~

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
sudo usermod -aG docker $USER
newgrp docker

python
import tensorflow
exit()
~~~

Runs a training instance locally
~~~
cd ..
cd ubutu
sudo python train.py --env-id flashgames.NeonRace-v0 --log-dir ~/NeonRace-v0 -w 2 --visualise
~~~

Point to a competition Gym
~~~
CUDA_VISIBLE_DEVICES= /usr/bin/python worker.py --log-dir /home/ubuntu/neorace --env-id flashgames.NeonRace-v0 --num-workers 1 --visualise --job-name worker --task 0 --remotes vnc://35.188.180.197:5900+15900
~~~

**AWS**
machine
~~~
Deep Learning Base AMI (Ubuntu) (ami-f346c289)
p3.2xlarge
(optional) spot instance
Firewall TCP rules: tcp:5900-5950;tcp:15900-16000
~~~

~~~
cut and paste each row from the script training-setup-aws.sh (the script does not yet work as stand alone)
test with python 'import tensorflow'
git clone https://github.com/openai/universe-starter-agent.git
python3 train.py --env-id flashgames.NeonRace-v0 --log-dir ~/NeonRace-v0 -w 2 --visualise
~~~

**Tools**
TMUX
CV2 (OpenCV)

**Where to go from here**
~~~
get familiar with the starter agent code.
try running against other games to see what preforms well and where there are limitations.
take a look at https://github.com/openai/baselines/tree/master/baselines for different algorithm ideas.
instead of a digital game, modify the vnc window to manipulate something in read life!
have fun!
~~~


