aws_sms_replication_job_update() {
    local replication-job-id="$1"
    shift 1

    cond_log_and_run aws sms  --replication-job-id $replication_job_id "@"

}
