pipeline {
    agent any 
    
     environment {
                WORKSPACE=pwd()
                ETAG=''
    }
    stages {
        stage('Build'){
            steps{
                sh 'echo This build machine or docker container needs Kubectl, Kops, and aws cli installed.'
                sh 'echo This build machine has to have ssh keys generated using ssh-keygen -t rsa .'
                sh 'echo building...'
                git url: 'https://github.com/dcurrotto/node-kubernetes-aws.git'
            }
        }
        stage('Deploy') {
            steps {
                
                sh 'echo $WORKSPACE'
                sh 'echo $AWS_ACCESS_KEY_ID'
              
                sh 'echo $PATH'   
            
                
               
                sh 'echo Configuring AWS...'
                sh 'aws configure set aws_access_key_id $AWS_ACCESS_KEY_ID'
                sh 'aws configure set aws_secret_access_key $AWS_SECRET_ACCESS_KEY'
                sh 'aws configure set region us-east-2'
                sh 'aws configure set output json'   

                // sh 'kops create secret --name value-source-cloud.com sshpublickey admin -i ~/.ssh/id_rsa.pub --state s3://valuesource-kubernetes'

                sh 'echo Tell kops where to find its config and state.'
                sh 'export KOPS_STATE_STORE=s3://valuesource-kubernetes'

                sh 'kops validate cluster --name value-source-cloud.com --state s3://valuesource-kubernetes > clusterFile'
                
                // sh 'kops create cluster --name value-source-cloud.com --state s3://valuesource-kubernetes --zones us-east-2a --node-count=1 --yes'

                
                // sh 'kubectl apply -f deployment.yaml'
               
                // sh 'kubectl run my-nginx --image=nginx --replicas=1 --port=80'
                
                // sh 'kubectl expose deployment my-nginx --port=80 --type=LoadBalancer'
                
                // sh 'kubectl get service -o wide'
                
            }
            
        }
    }
}