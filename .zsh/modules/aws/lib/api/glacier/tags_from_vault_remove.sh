aws_glacier_tags_from_vault_remove() {
    local account_id="$1"
    local vault_name="$2"
    shift 2

    cond_log_and_run aws glacier remove-tags-from-vault --account-id $account_id --vault-name $vault_name "$@"
}
