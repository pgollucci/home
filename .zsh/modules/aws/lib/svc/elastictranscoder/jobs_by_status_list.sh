aws_elastictranscoder_jobs_by_status_list() {
    local status="$1"
    shift 1

    log_and_run aws elastictranscoder  --status $status "@"

}
