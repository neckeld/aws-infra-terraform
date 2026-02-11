output "s3_bucket_url" {
  description = "URL para acessar o index.html no LocalStack"
  value       = "http://localhost:4566/${aws_s3_bucket.meu_primeiro_bucket.id}/index.html"
}

output "ec2_instance_id" {
  description = "ID da instância EC2 criada"
  value       = aws_instance.servidor_estudo.id
}

output "vpc_id" {
  description = "ID da VPC criada"
  value       = aws_vpc.main_vpc.id
}