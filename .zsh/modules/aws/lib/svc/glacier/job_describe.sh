aws_glacier_job_describe() {
    local job-id="$1"
    local account-id="$2"
    local vault-name="$3"
    shift 3

    log_and_run aws glacier  --job-id $job_id --account-id $account_id --vault-name $vault_name "@"

}
