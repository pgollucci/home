aws_sms_replication_job_create() {
    local seed-replication-time="$1"
    local server-id="$2"
    local frequency="$3"
    shift 3

    cond_log_and_run aws sms  --seed-replication-time $seed_replication_time --server-id $server_id --frequency $frequency "@"

}
