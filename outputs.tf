output "ip_publico_instancia" {
  description = "IP público da instância"
  value       = aws_instance.nodo_desenvolvimento.public_ip
  
}