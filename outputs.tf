output "jenkins_public_ip" {
  value       = aws_instance.jenkins_server.public_ip
  description = "Jenkins Server Public IP"
}

output "app_server_public_ip" {
  value       = aws_instance.app_server.public_ip
  description = "App Server Public IP"
}
