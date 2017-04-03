aws_importexport_job_update() {
    local job_id="$1"
    local manifest="$2"
    local job_type="$3"
    local validate_only="$4"
    shift 4

    cond_log_and_run aws importexport update-job --job-id $job_id --manifest $manifest --job-type $job_type --validate-only $validate_only "$@"
}
