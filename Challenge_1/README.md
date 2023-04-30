# Terraform-Challenges-KodeKloud
## Challenge 1
In this challenge we will deploy several Kubernetes resources using terraform.
Utilize /root/terraform_challenge directory to store your Terraform configuration files.

Inspect the requirements in detail by clicking on the icons of the interactive architecture diagram on the right and complete the tasks. Once done click on the Check button to validate your work.

![Screenshot from 2023-04-30 17-30-00](https://user-images.githubusercontent.com/46055709/235359631-f177a3d6-14a2-46b7-b96b-e62bfe59b42d.png)

### terraform && provuder

* Configure terraform and provider settings within provider.tf file with following specifications:
* Configure terraform to use hashicorp/kubernetes provider.
* Specify the provider's local name: kubernetes
* Provider version: 2.11.0
* Configure kubernetes provider with path to your kubeconfig file: /root/.kube/config

### kubernetes_deployment

* Deployment Name: frontend
* Deployment Labels = name: frontend
* Replicas: 4
* Pod Labels = name: webapp
* Image: kodekloud/webapp-color:v1
* Container name: simple-webapp
* Container port: 8080

### kubernetes_service

* Service name: webapp-service
* Service Type: NodePort
* Port: 8080
* NodePort: 30080
