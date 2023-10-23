resource "aws_iam_role" "role" {
  name               = "devops_team"
  assume_role_policy = data.aws_iam_policy_document.assume_role.json
}

resource "aws_iam_instance_profile" "iam_profile" {
  name = "webserver_profile"
  role = aws_iam_role.role.name
}

data "aws_iam_policy_document" "assume_role" {
  statement {
    effect = "Allow"

    principals {
      type        = "Service"
      identifiers = ["ec2.amazonaws.com"]
    }

    actions = ["sts:AssumeRole"]
  }
}

data "aws_iam_policy" "VPCReadOnlyAccess" {
  arn = "arn:aws:iam::aws:policy/AmazonVPCReadOnlyAccess"
}

data "aws_iam_policy" "ELBReadOnlyAccess" {
  arn = "arn:aws:iam::aws:policy/ElasticLoadBalancingReadOnly"
}

resource "aws_iam_role_policy_attachment" "vpc-readonly-role-policy-attach" {
  role       = aws_iam_role.role.name
  policy_arn = data.aws_iam_policy.VPCReadOnlyAccess.arn
}

resource "aws_iam_role_policy_attachment" "elb-readonly-role-policy-attach" {
  role       = aws_iam_role.role.name
  policy_arn = data.aws_iam_policy.ELBReadOnlyAccess.arn
}