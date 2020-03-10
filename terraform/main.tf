resource "aws_ecs_cluster" "graphql" {
  name = "graphql"
  capacity_providers = [ "FARGATE" ]
}

resource "aws_ecs_service" "graphql" {
  name            = "graphql"
  cluster         = aws_ecs_cluster.graphql.id
  desired_count   = 1
  launch_type     = "FARGATE"
  task_definition = aws_ecs_task_definition.graphql.arn
  network_configuration {
    security_groups  = [aws_security_group.ecs_tasks.id]
    subnets          = aws_subnet.private.*.id
    assign_public_ip = true
  }
  load_balancer {
    target_group_arn = aws_alb_target_group.graphql.id
    container_name   = "graphql"
    container_port   = 80
  }
}

resource "aws_ecs_task_definition" "graphql" {
  family                = "graphql"
  container_definitions = file("init_definition.json")
  requires_compatibilities = [ "FARGATE" ]
  network_mode = "awsvpc"
  execution_role_arn       = aws_iam_role.graphql.arn
  cpu = 1024
  memory = 2048
}
