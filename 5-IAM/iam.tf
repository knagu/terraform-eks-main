########## IAM USERS ###########
################################
resource "aws_iam_user" "vpc" {
  name = "vpc-user"
  path = "/terraform/"
}

resource "aws_iam_access_key" "vpc_access_key" {
  user = aws_iam_user.vpc.name
}

resource "aws_iam_user_policy" "vpc_user_policy" {
  name = "vpc-user-policy"
  user = aws_iam_user.vpc.name

  policy = <<EOF
{
    "Version": "2012-10-17",
    "Statement": [
        {
            "Effect": "Allow",
            "Action": "ec2:*",
            "Resource": "*"
        }
    ]
}
EOF
}