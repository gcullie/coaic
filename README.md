# coaic

## COAIC Open AI Neural-MMO Installation

**Setup Option 1**
~~~
follow the setup instruction on https://github.com/openai/neural-mmo
~~~

**Setup Option 2 (Docker Locally)**
~~~
1) install docker on your computer - https://docs.docker.com/install/
2) docker pull gcullie/openai-neural-mmo:master
3) docker run -d -p 8080:8080 gcullie/openai-neural-mmo:master tail -f /dev/null
4) docker ps    (get the id of the running image)
5) docker exec -i -t \<id\> /bin/bash
6) http://localhost:8080/forge/embyr/
7) docker stop \<id\>
Docker installation https://github.com/gcullie/openai-neural-mmo-docker


~~~

**Setup Option 3 (Docker Remotely - Recommended)**
~~~
1) create VM on Google Cloud (4 cores and 100 gigs ubuntu 18.04)
2) expose ports 80,8080
3) install Docker - https://docs.docker.com/install/
4) get the ip of the VM and change the file **neural-mmo-client/comms.js** to the ip address
5) start step 3 from above and change the url in step 6 to you ip address.
~~~

**Running**
~~~
python Forge.py --render   (Runs in Realm 1)
python Forge.py --nRealm 2 --api native --render  (Runs in Relm 2 and renders UI)
python Forge.py --nRealm 2 --api vecenv           (Runs in Relm 2 with gym (not recommended) no UI rendering)
~~~

**Other helpful commands**
~~~
sudo usermod -aG docker $USER
newgrp docker

python
import tensorflow
exit()
~~~

**Tools**
~~~
TMUX
Torch
Tensorflow
THREE
TMUX
HTOP
CV2 (OpenCV)
~~~

## Where to go from here

### Have a directory that survives docker restart

1) Create a directory on the machine that starts docker lets say workspace
~~~
mkdir ./workspace
~~~
2) map that workspace into your docker
~~~
docker run -d  --volume="$(pwd)/workspace:/root/workspace" -p 8080:8080 gcullie/openai-neural-mmo:master tail -f /dev/null
~~~

### Create a development workflow
1) docker locally for development
~~~
see Setup Option 2
~~~
2) map a *workspace* drive that is shared with your local docker instance
~~~
see Have a directory that survives docker restart
~~~
3) Modify the python on your computer in the *workspace directory
4) Test the code in your Docker
5) git commit your code
6) Now start your long term training environment
~~~
see Setup Option 3
~~~
7) git clone your code and start your training
8) make sure your trained model is not lost during a docker recycle (especially if you are using *preemptive*)







