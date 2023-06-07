resource "aws_ssm_parameter" "s3_bucket_id" {
  name        = "/${var.service}/${var.stage}/s3_bucket_id"
  description = "${var.stage} S3 Bucket Id"
  type        = "SecureString"
  value       = "${aws_s3_bucket.terraform_workshop.id}"
}

resource "aws_ssm_parameter" "s3_bucket_arn" {
  name        = "/${var.service}/${var.stage}/s3_bucket_arn"
  description = "${var.stage} S3 Bucket ARN"
  type        = "SecureString"
  value       = "${aws_s3_bucket.terraform_workshop.arn}"
}