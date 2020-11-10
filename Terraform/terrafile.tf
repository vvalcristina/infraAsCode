module "servers"{
    source = "./servers"
    #Input: tudo que não é source, version ou providers
    servers = 1  #Input 
}

#Informação exportada direto do modulo pai 
output "ip_address" {
  value = module.servers.ip_address
}
