resource "local_file" "devops_demo" {
  filename = "${path.module}/terraform-demo.txt"

  content = <<-EOT
  DevOps Portfolio
  Student: ${var.student_name}
  Managed by Terraform
  EOT
}
