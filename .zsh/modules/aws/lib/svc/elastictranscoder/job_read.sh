aws_elastictranscoder_job_read() {
    local id="$1"
    shift 1

    cond_log_and_run aws elastictranscoder  --id $id "@"

}
