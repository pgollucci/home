aws_sms_on_demand_replication_run_start() {
    local replication_job_id="$1"
    shift 1

    cond_log_and_run aws sms start-on-demand-replication-run --replication-job-id $replication_job_id "$@"
}
