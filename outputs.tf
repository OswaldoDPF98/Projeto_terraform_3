output "ip_publico_instancia" {
  description = "IP público da instância"
  value       = aws_instance.instancia.public_ip
  
}