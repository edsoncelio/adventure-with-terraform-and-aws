output "public_ip" {
  value       = aws_instance.webserver-terraform.public_ip
  description = "IP publico do servidor"
}

