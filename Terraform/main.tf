resource "aws_instance" "test_ec2" {
  count = var.count_number
  ami = var.ami_id
  instance_type = var.instance_type
  key_name = var.key_name
  tags = {
    Name = "new_ec2 ${count.index + 1}"
  }
}