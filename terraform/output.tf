output "API_HOST" {
  value = "http://${aws_instance.ecs-instance.public_ip}:${var.host_port}"
}