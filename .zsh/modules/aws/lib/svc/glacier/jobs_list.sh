aws_glacier_jobs_list() {
    local vault-name="$1"
    local account-id="$2"
    shift 2

    log_and_run aws glacier  --vault-name $vault_name --account-id $account_id "@"

}
