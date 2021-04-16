# AWS
variable "aws_region" {
  description = "The AWS region for deployment."
  type = string
  default = "eu-west-2"
}

variable "aws_profile" {
  description = "The AWS profile to use for deployment."
  type = string
  default = "development-eu-west-2"
}

variable "aws_bucket" {
  description = "The bucket used to store the current terraform state files."
  type = string
}

variable "ec2_key_pair_name" {
  description = "The key pair for SSH access to ec2 instances in the clusters."
  type = string
}

variable "ec2_instance_type" {
  description = "The instance type for ec2 instances in the clusters."
  type = string
  default = "t3.medium"
}

variable "ec2_image_id" {
  description = "The machine image name for the ECS cluster launch configuration."
  type = string
  default = "ami-007ef488b3574da6b"
}

# Deployment
variable "environment" {
  description = "The environment this stack will be created for."
  type = string
}

variable "deploy_to" {
  description = "Bucket namespace used with remote_state_bucket and state_prefix."
  type = string
}

variable "state_prefix" {
  description = "The bucket prefix used with the remote_state_bucket files."
  type = string
}

variable "docker_registry" {
  description = "The FQDN of the Docker registry."
  type = string
}

variable "release_version" {
  description = "The version of data-reconciliation that will be deployed."
  type = string
}

# Secrets
variable "vault_username" {
  description = "The username used by the Vault provider."
  type = string
}

variable "vault_password" {
  description = "The password used by the Vault provider."
  type = string
}

# App configuration
variable "company_count_crontab" {
  description = "A crontab expression that will be used to trigger a comparison of company counts."
  type = string
}

variable "company_collection_crontab" {
  description = "A crontab expression that will be used to trigger a comparison of company numbers."
  type = string
}

variable "jdbc_driver" {
  description = "The classname of the JDBC driver that will be used to connect to the database."
  type = string
  default = "com.oracle.OracleDriver"
}

variable "company_count_oracle" {
  description = "The endpoint that will be used to obtain a count of corporate bodies from CHIPS DB."
  type = string
  default = "jdbc:dataSource?outputType=SelectOne"
}

variable "company_count_mongodb" {
  description = "The endpoint that will be used to count company profile records in MongoDB."
  type = string
  default = "mongodb:mongo?database=company_profile&collection=company_profile&operation=count"
}

variable "company_collection_oracle" {
  description = "The endpoint that will be used to obtain a list of incorporation numbers from CHIPS DB."
  type = string
  default = "jdbc:dataSource"
}

variable "company_collection_mongodb" {
  description = "The endpoint that will be used to retrieve an array of distinct company profile ids from MongoDB."
  type = string
  default = "mongodb:mongo?database=company_profile&collection=company_profile&operation=findDistinct"
}

variable "endpoint_output" {
  description = "The endpoint that results will be sent to."
  type = string
  default = "log:application"
}