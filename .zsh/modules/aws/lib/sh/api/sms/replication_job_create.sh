aws_sms_replication_job_create() {
    local server_id="$1"
    local seed_replication_time="$2"
    local frequency="$3"
    shift 3

    cond_log_and_run aws sms create-replication-job --server-id $server_id --seed-replication-time $seed_replication_time --frequency $frequency "$@"
}
