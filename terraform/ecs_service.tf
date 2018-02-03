resource "aws_ecs_service" "ecs-service" {
  	name            = "Uzair-Service"
  	cluster         = "${aws_ecs_cluster.ecs-cluster.id}"
  	task_definition = "${aws_ecs_task_definition.uzair_task_definition.arn}"
  	desired_count   = 1
}
