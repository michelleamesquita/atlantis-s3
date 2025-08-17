output "region" {
  value = var.region
}

output "bucket_name" {
  value = aws_s3_bucket.example.bucket
}
