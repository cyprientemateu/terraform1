#!/bin/bash

echo "******************************************************"
echo "Deleting the tcc-eks-node-group module"
echo "******************************************************"
sleep 3
cd resources/tcc-eks-node-group
terraform init
terraform fmt
terraform destroy --auto-approve
cd -

echo "******************************************************"
echo "Deleting the tcc-eks-control-plane module"
echo "******************************************************"
sleep 3
cd resources/tcc-eks-control-plane
terraform init
terraform fmt
terraform destroy --auto-approve
cd -

echo "******************************************************"
echo "Deleting vpc module"
echo "******************************************************"
sleep 3
cd resources/vpc
terraform init 
terraform destroy --auto-approve
cd -

echo "******************************************************"
echo "Deleting s3 backeng module"
echo "******************************************************"
cd resources/s3-replication
terraform init
terraform destroy --auto-approve
cd -
