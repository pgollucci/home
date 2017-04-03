aws_glacier_job_output_get() {
    local account_id="$1"
    local vault_name="$2"
    local job_id="$3"
    shift 3

    log_and_run aws glacier get-job-output --account-id $account_id --vault-name $vault_name --job-id $job_id "$@"
}
