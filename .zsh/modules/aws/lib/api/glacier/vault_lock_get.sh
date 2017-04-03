aws_glacier_vault_lock_get() {
    local account_id="$1"
    local vault_name="$2"
    shift 2

    log_and_run aws glacier get-vault-lock --account-id $account_id --vault-name $vault_name "$@"
}
