aws_glacier_tags_for_vault_list() {
    local account-id="$1"
    local vault-name="$2"
    shift 2

    log_and_run aws glacier  --account-id $account_id --vault-name $vault_name "@"

}
