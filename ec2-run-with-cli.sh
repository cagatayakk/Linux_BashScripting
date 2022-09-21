#!/bin/bash

export AWS_PROFILE=cagatay

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









