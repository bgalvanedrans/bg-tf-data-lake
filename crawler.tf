resource "aws_glue_crawler" "crawler_s3" {
  database_name = "bg-tf-raw-database"
  name          = "bg-tf-crawler-raw"
  role          = "arn:aws:iam::385653850465:role/bg_tf_iam_glue_role"

  s3_target {
    path = "s3://bg-tf-raw/raw/"
  }
}