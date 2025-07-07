resource "aws_instance" "test_ec2" {
    ami = var.ami_id
    instance_type = var.instance_type
    key_name = var.key_name
    tags = {
      Name = "new_ec2"
    }
}