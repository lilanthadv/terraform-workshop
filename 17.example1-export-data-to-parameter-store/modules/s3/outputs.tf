output "s3_bucket_id" {
  description = "S3 Bucket Id"
  value       = "${aws_s3_bucket.terraform_workshop.id}"
}

output "s3_bucket_arn" {
  description = "S3 Bucket ARN"
  value       = "${aws_s3_bucket.terraform_workshop.arn}"
}