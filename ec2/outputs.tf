output "instance_id1" {
  description = "The ID of the EC2 machine"
  value       = aws_instance.my_app[0].id
}

output "instance_id2" {
  description = "The ID of the EC2 machine"
  value       = aws_instance.my_app[1].id
}
