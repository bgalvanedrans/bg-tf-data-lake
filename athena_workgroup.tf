resource "aws_athena_workgroup" "bg-tf-workgroup" {
  name = "bg-tf-workgroup"

  configuration {
    enforce_workgroup_configuration    = true
    publish_cloudwatch_metrics_enabled = true

    result_configuration {
      output_location = "s3://bg-tf-raw-db/queries/"
    }
  }
}