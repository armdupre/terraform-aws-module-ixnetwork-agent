# module-ixnetwork-agent/aws

## Description
Terraform module for IxNetwork agent deployment on Amazon Web Services

## Deployment
This module creates a single instance having three network interfaces.

## Usage
```tf
module "Agent" {
	source  = "armdupre/module-ixnetwork-agent/aws"
	Eth0SecurityGroupId = aws_security_group.PublicSecurityGroup.id
	Eth0SubnetId = aws_subnet.PublicSubnet.id
	Eth1SecurityGroupId = aws_security_group.Private1SecurityGroup.id
	Eth1SubnetId = aws_subnet.Private1Subnet.id
	Eth2SecurityGroupId = aws_security_group.Private2SecurityGroup.id
	Eth2SubnetId = aws_subnet.Private2Subnet.id
	PlacementGroupId = aws_placement_group.PlacementGroup.id
}
```