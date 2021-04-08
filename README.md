# Alicloud virtual machine and bucket with terraform

##### Helpful Links
[https://wi1dcard.dev/posts/terraform-quick-start-with-alibaba-cloud/](https://wi1dcard.dev/posts/terraform-quick-start-with-alibaba-cloud/)

[https://registry.terraform.io/providers/aliyun/alicloud/latest/docs](https://registry.terraform.io/providers/aliyun/alicloud/latest/docs)

[https://www.alibabacloud.com/help/doc-detail/95829.htm](https://www.alibabacloud.com/help/doc-detail/95829.htm)

##### Create RAM user with proper permissions and then create a terraform.tfvars file in the project root with the following
```
public_key_path = "content of public key goes here" 
host_name = "Alibaba"
key = "key goes here"
secret = "secret key goes here"
region = "us-west-1"
zone = "us-west-1a"

```

##### for the bucket terraform.tfvars
```
key = "key goes here"
secret = "secret key goes here"
region = "us-west-1"
zone = "us-west-1a"
```

##### regular terrform commands
```
terraform console
terraform fmt
terraform init
terraform init -reconfigure
terraform plan 

# formats plan to no color removes funny characters
terraform plan -no-color > tfplan.txt

terraform validate
terraform apply -auto-approve
terraform destroy -auto-approve

# output to formated json (jq needs to be installed) run after apply
terraform show -json | jq . > state.json

# target a specific terraform resource
terraform plan -target resource.name 
terraform apply -auto-approve

```
