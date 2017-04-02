aws_glacier_job_output_get() {
    local vault-name="$1"
    local account-id="$2"
    local job-id="$3"
    shift 3

    log_and_run aws glacier  --vault-name $vault_name --account-id $account_id --job-id $job_id "@"

}
