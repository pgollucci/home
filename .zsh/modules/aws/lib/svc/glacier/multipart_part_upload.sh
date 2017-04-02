aws_glacier_multipart_part_upload() {
    local upload-id="$1"
    local account-id="$2"
    local vault-name="$3"
    shift 3

    cond_log_and_run aws glacier  --upload-id $upload_id --account-id $account_id --vault-name $vault_name "@"

}
