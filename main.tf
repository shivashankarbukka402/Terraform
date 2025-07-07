module "create_ec2" {
    source = "./modules/create_ec2"
    ami_id = "ami-0f918f7e67a3323f0"
    instance_type = "t2.micro"
    key_name = "linux"
}    

module "copy_install" {
  source = "./modules/file"
  connection_user = "ubuntu"
  ec2_public_ip = module.create_ec2.public_ip
  pem_file = "./keys/linux.pem"
  source_path = "./conf/install.sh"
  destination_path = "/home/ubuntu/install.sh"
}
module "run_remote_commands" {
  source = "./modules/remote-exec"
  connection_user = "ubuntu"
  ec2_public_ip = module.create_ec2.public_ip
  pem_file = "./keys/linux.pem"
  commands = [ "chmod +x /home/ubuntu/install.sh",
               " sudo bash /home/ubuntu/install.sh" ]
}

module "local_exec" {
  source = "./modules/local-exec"
  ec2_public_ip = module.create_ec2.public_ip
}