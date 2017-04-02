aws_sms_replication_runs_get() {
    local replication-job-id="$1"
    shift 1

    log_and_run aws sms  --replication-job-id $replication_job_id "@"

}
