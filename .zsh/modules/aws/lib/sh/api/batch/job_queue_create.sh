aws_batch_job_queue_create() {
    local job_queue_name="$1"
    local priority="$2"
    local compute_environment_order="$3"
    shift 3

    cond_log_and_run aws batch create-job-queue --job-queue-name $job_queue_name --priority $priority --compute-environment-order $compute_environment_order "$@"
}
