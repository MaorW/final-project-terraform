# Deployment steps for the [Red Project](https://drive.google.com/file/d/10p8pGgD14EbtHpU-fOyjrtS5whgc42oo/view)

1. [Install Terraform](https://developer.hashicorp.com/terraform/tutorials/aws-get-started/install-cli)

2. Install AWS CLI and [Configuring the AWS CLI](https://docs.aws.amazon.com/cli/latest/userguide/cli-chap-configure.html)

3. (Optional) - You may change to your region ID in the **variables.tf** file

4. (Optional) - You may set a non-default IAM profile's name as the value of the "profile" variable in the **variables.tf** file if you have more than one IAM profile

5. Execute the project - follow the commands from the **Red-Project-reactApp** directory:
```
terraform init

terraform plan -out tfplan

terraform apply "tfplan"
```

6. Connect to the instance with the reactApp_URL link

![Kiku](pic/Link-Instructions.png)

7. After finishing with the project you may destroy the infrustructure 
```
terraform destroy --auto-approve
```


## * Notes
```
The project will deploy on your chosen region:
* VPC: CIDR 10.1.0.0/16
* Public Subnet: CIDR 10.1.0.0/24
* Security Group: Allowing ports 3000 and 22 to the reactApp instance
```