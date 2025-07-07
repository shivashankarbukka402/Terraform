resource "null_resource" "local_provisioners" {
  provisioner "local-exec" {
    command = "echo ${var.ec2_public_ip} > conf/inventory"
  }
}