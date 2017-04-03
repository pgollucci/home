aws_glacier_tags_for_vault_list() {
    local account_id="$1"
    local vault_name="$2"
    shift 2

    log_and_run aws glacier list-tags-for-vault --account-id $account_id --vault-name $vault_name "$@"
}
