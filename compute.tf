# Geração da Chave Privada
resource "tls_private_key" "chave_privada" {
  algorithm = "RSA"
  rsa_bits  = 4096
}

# Registrando a Chave na AWS (LocalStack)
resource "aws_key_pair" "chave_ssh" {
  key_name   = "chave-daniel-estudo"
  public_key = tls_private_key.chave_privada.public_key_openssh
}

# Criando o arquivo .pem no seu computador
resource "local_file" "chave_pem" {
  content  = tls_private_key.chave_privada.private_key_pem
  filename = "${path.module}/chave-projeto.pem"
}

# Security Group (O Segurança da Porta)
resource "aws_security_group" "web_sg" {
  name        = "permitir_ssh"
  description = "Acesso via porta 22"
  vpc_id      = aws_vpc.main_vpc.id

  ingress {
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
}

# Instância EC2 (O Servidor Linux)
resource "aws_instance" "servidor_estudo" {
  ami                    = "ami-005e54dee72cc1d00"
  instance_type          = "t2.micro"
  subnet_id              = aws_subnet.public_subnet.id
  vpc_security_group_ids = [aws_security_group.web_sg.id]
  key_name               = aws_key_pair.chave_ssh.key_name

  tags = {
    Name = var.instance_name
  }
}