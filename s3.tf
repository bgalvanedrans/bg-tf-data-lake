# Create raw S3 bucket
resource "aws_s3_bucket" "bg_tf_raw_db" {
  bucket = "bg-tf-raw"  # Replace with your desired bucket name
}

# Configure bucket versioning
resource "aws_s3_bucket_versioning" "bucket_versioning_raw" {
  bucket = aws_s3_bucket.bg_tf_raw_db.id
  versioning_configuration {
    status = "Enabled"
  }
}

# Configure bucket server-side encryption
resource "aws_s3_bucket_server_side_encryption_configuration" "bucket_encryption_raw" {
  bucket = aws_s3_bucket.bg_tf_raw_db.id

  rule {
    apply_server_side_encryption_by_default {
      sse_algorithm     = "AES256"
    }
  }
}


#Create scripts/ folder
resource "aws_s3_object" "script_folder" {
    bucket = aws_s3_bucket.bg_tf_raw_db.id
    acl    = "private"
    key    = "scripts/"
}

#Create raw/ folder
resource "aws_s3_object" "raw_folder" {
    bucket = aws_s3_bucket.bg_tf_raw_db.id
    acl    = "private"
    key    = "raw/"
}

#Create queries/ folder
resource "aws_s3_object" "queries_folder" {
    bucket = aws_s3_bucket.bg_tf_raw_db.id
    acl    = "private"
    key    = "queries/"
}



# Create staging S3 bucket
resource "aws_s3_bucket" "bg_tf_staging_db" {
  bucket = "bg-tf-staging"  # Replace with your desired bucket name
}

# Configure bucket versioning
resource "aws_s3_bucket_versioning" "bucket_versioning_staging" {
  bucket = aws_s3_bucket.bg_tf_staging_db.id
  versioning_configuration {
    status = "Enabled"
  }
}

# Configure bucket server-side encryption
resource "aws_s3_bucket_server_side_encryption_configuration" "bucket_encryption_staging" {
  bucket = aws_s3_bucket.bg_tf_staging_db.id

  rule {
    apply_server_side_encryption_by_default {
      sse_algorithm     = "AES256"
    }
  }
}


#Create compressed-parquet/ folder
resource "aws_s3_object" "compressed_parquet_folder_staging" {
    bucket = aws_s3_bucket.bg_tf_staging_db.id
    acl    = "private"
    key    = "compressed-parquet/"
}


# Create consume S3 bucket
resource "aws_s3_bucket" "bg_tf_consume_db" {
  bucket = "bg-tf-consume"  # Replace with your desired bucket name
}

# Configure bucket versioning
resource "aws_s3_bucket_versioning" "bucket_versioning_consume" {
  bucket = aws_s3_bucket.bg_tf_consume_db.id
  versioning_configuration {
    status = "Enabled"
  }
}

# Configure bucket server-side encryption
resource "aws_s3_bucket_server_side_encryption_configuration" "bucket_encryption_consume" {
  bucket = aws_s3_bucket.bg_tf_consume_db.id

  rule {
    apply_server_side_encryption_by_default {
      sse_algorithm     = "AES256"
    }
  }
}

#Create compressed-parquet/ folder
resource "aws_s3_object" "compressed_parquet_folder_consume" {
    bucket = aws_s3_bucket.bg_tf_consume_db.id
    acl    = "private"
    key    = "compressed-parquet/"
}