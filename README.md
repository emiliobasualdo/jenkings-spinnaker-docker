# jenkings-docker

# requisitos
- kubernetes cluster
- load balancer o ingress para entrar el cluster

# setup
1. instalar con helm : https://github.com/helm/charts/tree/master/stable/jenkins
$ helm install --name my-release stable/jenkins

2. correr el ingress editando el hos
$ kubectl apply -f ingress.yml

3. setear el DNS para que derive el host del ingress al load balancer.(DigitalOcean control panel)

4. done

# post instalación aparece esto
NOTES:
1. Get your 'admin' user password by running:
  printf $(kubectl get secret --namespace default jenkings-stable-jenkins -o jsonpath="{.data.jenkins-admin-password}" | base64 --decode);echo
2. Get the Jenkins URL to visit by running these commands in the same shell:
  export POD_NAME=$(kubectl get pods --namespace default -l "app.kubernetes.io/component=jenkins-master" -l "app.kubernetes.io/instance=jenkings-stable" -o jsonpath="{.items[0].metadata.name}")
  echo http://127.0.0.1:8080
  kubectl --namespace default port-forward $POD_NAME 8080:8080

3. Login with the password from step 1 and the username: admin:drgwOv3Y7P
