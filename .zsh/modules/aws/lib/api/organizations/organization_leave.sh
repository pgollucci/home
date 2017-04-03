aws_organizations_organization_leave() {
    shift 0

    cond_log_and_run aws organizations leave-organization "$@"
}
