sudo amazon-linux-extras install epel -y
sudo yum install -y stress
stress --cpu 90 --timeout 20000   



# for Container
# kubectl run -it --rm load-generator --image=busybox /bin/sh  
# -> while true; do wget -q -O- http://<puplic ip>:<port number of NordePord-service>; done 
