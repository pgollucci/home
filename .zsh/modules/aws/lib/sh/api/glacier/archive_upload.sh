aws_glacier_archive_upload() {
    local vault_name="$1"
    local account_id="$2"
    shift 2

    cond_log_and_run aws glacier upload-archive --vault-name $vault_name --account-id $account_id "$@"
}
