resource "aws_iam_role" "bg_tf_iam_glue_role" {
  name = "bg_tf_iam_glue_role"

  assume_role_policy = <<EOF
{
  "Version": "2012-10-17",
  "Statement": [
    {
      "Sid": "",
      "Effect": "Allow",
      "Principal": {
        "Service": "glue.amazonaws.com"
      },
      "Action": "sts:AssumeRole"
    }
  ]
}
EOF
}

resource "aws_iam_role_policy_attachment" "glue_bucket_access" {
  role       = aws_iam_role.bg_tf_iam_glue_role.name
  policy_arn = "arn:aws:iam::aws:policy/service-role/AWSGlueServiceRole"
}

resource "aws_iam_policy" "bg_tf_s3_bucket_policy" {
  name        = "bg_tf_s3_bucket_policy"
  path        = "/"
  description = "Policy for accessing S3 buckets"

  policy = <<EOF
{
  "Version": "2012-10-17",
  "Statement": [
    {
      "Sid": "S3BucketPermissions",
      "Effect": "Allow",
      "Action": [
        "s3:GetObject",
        "s3:PutObject",
        "s3:ListBucket",
        "s3:DeleteObject",
        "s3:GetEncryptionConfiguration",
        "s3:GetBucketRequestPayment",
        "s3:GetBucketLocation"
      ],
      "Resource": [
        "arn:aws:s3:::bg-tf-raw",
        "arn:aws:s3:::bg-tf-raw/*",
        "arn:aws:s3:::bg-tf-staging",
        "arn:aws:s3:::bg-tf-staging/*",
        "arn:aws:s3:::bg-tf-consume",
        "arn:aws:s3:::bg-tf-consume/*"
      ]
    }
  ]
}
EOF
}

resource "aws_iam_role_policy_attachment" "s3_bucket_access_attachment" {
  role       = aws_iam_role.bg_tf_iam_glue_role.name
  policy_arn = aws_iam_policy.bg_tf_s3_bucket_policy.arn
}