resource "aws_security_group" "ecs-security-group" {
    name        = "Uzair-ECS-Security-Group"

/*
HTTP - This would enable the container host port.
*/
    ingress {
        from_port = "${var.host_port}"
        to_port = "${var.host_port}"
        protocol = "tcp"
        cidr_blocks = ["0.0.0.0/0"]
    }

    egress {
        from_port = 0
        to_port = 0
        protocol = "-1"
        cidr_blocks = ["0.0.0.0/0"]
    }
}
