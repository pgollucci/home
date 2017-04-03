aws_organizations_accounts_for_parent_list() {
    local parent_id="$1"
    shift 1

    log_and_run aws organizations list-accounts-for-parent --parent-id $parent_id "$@"
}
