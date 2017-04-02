aws_glacier_vault_lock_complete() {
    local lock-id="$1"
    local account-id="$2"
    local vault-name="$3"
    shift 3

    cond_log_and_run aws glacier  --lock-id $lock_id --account-id $account_id --vault-name $vault_name "@"

}
