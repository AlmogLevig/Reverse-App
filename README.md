# Reverse-App
Deploy Python application With K8s,Ansible and Terraform


## instruction 
Instructions to deploy K8s on AWS EC2 using Terraform and Ansible:

1) Terraforn initialize:
   `> terraform init

2) Running Terraform:
   `> terraform apply --auto-approve -var region=$REGION -var key_name=$KEY_N`

3) when finish use instances, Destroying ec2 intances with command below:
   `> terraform destory --auto-approve -var region=$REGION -var key_name=$KEY_N`

Requirment:
  1) Ansible
  2) Terraform
  3) Amazon Account
  4) Private-Key (Should be located in Terraform folder)

Configure environment:
  `> export AWS_ACCESS_KEY_ID='********************************'`
  `> export AWS_SECRET_ACCESS_KEY='**************************************'`
  `> export KEY_N="appKey"`
  `> export REGION="eu-central-1"`

## Components

### K8s
  * Load Balancer Service
  * Ingress nginx - use for routing to `/reverse`
  * Deployment Application (3 replicas)

### Ansible
  * main.yml
  * inventory.yml -> Dynamic Inventory, Create after using command `terraform apply`
  
### Terraform
  * main.tf
  * providers.tf
  * outputs.tf
  * security_group.tf
    * ingress ports: 22, 80, K8s ports
  * variable.tf 
  * inventory.tmpl -> The dynamic inventory file will be generated from the Terraform output and located in Ansible folder
  * terraform.tfvars (template file)
    * AWS Credentials (secret_key, access_key)

### Python
  * main.py
    * flask
    * utils  
  * utils.py
    * converting Query to Json function
  * Dockerfile
  * wsgi.py (aplling via Gunicorn)
