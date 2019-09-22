resource "aws_s3_bucket" "sample" {
  bucket = "dngo.sample"
  acl    = "public-read"
}

resource "aws_s3_bucket_policy" "sample_public_policy" {
  bucket = "${aws_s3_bucket.sample.id}"

  policy = <<POLICY
{
  "Version": "2012-10-17",
  "Statement": [
    {
      "Sid": "PublicReadGetObject",
      "Effect": "Allow",
      "Principal": "*",
      "Action": "s3:GetObject",
      "Resource": "arn:aws:s3:::dngo.sample/*"
    }
  ]
}
POLICY
}
