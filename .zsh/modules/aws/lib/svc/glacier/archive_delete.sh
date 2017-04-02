aws_glacier_archive_delete() {
    local account-id="$1"
    local vault-name="$2"
    local archive-id="$3"
    shift 3

    cond_log_and_run aws glacier  --account-id $account_id --vault-name $vault_name --archive-id $archive_id "@"

}
