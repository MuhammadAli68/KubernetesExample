# KubernetesExample
This repo demonstrates deploying apps on a local cluster created using minikube
Note that this will require you to first install minikube.
Also make sure that docker client is running.

# Process
+ First you need to clone the repo.
+ After cloning. open a terminal in the same folder where you cloned the repo.
+ In the terminal, run the following command to start a local cluster:
  - <code><pre>
    '''
    minikube start
    '''
  </pre></code>
  - # Output
    - ![image](https://github.com/MuhammadAli68/KubernetesExample/assets/57432644/7a1380db-a78f-4c50-93d0-99c4ef025523)
  - If a context related warning appears you can ignore it as it will not hinder with the kubernetes deployment.
+ Next, run the following commands, in turn, to deploy your apps:
  - <code><pre>
    '''
    kubectl apply -f deployment1.yaml
    kubectl apply -f deployment2.yaml
    kubectl apply -f deployment3.yaml
    '''
  </pre></code>
+ Each of these commands will create a deployment including a pod and attach a service to their corresponing pods.
+ You can check the deployments using the following command:
  - <code><pre>
    '''
    kubectl get deployments
    '''
  </pre></code>
  - # Ouput:
    - ![image](https://github.com/MuhammadAli68/KubernetesExample/assets/57432644/11e1eb3c-a212-4f16-8ae9-12342d5b7315)
+ You can check the pods using the following command:
  - <code><pre>
    '''
    kubectl get pods
    '''
  </pre></code>
  - # Output:
    - ![image](https://github.com/MuhammadAli68/KubernetesExample/assets/57432644/1ca70bdd-20e5-4a72-8c77-f38c5cd9072d)
+ You can view the services using the following command:
  - <code><pre>
    '''
    kubectl get svc
    '''
  </pre></code>
  - # Output:
    - ![image](https://github.com/MuhammadAli68/KubernetesExample/assets/57432644/7433cf7c-e7ba-4f38-9eee-b7e5a30caf2a)
+ Notice that three different types of services were created namely 'service-nodeport', 'service-clusterip' and 'service-loadbalancer'.
+ To access 'service-nodeport' use the command:
    - <code><pre>
    '''
    minikube service service-nodeport
    '''
  </pre></code> 
  - # Output:
    - ![image](https://github.com/MuhammadAli68/KubernetesExample/assets/57432644/577fb5cd-6e49-4ba1-bc13-b4ef7d4ed69b)
    - ![image](https://github.com/MuhammadAli68/KubernetesExample/assets/57432644/615d2e0a-ed42-4590-a98b-3ce13e26a39a)
+ Similarly, to access 'service-loadbalancer' use the command:
  - <code><pre>
    '''
    minikube service service-loadbalancer
    '''
  </pre></code>  
  - # Output:
    - ![image](https://github.com/MuhammadAli68/KubernetesExample/assets/57432644/915876bb-67d3-43ca-8537-071feaed1fad)
    - ![image](https://github.com/MuhammadAli68/KubernetesExample/assets/57432644/7494c0b2-31aa-4e6b-8b72-a6389e059e5b)
+ Lastly, to access 'service-clusterip' use the command:
  - <code><pre>
    '''
    minikube service service-clusterip
    '''
  </pre></code>  
  - # Output:
    - ![image](https://github.com/MuhammadAli68/KubernetesExample/assets/57432644/cb7a35cc-9b12-4d6c-9a59-d75223645683)
    - ![image](https://github.com/MuhammadAli68/KubernetesExample/assets/57432644/2a4b03ca-d1b3-4092-8415-12e1fac4a05d)
+ You will notice that you are able to open the app using the service of type ClusterIP in the browser even though ClusterIP only makes your app within the cluster.
+ This is because minikube automatically handles the port forwarding and networking configurations for us to be able to acces the app externally.
+ In production scenarios, this should not be possible. Therefore it is advised to use services of type "NodePort" or "LoadBalancer" if we want to access our app externally.
+ You will also notice that every time you access a service, it opens on port like 5xxxx or 6xxxx and not the nodePort mentioned inside deployment.yaml.
+ This behavior is due to minukube dynamically mapping a node's port to a port on your local machine.

