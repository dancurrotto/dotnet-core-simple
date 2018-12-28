pipeline {

    agent {
        agent any // dockerfile true
    }     

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

                

                sh 'echo Tell kops where to find its config and state.'

                sh 'export KOPS_STATE_STORE=s3://valuesource-kubernetes'

                

                sh 'echo Configuring AWS...'

                sh '~/.local/bin/aws configure set aws_access_key_id $AWS_ACCESS_KEY_ID'

                sh '~/.local/bin/aws configure set aws_secret_access_key $AWS_SECRET_ACCESS_KEY'

                sh '~/.local/bin/aws configure set region us-east-2'

                sh '~/.local/bin/aws configure set output json'                 

                

                // sh 'kubectl apply -f deployment.yaml'

               

                // sh 'kubectl run my-nginx --image=nginx --replicas=1 --port=80'

                

                // sh 'kubectl expose deployment my-nginx --port=80 --type=LoadBalancer'

                

                // sh 'kubectl get service -o wide'

                

            }

            

        }

    }

}