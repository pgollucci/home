aws_glacier_multipart_upload_abort() {
    local upload-id="$1"
    local vault-name="$2"
    local account-id="$3"
    shift 3

    cond_log_and_run aws glacier  --upload-id $upload_id --vault-name $vault_name --account-id $account_id "@"

}
