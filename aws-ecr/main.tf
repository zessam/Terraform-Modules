resource "aws_ecr_repository" "this" {
  name = var.name
  image_tag_mutability = var.image_tag_mutability

  image_scanning_configuration {
    scan_on_push = var.image_scanning_enabled
  }

  tags = merge(var.tags, { "Name" = replace(var.name, "/", "-") })
}

resource "aws_ecr_lifecycle_policy" "this" {
  repository = aws_ecr_repository.this
    policy     = <<EOF
{
    "rules": [
        {
            "rulePriority": 1,
            "description": "Expire images older than 90 days",
            "selection": {
                "tagStatus": "untagged",
                "countType": "sinceImagePushed",
                "countUnit": "days",
                "countNumber": 90
            },
            "action": {
                "type": "expire"
            }
        }
    ]
}
EOF
}