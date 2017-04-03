aws_batch_job_definitions_describe() {
    shift 0

    log_and_run aws batch describe-job-definitions "$@"
}
