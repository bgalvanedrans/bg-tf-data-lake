resource "aws_glue_catalog_database" "raw_db" {
  name = "bg-tf-raw-database"
}

resource "aws_glue_catalog_database" "staging_db" {
  name = "bg-tf-staging-database"
}

resource "aws_glue_catalog_database" "consume_db" {
  name = "bg-tf-consume-database"
}