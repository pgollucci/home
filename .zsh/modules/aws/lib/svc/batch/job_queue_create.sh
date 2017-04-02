aws_batch_job_queue_create() {
    local compute-environment-order="$1"
    local job-queue-name="$2"
    local priority="$3"
    shift 3

    cond_log_and_run aws batch  --compute-environment-order $compute_environment_order --job-queue-name $job_queue_name --priority $priority "@"

}
