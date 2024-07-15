cd ec2-docker
terraform init
terraform apply -var "region=ap-south-1" -var "instance_type=t2.micro" -auto-approve

terraform destroy