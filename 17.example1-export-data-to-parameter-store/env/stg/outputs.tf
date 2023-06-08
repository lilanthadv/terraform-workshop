output "s3_bucket_id" {
  description = "S3 Bucket Id"
  value       = "${module.s3.s3_bucket_id}"
}

output "s3_bucket_arn" {
  description = "S3 Bucket ARN"
  value       = "${module.s3.s3_bucket_arn}"
}