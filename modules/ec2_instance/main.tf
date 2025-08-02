resource "aws_instance" "this" {
  
  ami = var.ami
  instance_type = var.instance_type
  availability_zone = var.availability_zone
  key_name =  var.key_name
  subnet_id = var.subnet_id
  vpc_security_group_ids = var.vpc_security_group_ids
  associate_public_ip_address = var.associate_public_ip_address
  ebs_optimized = var.ebs_optimized
  monitoring = var.monitoring
  iam_instance_profile = var.iam_instance_profile
  user_data = var.user_data
  user_data_base64 = var.user_data_base64
  private_ip = var.private_ip
  disable_api_termination = var.disable_api_termination
  instance_initiated_shutdown_behavior = var.shutdown_behavior
  source_dest_check = var.source_dest_check
  get_password_data = var.get_password_data
  hibernation =  var.hibernation
  host_id = var.host_id
  tenancy = var.tenancy

  root_block_device {
    volume_type = var.root_block_device.volume_type
    volume_size = var.root_block_device.volume_size
    delete_on_termination = var.root_block_device.delete_on_termination
    encrypted = var.root_block_device.encrypted
    # iops = var.root_block_device.iops
    # throughput = var.root_block_device.throughput
  }

  tags = var.tags
  
}