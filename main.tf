# Role para maquinas ingresso
resource "aws_iam_role" "this" {
  name = var.name

  assume_role_policy = <<EOF
{
  "Version": "2012-10-17",
  "Statement": [
    {
      "Action": "sts:AssumeRole",
      "Principal": {
        "Service": "ec2.amazonaws.com"
      },
      "Effect": "Allow",
      "Sid": ""
    }
  ]
}
EOF


  tags = var.tags
}

# Instance Profile Maquinas Ingresso
resource "aws_iam_instance_profile" "this" {
  name = var.name
  role = aws_iam_role.this.name
}

resource "aws_iam_role_policy_attachment" "rolle-attach" {
  count      = var.policy_count
  role       = aws_iam_role.this.name
  policy_arn = element(var.policies, count.index)
}

