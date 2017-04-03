aws_glacier_jobs_list() {
    local account_id="$1"
    local vault_name="$2"
    shift 2

    log_and_run aws glacier list-jobs --account-id $account_id --vault-name $vault_name "$@"
}
