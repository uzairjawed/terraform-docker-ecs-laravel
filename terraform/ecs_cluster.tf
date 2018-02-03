resource "aws_ecs_cluster" "ecs-cluster" {
    name = "${var.ecs_cluster_name}"
}

data "aws_ecs_cluster" "ecs-cluster" {
  cluster_name = "${aws_ecs_cluster.ecs-cluster.name}"
}
