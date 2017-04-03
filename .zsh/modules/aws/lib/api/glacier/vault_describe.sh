aws_glacier_vault_describe() {
    local account_id="$1"
    local vault_name="$2"
    shift 2

    log_and_run aws glacier describe-vault --account-id $account_id --vault-name $vault_name "$@"
}
