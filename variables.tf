variable "AmiName" {
	default = "Ixia_Virtual_Test_Appliance_9.30.0.209_KVM BYOL-eaa16046-9580-4e91-8167-302d8cb0da84"
	description = "AMI name used for deploying instances"
	type = string
}

variable "AmiOwner" {
	default = "aws-marketplace"
	description = "Owner of AMI used for deploying instances"
	type = string
}

variable "Eth0PrivateIpAddress" {
	default = "10.0.10.11"
	description = "Private IP address associated with the first network interface"
	type = string
}

variable "Eth0SecurityGroupId" {
	description = "Id of the security group associated with first network interface"
	type = string
}

variable "Eth0SubnetId" {
	description = "Id of the subnet associated with the first network interface"
	type = string
}

variable "Eth1PrivateIpAddresses" {
	default = [ "10.0.2.12", "10.0.2.13", "10.0.2.14", "10.0.2.15", "10.0.2.16", "10.0.2.17", "10.0.2.18", "10.0.2.19", "10.0.2.20", "10.0.2.21" ]
	description = "List of IP addresses associated with the second network interface"
	type = list(string)
}

variable "Eth1SecurityGroupId" {
	description = "Id of the subnet associated with the second network interface"
	type = string
}

variable "Eth1SubnetId" {
	description = "Id of the security group associated with second network interface"
	type = string
}

variable "InstanceId" {
	default = "agent"
	description = "Id of the instance of this module that ensures uniqueness"
	type = string
}

variable "InstanceType" {
	default = "c5n.4xlarge"
	description = "Instance type of VM"
	type = string
	validation {
		condition = can(regex("c5n.18xlarge", var.InstanceType)) || can(regex("c5n.9xlarge", var.InstanceType)) || can(regex("c5n.4xlarge", var.InstanceType))
		error_message = "InstanceType must be one of (c5n.18xlarge | c5n.9xlarge | c5n.4xlarge) types."
	}
}

variable "PlacementGroupId" {
	description = "Id of the placment group to which instance has been deployed"
	type = string
}

variable "Tag" {
	default = "cyperf"
	description = "App ID tag of application using the deployment"
	type = string
}

variable "UserEmailTag" {
	default = "terraform@example.com"
	description = "Email address tag of user creating the deployment"
	type = string
	validation {
		condition = length(var.UserEmailTag) >= 14
		error_message = "UserEmailTag minimum length must be >= 14."
	}
}

variable "UserLoginTag" {
	default = "terraform"
	description = "Login ID tag of user creating the deployment"
	type = string
	validation {
		condition = length(var.UserLoginTag) >= 4
		error_message = "UserLoginTag minimum length must be >= 4."
	}
}

variable "UserProjectTag" {
	default = "module"
	description = "Project tag of user creating the deployment"
	type = string
}

variable "Version" {
	default = "2-1"
	description = "Versioning of the application using the deployment"
	type = string
}