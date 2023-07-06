output "ec2_public_ip" {
    value = module.docker-server.instance.public_ip
}
