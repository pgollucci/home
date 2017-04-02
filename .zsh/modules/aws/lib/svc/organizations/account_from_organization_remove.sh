aws_organizations_account_from_organization_remove() {
    local account-id="$1"
    shift 1

    cond_log_and_run aws organizations  --account-id $account_id "@"

}
