aws_importexport_job_create() {
    local manifest="$1"
    local job-type="$2"
    local validate-only="$3"
    shift 3

    cond_log_and_run aws importexport  --manifest $manifest --job-type $job_type --validate-only $validate_only "@"

}
