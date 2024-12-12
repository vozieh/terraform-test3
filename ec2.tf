resource "aws_instance" "web" {
  ami           = "ami-0453ec754f44f9a4a"
  instance_type = "t3.micro"

  tags = {
    Name = "HelloWorld"
  }
}

# data "aws_ami" "ubuntu" {
#   most_recent = true
#   owners      = ["amazon"]
#   filter {
#     name   = "architecture"
#     values = ["arm64"]
#   }
#   filter {
#     name   = "name"
#     values = ["al2023-ami-2023*"]
#   }
# }


resource "aws_instance" "web2" {
  ami           = "ami-0453ec754f44f9a4a"
  instance_type = "t2.micro"

  tags = {
    Name = "jens-deployed."
  }
}