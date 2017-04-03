aws_organizations_organization_describe() {
    shift 0

    log_and_run aws organizations describe-organization "$@"
}
