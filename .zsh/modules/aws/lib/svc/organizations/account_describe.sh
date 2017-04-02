aws_organizations_account_describe() {
    local account-id="$1"
    shift 1

    log_and_run aws organizations  --account-id $account_id "@"

}
