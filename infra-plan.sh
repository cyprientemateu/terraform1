#!/bin/bash

echo "******************************************************"
echo "Deploying s3 backeng module"
echo "******************************************************"
cd resources/s3-replication
terraform init
terraform fmt
terraform plan
cd -

echo "******************************************************"
echo "Deploying vpc module"
echo "******************************************************"
cd resources/vpc
terraform init
terraform fmt
terraform plan
cd -

echo "******************************************************"
echo "Deploying the tcc-eks-control-plane module"
echo "******************************************************"
sleep 3
cd resources/tcc-eks-control-plane
terraform init
terraform fmt
terraform plan 
cd -

echo "******************************************************"
echo "Deploying the tcc-eks-node-group module"
echo "******************************************************"
sleep 3
cd resources/tcc-eks-node-group
terraform init
terraform fmt
terraform plan 
cd -