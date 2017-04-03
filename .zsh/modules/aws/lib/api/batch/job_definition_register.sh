aws_batch_job_definition_register() {
    local job_definition_name="$1"
    local type="$2"
    shift 2

    cond_log_and_run aws batch register-job-definition --job-definition-name $job_definition_name --type $type "$@"
}
