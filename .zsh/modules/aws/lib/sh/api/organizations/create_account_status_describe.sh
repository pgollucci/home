aws_organizations_create_account_status_describe() {
    local create_account_request_id="$1"
    shift 1

    log_and_run aws organizations describe-create-account-status --create-account-request-id $create_account_request_id "$@"
}
