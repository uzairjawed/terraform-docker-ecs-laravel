resource "aws_instance" "ecs-instance" {
  ami                  = "${var.ecs_image_id}"
  instance_type        = "${var.instance_type}"
  security_groups      = ["${aws_security_group.ecs-security-group.name}"]

  iam_instance_profile = "${aws_iam_instance_profile.ecs-instance-profile.name}"
  user_data            = "${data.template_file.ecs-user-data.rendered}" 

  tags {
    Name = "Uzair-ECS"
  }
}

data "template_file" "ecs-user-data" {
    template = "${file("${path.module}/user-data.tpl")}"

    vars {
        ecs-cluster-name = "${var.ecs_cluster_name}"
    }
}