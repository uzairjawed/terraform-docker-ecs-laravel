variable "aws_access_key" {
    description = "Your AWS Access key"
}

variable "aws_secret_key" {
    description = "Your AWS Secret key"
}

variable "aws_region" {
    default = "eu-west-2"
    description = "Default region where the resources will be deployed"
}

variable "instance_type" {
    default = "t2.micro"
    description = "Instance type to use for the container"
}

variable "ecs_cluster_name" {
    default = "uzair-cluster"
}

variable "ecs_image_id" {
    default = "ami-67cbd003"
    description = "ECS optimized AMI - This is linked with the specific region"
}

variable "host_port" {
	default = 5000
	description = "HTTP port for the container host"
}
