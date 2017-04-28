aws_glacier_multipart_part_upload() {
    local account_id="$1"
    local vault_name="$2"
    local upload_id="$3"
    shift 3

    cond_log_and_run aws glacier upload-multipart-part --account-id $account_id --vault-name $vault_name --upload-id $upload_id "$@"
}
