# ECS task execution role data
data "aws_iam_policy_document" "graphql" {
  version = "2012-10-17"
  statement {
    sid = ""
    effect = "Allow"
    actions = ["sts:AssumeRole"]

    principals {
      type        = "Service"
      identifiers = ["ecs-tasks.amazonaws.com"]
    }
  }
}

# ECS task execution role
resource "aws_iam_role" "graphql" {
  name               = "graphql"
  assume_role_policy = data.aws_iam_policy_document.graphql.json
}

# ECS task execution role policy attachment
resource "aws_iam_role_policy_attachment" "graphql" {
  role       = aws_iam_role.graphql.name
  policy_arn = "arn:aws:iam::aws:policy/service-role/AmazonECSTaskExecutionRolePolicy"
}
