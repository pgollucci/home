aws_glacier_vault_notifications_delete() {
    local account-id="$1"
    local vault-name="$2"
    shift 2

    cond_log_and_run aws glacier  --account-id $account_id --vault-name $vault_name "@"

}
