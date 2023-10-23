##Generates a secure private key
resource "tls_private_key" "ssh_key" {
  algorithm = "RSA"
  rsa_bits  = 4096
}

##Create aws_key_pair to ssh into ec2
resource "aws_key_pair" "ssh_key" {
  key_name   = "web"
  public_key = tls_private_key.ssh_key.public_key_openssh
}

##To get AMI ID for use in EC2 resources
data "aws_ami" "amazon-linux-2" {
 most_recent = true
 filter {
   name   = "owner-alias"
   values = ["amazon"]
 }
 filter {
   name   = "name"
   values = ["amzn2-ami-hvm*"]
 }
}

##Create AWS EC2 using ami from above data source and user data script
resource "aws_instance" "my_app" {
  count         =  2
  ami           = data.aws_ami.amazon-linux-2.id
  instance_type = var.instance_size
  subnet_id     = var.private_subnets[0]

  vpc_security_group_ids = [aws_security_group.ec2_sg.id] 
  iam_instance_profile  = aws_iam_instance_profile.iam_profile.name
  user_data  =   file("${path.module}/init.sh")
  key_name      = aws_key_pair.ssh_key.key_name
  tags = {
        Terraform = "true"
        Name       = "webserver" 
        Backup      = "true"
  }
}

## Allow EBS Encryption for aws region
resource "aws_ebs_encryption_by_default" "ebs_encrypt" {
  enabled = var.ebs_encryption
}

