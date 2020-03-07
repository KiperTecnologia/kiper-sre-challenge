resource "aws_ecs_cluster" "graphql" {
  name = "graphql"
}

resource "aws_ecs_service" "graphql" {
  name            = "graphql"
  cluster         = "${aws_ecs_cluster.graphql.id}"
  task_definition = "${aws_ecs_task_definition.mongo.arn}"
  desired_count   = 1
  iam_role        = "${aws_iam_role.foo.arn}"
  depends_on      = ["aws_iam_role_policy.foo"]

  ordered_placement_strategy {
    type  = "binpack"
    field = "cpu"
  }

  load_balancer {
    target_group_arn = "${aws_lb_target_group.foo.arn}"
    container_name   = "graphql"
    container_port   = 80
  }

  placement_constraints {
    type       = "memberOf"
    expression = "attribute:ecs.availability-zone in [us-west-2a, us-west-2b]"
  }
}
