#VPC
#subnet
#internetGateway
#route table
#route table association
#securitygroup

#aws_vpc
resource "aws_vpc" "HUB-QDG-AWS" {
  cidr_block = "10.1.0.0/16"

  tags = {
    Name = "hub-terraform"
  }
}

#aws_subnet
resource "aws_subnet" "Subnet_linux" {
  vpc_id     = aws_vpc.HUB-QDG-AWS.id
  cidr_block = "10.1.0.0/24"

  tags = {
    Name = "subnet-terraform"
  }
}

#internetGateway

resource "aws_internet_gateway" "internet_gateway" {
  vpc_id = aws_vpc.HUB-QDG-AWS.id

  tags = {
    Name = "internet-gateway-terraform"
  }
}

#route table

resource "aws_route_table" "RT-linux" {
  vpc_id = aws_vpc.HUB-QDG-AWS.id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.internet_gateway.id
  }

  tags = {
    Name = "route-table-terraform"
  }
}

#route table association

resource "aws_route_table_association" "rta" {
  subnet_id      = aws_subnet.Subnet_linux.id
  route_table_id = aws_route_table.RT-linux.id
}

#securitygroup


resource "aws_security_group" "allow_ssh" {
  name        = "allow_ssh"
  description = "Permitir access na porta 22 da Vm"
  vpc_id      = aws_vpc.HUB-QDG-AWS.id

  tags = {
    Name = "allow_ssh"
  }
}

#vamos aqui apenas permitir a porta 22 para um ip publico para a vpc (para subnet tem de ser acl)
resource "aws_security_group" "sg-access-to-linux" {
  name        = "access-to-linux"
  description = "Security group for Linux access"
  vpc_id      = aws_vpc.HUB-QDG-AWS.id # Substitui pela referência à tua VPC

  # Regra: Allow SSH
  ingress {
    description = "allow-SSH"
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["85.241.235.71/32"]
  }

  # Regra: Deny ANY (tráfego negado implicitamente na AWS)
  # Na AWS, todo o tráfego não explicitamente permitido é negado por defeito.
  # Não é necessária uma regra de deny explícita.

  egress {
    description = "Allow all outbound traffic"
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    Name = "access-to-linux"
  }
}
