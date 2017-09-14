# coaic
**##COAIC files**

training-setup.sh : This will setup a Ubuntu 16.04 server envionment. </br>
coaic-workers.sh  : Creates the Workers script to cut and paste into the command line </br>
coaic-universe-creation.sh : Creates the Remotes Environments for Works To Romote into </br>

**##Other helpful commands:**
~~~
#!/bin/bash
cd /home/ubuntu
git clone https://github.com/gcullie/coaic.git
cd coaic
chmod u+x training-setup.sh
yes Y | sudo ./training-setup.sh /home/ubuntu
~~~

Runs a training instance locally
~~~
sudo python train.py --env-id flashgames.NeonRace-v0 --log-dir ~/NeonRace-v0 -w 2 --visualise
~~~






