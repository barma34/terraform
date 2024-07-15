cd azure-vm-docker
terraform init
terraform apply -var "location=eastus" -var "vmsize=Standard_B1s" -var "resource_group_name=docker" -auto-approve

terraform destroy

learningthoughts