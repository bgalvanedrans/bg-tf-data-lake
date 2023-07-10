#resource "aws_kinesis_data_generator_stream" "data_stream" {
#  name      = "bg-tf-data-stream"
#  region    = "us-east-1"  # Replace with your desired AWS region
#  data_type = "json"
#  format    = "raw"

#  s3_destination {
#    bucket_arn = "arn:aws:s3:::bg-tf-raw"
#    prefix     = "/"
#  }
#}