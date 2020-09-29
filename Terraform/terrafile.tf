module "servers" {
  source = "./servers"
  servers = 1
  providers = {
      aws = "aws.usw2"
  }
}

output "ip_address" {
  value = module.servers.ip_address
}

