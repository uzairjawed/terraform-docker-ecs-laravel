resource "aws_ecr_repository" "nginx" {
  name = "uzair-nginx"

/*
 - This is required to login to ECR Repository - We will create 2 specific repositories below.
*/

  provisioner "local-exec" {
    command     = "export AWS_ACCESS_KEY_ID=\"${var.aws_access_key}\"; export AWS_SECRET_ACCESS_KEY=\"${var.aws_secret_key}\"; eval $(aws ecr get-login --no-include-email --region ${var.aws_region})"
    interpreter = ["bash", "-c"]
  }

/*
- The below commands are needed to build and push docker images to ECR
*/
   
  provisioner "local-exec" {
    command     = "docker build -t uzair-nginx -f ${path.module}/../NGINX-Dockerfile  ${path.module}/../"
    interpreter = ["bash", "-c"]
  }

  provisioner "local-exec" {
    command     = "docker tag uzair-nginx:latest ${aws_ecr_repository.nginx.repository_url}:latest"
    interpreter = ["bash", "-c"]
  }

  provisioner "local-exec" {
    command     = "docker push ${aws_ecr_repository.nginx.repository_url}:latest"
    interpreter = ["bash", "-c"]
  }

}

resource "aws_ecr_repository_policy" "policy-nginx" {
  repository = "${aws_ecr_repository.nginx.name}"

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


