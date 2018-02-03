resource "aws_ecr_repository" "php" {
  name = "uzair-php"

/*
- The below commands are needed to build and push docker images to ECR
*/

  provisioner "local-exec" {
    command     = "docker build -t uzair-php -f ${path.module}/../PHP-Dockerfile  ${path.module}/../"
    interpreter = ["bash", "-c"]
  }

  provisioner "local-exec" {
    command     = "docker tag uzair-php:latest ${aws_ecr_repository.php.repository_url}:latest"
    interpreter = ["bash", "-c"]
  }

  provisioner "local-exec" {
    command     = "docker push ${aws_ecr_repository.php.repository_url}:latest"
    interpreter = ["bash", "-c"]
  }

}

resource "aws_ecr_repository_policy" "policy-php" {
  repository = "${aws_ecr_repository.php.name}"

  policy = <<EOF
{
    "Version": "2008-10-17",
    "Statement": [
        {
            "Sid": "new policy",
            "Effect": "Allow",
            "Principal": "*",
            "Action": [
                "ecr:GetDownloadUrlForLayer",
                "ecr:BatchGetImage",
                "ecr:BatchCheckLayerAvailability",
                "ecr:PutImage",
                "ecr:InitiateLayerUpload",
                "ecr:UploadLayerPart",
                "ecr:CompleteLayerUpload",
                "ecr:DescribeRepositories",
                "ecr:GetRepositoryPolicy",
                "ecr:ListImages",
                "ecr:DeleteRepository",
                "ecr:BatchDeleteImage",
                "ecr:SetRepositoryPolicy",
                "ecr:DeleteRepositoryPolicy"
            ]
        }
    ]
}
EOF
}
