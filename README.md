# Onboarding bg-tf-data-lake

Full documentation where I explain my journey solving this task asked in my onboarding **Let's start!**

![img](https://raw.githubusercontent.com/bgalvanedrans/bg-tf-data-lake/main/pictures/Captura%20de%20pantalla%20de%202023-07-11%2011-45-52.png)

## Prerequisites
### Providers

Region us-east-1 and terraform version 5.6.2 were defined over this .tf file.

### S3 buckets

3 buckets were created as asked: bg-tf-raw, bg-tf-staging and bg-tf-consume. Inside bg-tf-raw bucket we need to create raw/ and scripts/ folders. Also inside the two other buckets, we may create compressed-parquet/ folder.

### IAM Role

We need to create bg_tf_iam_glue_role role with glue service role and full access (GetObject, PutObject, ListBucket, DeleteObject, GetEncryptionConfiguration, GetBucketRequestPayment, GetBucketLocation) to all our buckets.


## Data Lake Creation
### Input

Input was resolved by using Kinesis Data Generator and Stream Kinesis Firehose both already existing as one of the many ways to input data over bg-tf-raw/raw/ bucket.

## Glue Jobs

Job bg-tf-glue-job-raw-to-staging is taking data from bg-tf-raw/raw/ bucket and applies an schema change leaving affected data in bg-tf-staging/compressed-parquet/ bucket. Job bg-tf-glue-job-staging-to-consume has same process moving data from bg-tf-staging/compressed-parquet/ bucket to bg-tf-consume/compressed-parquet/ bucket.

### Glue Workflow (Added to the onboarding)

Workflow created to automatically run both jobs (raw to staging & staging to consume) with next command:

aws glue start-workflow-run --name bg-tf-glue-workflow

![img](https://raw.githubusercontent.com/bgalvanedrans/bg-tf-data-lake/main/pictures/Captura%20de%20pantalla%20de%202023-07-10%2015-52-25.png)

