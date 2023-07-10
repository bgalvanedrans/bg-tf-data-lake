# Onboarding bg-tf-data-lake

StackEdit stores your files in your browser, which means all your files are automatically saved locally and are accessible **offline!**

![img](https://handbook.edrans.com/assets/img/DiagramasArquitecturaServerlessDataLake_II.82d78f8f.jpg)

## S3 buckets

3 buckets were created as asked: bg-tf-raw, bg-tf-staging and bg-tf-consume. Inside bg-tf-raw bucket we need to create raw/ and scripts/ folders. Also inside the two other buckets, we may create compressed-parquet/ folder.
