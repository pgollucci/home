aws_organizations_account_to_organization_invite() {
    local target="$1"
    shift 1

    cond_log_and_run aws organizations  --target $target "@"

}
