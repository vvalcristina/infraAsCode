data "aws_ami" "ubuntu" {
  most_recent = true

  filter {
    name   = "name"
    values = ["TFState-${var.hash_commit}"]
  }

  owners = ["178520105998"] #My User
}

resource "aws_instance" "web" {
  count = 2
  ami           = data.aws_ami.ubuntu.id
  instance_type = "t2.micro"
  subnet_id = "subnet-ae04f49f"
  
  

  tags = {
    Name = "HelloWorld"
  }
}

resource "aws_instance" "west" {
  provider = aws.west
  ami           = "ami-06d51e91cea0dac8d"
  instance_type = "t2.micro"
  
  tags = {
    Name = "HelloWorld"
  }
}

