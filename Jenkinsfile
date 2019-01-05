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


                 // This is the statement that created the cluster.
                // sh 'kops create cluster $NAME --zones us-east-2a --node-count 1 --node-size m4.large --kubernetes-version v1.6.6 --master-size m4.large --dry-run -o yaml > $NAME.yaml'
                //*********************************************************************

                // NOTE: IF YOU WANT TO MANAGE WITH KOPS MANIFEST, PUT THIS BACK IN SCRIPT
                /*
                if [ $RETURN_VALUE -eq 1 ]
                then    
                    echo "****************************"
                    echo "****************************"
                    echo "creating the cluster..."
                    echo "This is the original creation of a non-existing cluster.  Re-run pipeline after cluster is created."
                    kops create -f $CLUSTER_NAME.yaml --state $KOPS_STATE_STORE
                    kops create secret --name value-source-cloud.com sshpublickey admin -i ~/.ssh/id_rsa.pub
                    kops update cluster $CLUSTER_NAME --state $KOPS_STATE_STORE --yes
                elif [ $RETURN_VALUE -eq 0 ]
                then
                    echo "****************************"
                    echo "****************************"
                    echo "updating the cluster..."
                    kops create secret --name value-source-cloud.com sshpublickey admin -i ~/.ssh/id_rsa.pub
                    kops replace -f $CLUSTER_NAME.yaml
                    kops update cluster $CLUSTER_NAME --state $KOPS_STATE_STORE --yes
                    kops rolling-update cluster $CLUSTER_NAME --yes

                    echo "running kubectl apply..."
                    kubectl apply -f src/dotnet-core-simple-web-ui/kubernetes/dotnet-core-simple.yml
                fi
                */

               
                // sh 'kubectl run my-nginx --image=nginx --replicas=1 --port=80'
                
                // sh 'kubectl expose deployment my-nginx --port=80 --type=LoadBalancer'
                
                // sh 'kubectl get service -o wide'
                
            }
            
        }
    }
}