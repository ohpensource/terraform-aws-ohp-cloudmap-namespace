resource "aws_iam_policy" "iam_read_only_policy" {
  name = "cloudmap-read-only-${var.name}-policy"
  policy = jsonencode({
    Version = "2012-10-17"
    Statement = [
      {
        Action = local.iam_read_only_actions
        Effect = "Allow"
        Resource = "*"
      }
    ]
  })
  tags = var.tags
}

resource "aws_iam_role" "iam_read_only_role" {
  count = var.create_iam_read_only_role ? 1 : 0
  name = "cloudmap-read-only-${var.name}"
  assume_role_policy = jsonencode({
    Version = "2012-10-17"
    Statement = [
      {
        Action = "sts:AssumeRole"
        Effect = "Allow"
        Principal = {
          AWS = sort(local.iam_read_only_principals)
        }
      }
    ]
  })
  managed_policy_arns = [aws_iam_policy.iam_read_only_policy.arn]
  tags = var.tags
}

resource "aws_iam_policy" "iam_read_write_policy" {
  name = "cloudmap-read-write-${var.name}-policy"
  policy = jsonencode({
    Version = "2012-10-17"
    Statement = [
      {
        Action = local.iam_read_write_actions
        Effect = "Allow"
        Resource = "*"
      },
    ]
  })
  tags = var.tags
}

resource "aws_iam_role" "iam_read_write_role" {
  count = var.create_iam_read_write_role ? 1 : 0
  name = "cloudmap-read-write-${var.name}"
  assume_role_policy = jsonencode({
    Version = "2012-10-17"
    Statement = [
      {
        Action = "sts:AssumeRole"
        Effect = "Allow"
        Principal = {
          AWS = sort(local.iam_read_write_principals)
        }
      }
    ]
  })
  managed_policy_arns = [aws_iam_policy.iam_read_write_policy.arn]
  tags = var.tags
}
