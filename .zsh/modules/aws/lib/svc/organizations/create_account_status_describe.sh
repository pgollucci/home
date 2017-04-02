aws_organizations_create_account_status_describe() {
    local create-account-request-id="$1"
    shift 1

    log_and_run aws organizations  --create-account-request-id $create_account_request_id "@"

}
