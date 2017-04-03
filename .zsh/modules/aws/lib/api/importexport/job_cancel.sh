aws_importexport_job_cancel() {
    local job_id="$1"
    shift 1

    cond_log_and_run aws importexport cancel-job --job-id $job_id "$@"
}
