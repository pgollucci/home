aws_organizations_handshakes_for_account_list() {
    shift 0

    log_and_run aws organizations list-handshakes-for-account "$@"
}
