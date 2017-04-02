aws_importexport_job_update() {
    local job-id="$1"
    local validate-only="$2"
    local job-type="$3"
    local manifest="$4"
    shift 4

    cond_log_and_run aws importexport  --job-id $job_id --validate-only $validate_only --job-type $job_type --manifest $manifest "@"

}
