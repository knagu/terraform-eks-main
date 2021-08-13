########## IAM USERS ###########
################################

########## VPC USER ###########
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
            "Action": [
                 "ec2:*",
                 "rds:CreateDBSubnetGroup",
                 "rds:AddTagsToResource",
                 "rds:DescribeDBSubnetGroups",
                 "rds:ListTagsForResource",
                 "rds:DeleteDBSubnetGroup"
                 ],
            "Resource": "*"
        }
    ]
}
EOF
}

########## SG USER ###########
################################

resource "aws_iam_user" "sg" {
  name = "sg-user"
  path = "/terraform/"
}

resource "aws_iam_access_key" "sg_access_key" {
  user = aws_iam_user.sg.name
}

resource "aws_iam_user_policy" "sg_user_policy" {
  name = "sg-user-policy"
  user = aws_iam_user.sg.name

  policy = <<EOF
{
    "Version": "2012-10-17",
    "Statement": [
        {
            "Effect": "Allow",
            "Action": [
        "ec2:AuthorizeSecurityGroupEgress",
        "ec2:AuthorizeSecurityGroupIngress",
        "ec2:CreateSecurityGroup",
        "ec2:DeleteSecurityGroup",
        "ec2:DescribeSecurityGroupReferences",
        "ec2:DescribeSecurityGroupRules",
        "ec2:DescribeSecurityGroups",
        "ec2:DescribeStaleSecurityGroups",
        "ec2:ModifySecurityGroupRules",
        "ec2:RevokeSecurityGroupEgress",
        "ec2:RevokeSecurityGroupIngress",
        "ec2:UpdateSecurityGroupRuleDescriptionsEgress",
        "ec2:UpdateSecurityGroupRuleDescriptionsIngress",
        "ec2:DescribeInstances",
        "ec2:DescribeNetworkInterfaces",
        "ec2:DescribeStaleSecurityGroups",
        "ec2:DescribeVpcClassicLink",
        "ec2:DescribeVpcClassicLinkDnsSupport"
      ],
            "Resource": "*"
        }
    ]
}
EOF
}

########## ECR USER ###########
################################

resource "aws_iam_user" "ecr" {
  name = "ecr-user"
  path = "/terraform/"
}

resource "aws_iam_access_key" "ecr_access_key" {
  user = aws_iam_user.ecr.name
}

resource "aws_iam_user_policy" "ecr_user_policy" {
  name = "ecr-user-policy"
  user = aws_iam_user.ecr.name

  policy = <<EOF
{
    "Version": "2012-10-17",
    "Statement": [
        {
            "Effect": "Allow",
            "Action": [
              "ecr:DescribeImages",
              "ecr:DescribeRepositories",
              "ecr:CreateRepository",
              "ecr:BatchGetImage",
              "ecr:BatchCheckLayerAvailability",
              "ecr:DeleteRepository",
              "ecr:CompleteLayerUpload",
              "ecr:GetDownloadUrlForLayer",
              "ecr:InitiateLayerUpload",
              "ecr:PutImage",
              "ecr:UploadLayerPart",
              "ecr:ListTagsForResource"
      ],
            "Resource": "*"
        }
    ]
}
EOF
}
###### CODEARTIFACT USER #######
################################

resource "aws_iam_user" "codeartifact" {
  name = "codeartifact-user"
  path = "/terraform/"
}

resource "aws_iam_access_key" "codeartifact_access_key" {
  user = aws_iam_user.codeartifact.name
}

resource "aws_iam_user_policy" "codeartifact_user_policy" {
  name = "ecr-user-policy"
  user = aws_iam_user.codeartifact.name

  policy = <<EOF
{
    "Version": "2012-10-17",
    "Statement": [
        {
            "Effect": "Allow",
            "Action": [
              "codeartifact:List*",
              "codeartifact:Describe*",
              "codeartifact:Get*",
              "codeartifact:Read*",
              "codeartifact:Create*",
              "codeartifact:Delete*",
              "kms:CreateKey",
              "kms:DescribeKey",
              "kms:GetKeyPolicy",
              "kms:GetKeyRotationStatus",
              "kms:ListResourceTags",
              "kms:ScheduleKeyDeletion",
              "codeartifact:AssociateExternalConnection",
              "codeartifact:AssociateWithDownstreamRepository",
              "kms:*"
      ],
            "Resource": "*"
        }
    ]
}
EOF
}

