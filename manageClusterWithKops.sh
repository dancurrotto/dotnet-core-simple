#!/bin/sh
echo "****************************"
echo "****************************"
echo "Managing clusters with Kops"
echo "****************************"
echo "****************************"

# Define variables
AWS_ACCESS_KEY_ID=$1
AWS_SECRET_ACCESS_KEY=$2
REGION="us-east-2"
OUTPUT="json"


ValidateCluster()
{
    kops validate cluster --name value-source-cloud.com --state s3://valuesource-kubernetes
}


if [ -z $AWS_ACCESS_KEY_ID ]
then
    echo "Please pass the AWS_ACCESS_KEY_ID."
    exit 2
elif [ -z $AWS_SECRET_ACCESS_KEY ]
then
    echo "Please pass the AWS_SECRET_ACCESS_KEY."
    exit 2
fi

echo Configuring AWS...
aws configure set aws_access_key_id $AWS_ACCESS_KEY_ID
aws configure set aws_secret_access_key $AWS_SECRET_ACCESS_KEY
aws configure set region $REGION
aws configure set output $OUTPUT

export KOPS_STATE_STORE=s3://valuesource-kubernetes

ValidateCluster

RETURN_VALUE=$? 

echo "RETURN_VALUE is: $RETURN_VALUE"

if [ $RETURN_VALUE -eq 1 ]
then    
    echo "****************************"
    echo "****************************"
    echo "creating the cluster..."
    echo "This is the original creation of a non-existing cluster.  Re-run pipeline after cluster is created."
    echo "Use kops validate cluster --name value-source-cloud.com --state s3://valuesource-kubernetes to validate."
    kops create cluster --name value-source-cloud.com --state s3://valuesource-kubernetes --zones us-east-2a --node-count=1 --yes
elif [ $RETURN_VALUE -eq 0 ]
then
    echo "****************************"
    echo "****************************"
    echo "The cluster already exists.  Let's apply kubectl..."

    echo "running kubectl apply..."
    kubectl get
    kubectl get service dotnet-core-simple
    kubectl apply -f src/dotnet-core-simple-web-ui/kubernetes/dotnet-core-simple.yml
fi

echo $RETURN_VALUE

return 0
                