* * * * * <shell command>   # execute cron job every minute
0 1 * * * <shell command>   # execute cron job every day at 1 a.m.
* * 1 * * <shell command>   # execute every minute in January
* * * * 6 <shell command>   # execute every minute on every saturday
0 1/15 * jan,jun mon,fri <command> # execute at every 1 a.m. and 3
                                     p.m. every monday and friday on
                                     january and june



#!/bin/bash

export AWS_PROFILE=Aslan

read -p "Enter region: " region
read -p "Enter instance type: " instancetype
read -p "Enter pem file name: " pem

aws ec2 describe-images --region $region --owners amazon --filters "Name=architecture,Values=x86_64" --filters "Name=owner-alias,Values=amazon" --filters "Name=virtualization-type,Values=hvm" --filters "Name=name,Values=amzn2-ami-kernel-5.10*" --query "sort_by(Images, &CreationDate)[-1].[ImageId]" --output text

# ami=ami-05fa00d4c63e32376

# secgrpid=sg-083e4216752a2d72

read -p "Enter ami: " ami
# read -p "Enter security group id: " secgrpid
# read -p "Enter subnet id: " subnetid

aws ec2 run-instances --image-id $ami --count 1 --instance-type $instancetype --key-name $pem

# --subnet-id $subnetid

# aws ec2 create-tags --resources i-5203422c --tags Key=Name,Value=MyInstance

# aws ec2 describe-instances --filters "Name=tag-value,Values=ansible-postgreSQL" --filters "Name=instance-state-name,Values=running" --query Reservations[*].Instances[*].[InstanceId] --output text

# aws ec2 wait instance-status-ok --instance-ids $id

# aws ec2 terminate-instances --instance-ids $id

# aws describe-instances --query "Reservations[*].Instances[*].PublicIpAddress" --output text

# ssh -i $pem ec2-user@publicip

# sed -i -e 's/\r$//' create-ec2.sh





#Create a script. Ask user to enter a file name to create.
#If there is a file with the same name, print the message "The file already exists."
#If not, create the file and print the message "The file is created."


#!/bin/bash
read -p "Enter a file name: " file_name

if [[ -z "$(ls | grep $file_name)" ]]; then
        touch $file_name        echo "The file is created."else        echo "The file already exists."
fi



read -p "Enter a file name: " file_name

if [[ "$(ls | grep $file_name)" = "$file_name" ]]; then
        echo "The file already exists."
else
        touch $file_name
        echo "The file is created."
fi


read -p "Enter a file name: " name

if [[ -e $name ]]; then
        echo "The file already exists."
else
        touch $name
        echo "The file is created."
fi



