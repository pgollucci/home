aws_glacier_multipart_upload_initiate() {
    local account_id="$1"
    local vault_name="$2"
    shift 2

    cond_log_and_run aws glacier initiate-multipart-upload --account-id $account_id --vault-name $vault_name "$@"
}
