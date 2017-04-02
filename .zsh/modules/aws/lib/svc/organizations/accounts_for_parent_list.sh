aws_organizations_accounts_for_parent_list() {
    local parent-id="$1"
    shift 1

    log_and_run aws organizations  --parent-id $parent_id "@"

}
