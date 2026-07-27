output "generated_file_path" {
  description = "Path of the file managed by Terraform"
  value       = local_file.devops_demo.filename
}
