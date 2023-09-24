# IAM Policy and Role Creation

```hcl
resource "aws_iam_policy" "jenkins_iam_policy" {
  name = "newpolicy1"

  policy = jsonencode({
    Version = "2012-10-17"
    Statement = [
      {
        Effect = "Allow"
        Action = [
          "secretsmanager:GetSecretValue",
          "ssm:GetParameter",
          "ssm:GetParameters",
          "ssm:GetParametersByPath"
        ]
        Resource = "*"
      }
    ]
  })
}

# Create an IAM role
resource "aws_iam_role" "jenkins_role" {
  name = "newrole1"

  assume_role_policy = jsonencode({
    Version = "2012-10-17"
    Statement = [
      {
        Effect = "Allow"
        Principal = {
          Service = "ec2.amazonaws.com"
        }
        Action = "sts:AssumeRole"
      }
    ]
  })
}

# Attach the IAM policy to the IAM role
resource "aws_iam_policy_attachment" "jenkins_role_policy_attachment" {
  name = "Policy Attachement"
  policy_arn = aws_iam_policy.jenkins_iam_policy.arn
  roles       = [aws_iam_role.jenkins_role.name]
}
```
