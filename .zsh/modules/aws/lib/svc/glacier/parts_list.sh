aws_glacier_parts_list() {
    local upload-id="$1"
    local vault-name="$2"
    local account-id="$3"
    shift 3

    log_and_run aws glacier  --upload-id $upload_id --vault-name $vault_name --account-id $account_id "@"

}
