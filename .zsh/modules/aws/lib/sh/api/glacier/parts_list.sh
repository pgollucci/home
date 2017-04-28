aws_glacier_parts_list() {
    local account_id="$1"
    local vault_name="$2"
    local upload_id="$3"
    shift 3

    log_and_run aws glacier list-parts --account-id $account_id --vault-name $vault_name --upload-id $upload_id "$@"
}