########## MSSQL USER ##########
################################
resource "aws_iam_user" "mssql" {
  name = "mssql-user"
  path = "/terraform/"
}

resource "aws_iam_access_key" "mssql_access_key" {
  user = aws_iam_user.mssql.name
}

resource "aws_iam_user_policy" "mssql_user_policy" {
  name = "mssql-user-policy"
  user = aws_iam_user.mssql.name

  policy = <<EOF
{
    "Version": "2012-10-17",
    "Statement": [
        {
            "Effect": "Allow",
            "Action": [
                 "rds:*",
                 "iam:CreateRole",
                 "iam:TagRole",
                 "iam:GetRole",
                 "iam:ListRolePolicies",
                 "iam:ListAttachedRolePolicies",
                 "iam:ListInstanceProfilesForRole",
                 "iam:DeleteRole",
                 "iam:AttachRolePolicy",
                 "iam:PassRole",
                 "iam:DetachRolePolicy"
                 ],
            "Resource": "*"
        }
    ]
}
EOF
}

########## EKS USER ##########
################################
resource "aws_iam_user" "eks" {
  name = "eks-user"
  path = "/terraform/"
}

resource "aws_iam_access_key" "eks_access_key" {
  user = aws_iam_user.eks.name
}

resource "aws_iam_user_policy" "eks_user_policy" {
  name = "mssql-user-policy"
  user = aws_iam_user.eks.name

  policy = <<EOF
{
    "Version": "2012-10-17",
    "Statement": [
        {
            "Effect": "Allow",
            "Action": [
                 "eks:*",
                 "ec2:*",
                 "iam:*",
                 "autoscaling:*",
                 "iam:CreatePolicy",
                 "iam:TagPolicy",
                 "iam:GetPolicy",
                 "iam:GetPolicyVersion",
                 "iam:ListPolicyVersion",
                 "iam:CreateRole",
                 "iam:ListPolicyVersions",
                 "iam:TagRole",
                 "iam:DeletePolicy",
                 "iam:GetRole",
                 "iam:ListRolePolicies",
                 "iam:ListAttachedRolePolicies",
                 "iam:ListInstanceProfilesForRole",
                 "iam:AttachRolePolicy",
                 "iam:PassRole",
                 "iam:DeleteRole"
                 ],
            "Resource": "*"
        }
    ]
}
EOF
}


###### ACM USER #######
########################

resource "aws_iam_user" "acm" {
  name = "acm-user"
  path = "/terraform/"
}

resource "aws_iam_access_key" "acm_access_key" {
  user = aws_iam_user.acm.name
}

resource "aws_iam_user_policy" "acm_user_policy" {
  name = "acm-user-policy"
  user = aws_iam_user.acm.name

  policy = <<EOF
{
    "Version": "2012-10-17",
    "Statement": [
        {
            "Effect": "Allow",
            "Action": [              
              "acm:*"
      ],
            "Resource": "*"
        }
    ]
}
EOF
}

###### UI USER #######
########################

resource "aws_iam_user" "ui" {
  name = "ui-user"
  path = "/terraform/"
}

resource "aws_iam_access_key" "ui_access_key" {
  user = aws_iam_user.ui.name
}

resource "aws_iam_user_policy" "ui_user_policy" {
  name = "ui-user-policy"
  user = aws_iam_user.ui.name

  policy = <<EOF
{
    "Version": "2012-10-17",
    "Statement": [
        {
            "Effect": "Allow",
            "Action": [              
              "cloudfront:*",
              "s3:*"              

      ],
            "Resource": "*"
        }
    ]
}
EOF
}

