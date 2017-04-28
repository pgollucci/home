aws_organizations_account_from_organization_remove() {
    local account_id="$1"
    shift 1

    cond_log_and_run aws organizations remove-account-from-organization --account-id $account_id "$@"
}
