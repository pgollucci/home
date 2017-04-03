aws_sms_replication_jobs_get() {
    shift 0

    log_and_run aws sms get-replication-jobs "$@"
}
