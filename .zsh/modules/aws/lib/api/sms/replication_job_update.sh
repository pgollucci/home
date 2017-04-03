aws_sms_replication_job_update() {
    local replication_job_id="$1"
    shift 1

    cond_log_and_run aws sms update-replication-job --replication-job-id $replication_job_id "$@"
}
