output "private_key_path" {
  value = local_file.private_key.filename
}

output "public_key_path" {
  value = local_file.public_key.filename
}

output "key_name" {
  value = module.aws_key_pair.key_name
}