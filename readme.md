# Terraform, ECS and PHP API

## Introduction
The purpose of this example is to develop & deploy a small REST-based API using PHP, NGINX and AWS. These 2 services are built on a completely separate custom Docker images and then packaged up into multiple containers. The API itself is built on Lumen (a small micro framework built on Laravel) which gets packed up into the containers. Once these images are built, they are pushed to AWS Elastic Container Registry and then pulled and run as a Service inside an ECS cluster. Terraform is being used to build and deploy these resources into AWS.

## Requirements
- Terraform ([How to install](https://www.terraform.io/intro/getting-started/install.html))
- Docker ([How to install](https://docs.docker.com/engine/installation/))
- AWS ([How to setup](https://aws.amazon.com/))


## Usage
Please modify the variables in ```input.tf``` to suit your need.
```
$ cd terraform/
$ terrform init
$ terraform plan
$ terraform apply
 ```

## How to test
- Once the execution of ```terraform apply``` is finished, it will the output the ```API_URL``` variable. Please replace it below to test.

```
$ curl --header "Accept: application/json" API_URL:5000/api/v1/countries?name=Spain
$ curl --header "Accept: application/json" API_URL:5000/api/v1/countries?name=UK
```

## Points to mention
- This will only deploy a single instance to run the containers and it’s not utilizing advanced features of ECS such as load balancers, auto scaling etc 
- This example will assume that you have default VPC in your AWS account.
- It takes few mins to complete the terraform execution because it’s also pushing the docker images to ECR before linking up with the ECS Cluster.
- Once everything is deployed and terraform execution is completed, it takes couple of mins to place a running task on ECS cluster.
