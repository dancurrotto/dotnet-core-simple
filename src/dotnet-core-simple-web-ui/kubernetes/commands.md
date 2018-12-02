Build the image:
 docker build -t dotnet-core-simple .

Look at the images and copy the Image Id of the one tagged 'latest'
docker images

Tag the image using that Image Id and the next version:
docker tag 7caf46f93c9a dcurrotto/dotnet-core-simple:9

Push that image to Docker Hub
docker push dcurrotto/dotnet-core-simple:9

Delete the secret (assuming it's already there):
kubectl delete secret secret-appsettings

Create the secret:
kubectl create secret generic secret-appsettings --from-file=./configuration/Secrets/appsettings.secrets.json


Delete the configMap(assuming it's already there):
kubectl delete configmap config-map-appsettings

Create the configMap:
kubectl create configmap config-map-appsettings --from-file=./configuration/ConfigMaps/appsettings.configmaps.json

Apply the deployment:
kubectl apply -f kubernetes/dotnet-core-simple.yml

Take a look at the services and wait until you see the EXTERNAL-IP come up on the LoadBalancer service
kubectl get service --watch

Grab the external IP and pop it in the browser.  The app should come up and you should see your Secret and ClientId.

Grab the pod:
kubectl get pod

and:

ssh into a node using Kubectl to look around:
kubectl exec -it dotnet-core-simple-549cbb9855-lsldk -- /bin/bash

Now make changes to your values in your appsettings.configmaps.json and appsettings.secrets.json.
Run through again:  
    Delete the secret.
    Create the secret.
    Delete the configMap.
    Create the configMap.
    Increment the CONFIG_VERSION value by one in the dotnet-core-simple.yml file.  This will cause the 
    deployment to run and reload, updating the configMap and secret.
    Apply the deployment.
    You should see the updated values.
    