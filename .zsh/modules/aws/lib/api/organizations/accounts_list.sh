aws_organizations_accounts_list() {
    shift 0

    log_and_run aws organizations list-accounts "$@"
}
