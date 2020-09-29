data "aws_ami" "ubuntu" {
  most_recent = true

  filter {
    name   = "name"
    values = ["IaaSWeek-${var.hash_commit}"]
  }

  owners = ["178520105998"] # Gomex ID, não mude sem mudar o filtro
}

resource "aws_instance" "web" {
  count = var.servers
  ami           = data.aws_ami.ubuntu.id
  instance_type = "t2.micro"
  subnet_id = "subnet-ae04f49f"
  
  
  tags = {
    Name = "HelloWorld"
  }
}
