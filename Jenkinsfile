pipeline {
    agent any 
    
     environment {
                WORKSPACE=pwd()
                ETAG=''
                KOPS_STATE_STORE="s3://valuesource-kubernetes"
                CLUSTER_NAME="value-source-cloud.com"

    }
    stages {
        stage('Build'){
            steps{
                sh 'echo This build machine or docker container needs Kubectl, Kops, and aws cli installed.'
                sh 'echo This build machine has to have ssh keys generated using ssh-keygen -t rsa .'
                sh 'echo building...'
                git url: 'https://github.com/dancurrotto/dotnet-core-simple.git'
            }
        }
        stage('Deploy') {
            steps {
                
                sh 'echo $WORKSPACE'
                sh 'echo $AWS_ACCESS_KEY_ID'
              
                sh 'echo $PATH'            

                sh 'echo Tell kops where to find its config and state.'
                sh 'export KOPS_STATE_STORE=s3://valuesource-kubernetes'


                // Call the manageClusterWithKops script.
                sh 'chmod +x ./manageClusterWithKops.sh'

                sh './manageClusterWithKops.sh $AWS_ACCESS_KEY_ID $AWS_SECRET_ACCESS_KEY' 
               
                sh 'echo Continuing...'   
               
                // sh 'kubectl run my-nginx --image=nginx --replicas=1 --port=80'
                
                // sh 'kubectl expose deployment my-nginx --port=80 --type=LoadBalancer'
                
                // sh 'kubectl get service -o wide'
                
            }
            
        }
    }
}