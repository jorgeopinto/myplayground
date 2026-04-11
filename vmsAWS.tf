resource "aws_key_pair" "key" {
  key_name   = "aws-key.pipelines"
  public_key = var.aws_key_pub
}

resource "aws_instance" "vm" {
  ami           = "ami-05852c5f195d545ea"
  instance_type = "t2.micro"
  key_name = aws_key_pair.key.key_name
  subnet_id = aws_subnet.Subnet_linux.id
  vpc_security_group_ids = [aws_security_group.sg-access-to-linux.id]
  associate_public_ip_address = true


  tags = {
    Name = "Linux_AWS"
  }
}