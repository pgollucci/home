aws_glacier_tags_to_vault_add() {
    local vault-name="$1"
    local account-id="$2"
    shift 2

    cond_log_and_run aws glacier  --vault-name $vault_name --account-id $account_id "@"

}
