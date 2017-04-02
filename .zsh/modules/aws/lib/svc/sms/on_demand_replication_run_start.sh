aws_sms_on_demand_replication_run_start() {
    local replication-job-id="$1"
    shift 1

    cond_log_and_run aws sms  --replication-job-id $replication_job_id "@"

}
