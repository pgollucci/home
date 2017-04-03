aws_glacier_multipart_uploads_list() {
    local account_id="$1"
    local vault_name="$2"
    shift 2

    log_and_run aws glacier list-multipart-uploads --account-id $account_id --vault-name $vault_name "$@"
}
