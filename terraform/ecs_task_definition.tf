data "template_file" "uzair_task_definition_template" {
  template = "${file("${path.module}/task_definition.json")}"

  vars {
    php_image_url        = "${aws_ecr_repository.php.repository_url}"
    nginx_image_url      = "${aws_ecr_repository.nginx.repository_url}"
    host_port            = "${var.host_port}"  
  }
}

resource "aws_ecs_task_definition" "uzair_task_definition" {
  family                = "uzair-task"
  container_definitions = "${data.template_file.uzair_task_definition_template.rendered}"
}
