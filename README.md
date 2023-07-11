# Onboarding bg-tf-data-lake

Full documentation where I explain my journey solving this task asked in my onboarding **Let's start!**

![img](https://handbook.edrans.com/assets/img/DiagramasArquitecturaServerlessDataLake_II.82d78f8f.jpg)

## Providers

Region us-east-1 and terraform version 5.6.2 were defined over this .tf file.

## S3 buckets

3 buckets were created as asked: bg-tf-raw, bg-tf-staging and bg-tf-consume. Inside bg-tf-raw bucket we need to create raw/ and scripts/ folders. Also inside the two other buckets, we may create compressed-parquet/ folder.

## IAM Role

We need to create bg_tf_iam_glue_role role with glue service role and full access (GetObject, PutObject, ListBucket, DeleteObject, GetEncryptionConfiguration, GetBucketRequestPayment, GetBucketLocation) to all our buckets.
