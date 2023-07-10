resource "aws_glue_workflow" "bg-tf-glue-workflow" {
  name = "bg-tf-glue-workflow"
}

resource "aws_glue_trigger" "bg-tf-glue-workflow-start" {
  name          = "bg-tf-glue-workflow-start"
  type          = "ON_DEMAND"
  workflow_name = aws_glue_workflow.bg-tf-glue-workflow.name

  actions {
    job_name = "bg-tf-glue-job-raw-to-staging"
  }
}

resource "aws_glue_trigger" "bg-tf-glue-workflow-inner" {
  name          = "bg-tf-glue-workflow-trigger-inner"
  type          = "CONDITIONAL"
  workflow_name = aws_glue_workflow.bg-tf-glue-workflow.name

  predicate {
    conditions {
      job_name = "bg-tf-glue-job-raw-to-staging"
      state    = "SUCCEEDED"
    }
  }

  actions {
    job_name = "bg-tf-glue-job-staging-to-consume"
  }
}