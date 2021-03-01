output "all_users" {
  value = aws_iam_user.example
  description = "The ARNs for all users"
}

output "all_users_arns" {
  value = values(aws_iam_user.example)[*].arn
}

output "upper_names" {
  value = [for name in var.user_names: upper(name)]
}

output "short_upper_names" {
  value = [for name in var.user_names: upper(name) if length(name) < 5]
}
