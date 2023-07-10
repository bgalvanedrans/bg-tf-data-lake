resource "aws_glue_job" "glue_job_raw_to_staging" {
  name     = "bg-tf-glue-job-raw-to-staging"
  role_arn = "arn:aws:iam::385653850465:role/bg_tf_iam_glue_role"
  glue_version = "4.0"
  worker_type               = "G.1X"
  number_of_workers = 5

  command {
    script_location = "s3://bg-tf-raw/scripts/bg-tf-script-raw-to-staging.py"
  }
}



resource "aws_glue_job" "glue_job_staging_to_consume" {
  name     = "bg-tf-glue-job-staging-to-consume"
  role_arn = "arn:aws:iam::385653850465:role/bg_tf_iam_glue_role"
  glue_version = "4.0"
  worker_type               = "G.1X"
  number_of_workers = 5

  command {
    script_location = "s3://bg-tf-raw/scripts/bg-tf-script-staging-to-consume.py"
  }
}